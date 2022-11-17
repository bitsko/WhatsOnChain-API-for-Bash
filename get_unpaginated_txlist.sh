#!/usr/bin/bash

set -e

woc_curl_GET(){
        curl -s --location --request GET \
	"https://api.whatsonchain.com/v1/bsv/main${1}"
}

woc_jq_GET(){
	jq<<<$(woc_curl_GET "${1}")
}

woc_pages(){
	woc_jq_GET "/block/hash/$1/page/$2"
}

woc_info(){
	woc_jq_GET "/chain/info"
}

woc_current=$1

if [[ -z $1 ]]; then
	read -r -p "which block?" woc_current
fi

wocHeight=$(woc_jq_GET "/block/height/$woc_current")

if [[ -z "$wocHeight" ]]; then
	echo "Block not found. Chain is $(woc_info | jq .blocks) blocks long"
	exit 1
fi

get_blkhash=$(jq -r .hash <<<"$wocHeight")
first_100tx=$(jq .tx <<<"$wocHeight" | jq -r .[])
txlist_name="$woc_current.$get_blkhash.txlist"
txcount="$(jq .txcount<<<$wocHeight)"

echo "$first_100tx" > "$txlist_name"

if [[ $(jq .tx<<<"$wocHeight" | wc -l) == 102 ]] && [[ "$txcount" != 100 ]]; then
	currentpage=1
	pages_count=$(jq .pages.uri <<<"$wocHeight" | jq -r .[] | wc -l)
	while [[ $currentpage -le $pages_count ]]; do
		woc_pages "$get_blkhash" "$currentpage" | jq -r .[] >> "$txlist_name"
		currentpage=$((currentpage + 1))
	done
fi

txs_in_block=$(jq .num_tx <<<"$wocHeight" )
echo "txs recorded in block:"
echo "$txs_in_block"

echo "txs in downloaded list:"
wc -l "$txlist_name"
