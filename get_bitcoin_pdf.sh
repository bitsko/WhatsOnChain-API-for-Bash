get_bitcoin_pdf_bsv(){
        local bitcoin_pdf_txhash="54e48e5f5c656b26c3bca14a8c95aa583d07ebe84dde3b7dd4a78f4e4186e713"
        if [[ $(get_pid bsv) && $(node_cli bsv help) != offline ]]; then
                echo "USING BSV NODE"
                node_cli bsv getrawtransaction "$bitcoin_pdf_txhash" 1 \
                        | jq -r '.vout[].scriptPubKey.asm' \
                        | cut -c3- \
                        | xxd -p -r \
                        | tail +9c  \
                        | head -c 184292 \
                        > bitcoin.pdf
        else
                echo "USING WHATSONCHAIN.COM"
                local woc_api_url="https://api.whatsonchain.com/v1/bsv/main/tx/hash"
                set -xv
                curl -s --location --request GET \
                        "${woc_api_url}/${bitcoin_pdf_txhash}" \
                        | jq -r '.vout[].scriptPubKey.asm' \
                        | cut -c3- \
                        | xxd -p -r \
                        | tail +9c  \
                        | head -c 184292 \
                        > bitcoin.pdf
                set +xv
        fi
        if [[ -f bitcoin.pdf ]]; then
                ls -al bitcoin.pdf
                file bitcoin.pdf
        else
                echo "creating bitcoin_woc.pdf has failed"
        fi
}
get_bitcoin_pdf_bsv
