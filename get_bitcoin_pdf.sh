get_bitcoin_pdf_bsv(){
        local bitcoin_pdf_txhash="54e48e5f5c656b26c3bca14a8c95aa583d07ebe84dde3b7dd4a78f4e4186e713"
	echo "USING WHATSONCHAIN.COM to download bitcoin.pdf from $bitcoin_pdf_txhash"
	local woc_api_url="https://api.whatsonchain.com/v1/bsv/main/tx/hash"
	local bitcoin_pdf_filename=bitcoin.pdf
	if [[ -f $bitcoin_pdf_filename ]]; then
		local bitcoin_pdf_filename=bitcoin_woc$EPOCHSECONDS.pdf
	fi
	if [[ $(command -v curl) ]]; then
		curl -s --location --request GET \
			"${woc_api_url}/${bitcoin_pdf_txhash}" \
			| jq -r '.vout[].scriptPubKey.asm' \
			| cut -c3- \
			| xxd -p -r \
			| tail +9c  \
			| head -c 184292 \
				> "$bitcoin_pdf_filename"
	else
		echo "download curl"
		exit 1
	fi
	if [[ -f "$bitcoin_pdf_filename" ]]; then
		echo "$bitcoin_pdf_filename downloaded!"
		ls -al "$bitcoin_pdf_filename"
		file "$bitcoin_pdf_filename"
	else
		echo "creating $bitcoin_pdf_filename has failed"
	fi
}
get_bitcoin_pdf_bsv
