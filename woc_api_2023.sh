bsv_api(){
	termcolor(){
		# termcolor function
		# position parameters and their purpose
		# 1: must be -e and can also be -ne for no newline
		# 2: the string to be colored
		# 3: the first field to set color
		# 4: the second field to set color
		# 5: sets plaintext to the left '-l' or right '-r' of colored text
		# 6: the plaintext field
		# 7: blank line above '-u' ; below '-d' or both '-b'
		#
		# can set the width in a variable; which is incremented here
	        if [[ -n $banner_width ]]; then
	                local text_width=$(wc -m <<<"$4")
	                banner_width=$((banner_width - text_width + 1))
	        fi
		# checks if there should be a newline before the string
		if [[ -n $7 ]]; then
			if [[ $7 == -u || $7 == -b ]]; then
				echo
			fi
		fi
		# checks to add noncolored text if positioned on the left
	        if [[ $5 == "-l" ]]; then
	                echo -n "$6 "
	        fi
		# this prints the colored string
	        echo -n "$1" '\033['"$2;$3m$4"'\033[0;37m'
		# prints plaintext to the right under various conditions
	        if [[ $5 == "-r" && $1 != "-ne" ]]; then
	                echo " $6"
		elif [[ $5 == "-r" ]]; then
			echo -n " $6"
	        fi
		# adds a newline under various conditions
	        if [[ -z $5 || $5 == "-l" ]] &&
			[[ "$1" != "-ne" ]]; then
	                echo
	        fi
		# checks to add a newline after the string
		if [[ -n $7 ]]; then
			if [[ $7 == -d || $7 == -b ]]; then
				echo
			fi
		fi
	}
	woclogo(){
        	termcolor -e 97 34 '   Whats             On                    Chain'
		termcolor -ne 32 1 '      #####         #####  '
		termcolor -ne 6 34 ',,,,,,,,,,,,,,,'
		termcolor -e 32 1 '   #################     '
		termcolor -ne 32 1 '    ######          ######  '
		termcolor -ne 6 34 ',,,,,,,,,,,,,'
		termcolor -e 32 1 '  #####################   '
		termcolor -ne 32 1 '   #####              ##### '
		termcolor -ne 6 34 ',,,,,,,,,,,,,'
		termcolor -e 32 1 ' #######################  '
		termcolor -ne 32 1 '  #####              '
		termcolor -ne 6 34 ',,,'
		termcolor -ne 32 1 ' ###             ###'
		termcolor -ne 6 34 ' ,,,'
		termcolor -e 32 1 '             ####  '
		termcolor -ne 32 1 '  #####      ####   '
		termcolor -ne 6 34 ',,,,'
		termcolor -ne 32 1 ' ###             ### '
		termcolor -e 6 34 ',,,,                  '
		termcolor -ne 32 1 '  #####      ####   '
		termcolor -ne 6 34 ',,,,'
		termcolor -ne 32 1 ' ###             ###'
		termcolor -e 6 34 ' ,,,,                  '
		termcolor -ne 32 1 '   #####     ####    '
		termcolor -ne 6 34 ',,,,'
		termcolor -ne 32 1 ' #               # '
		termcolor -ne 6 34 ',,,,'
		termcolor -e 32 1 '             ####  '
		termcolor -ne 32 1 '    ################# '
		termcolor -ne 6 34 ',,,,,,,,,,,,,,,,,,,,,,,,,,'
		termcolor -e 32 1 ' ################  '
		termcolor -ne 32 1 '     #################  '
		termcolor -ne 6 34 ',,,,,,,,,,,,,,,,,,,,,,,'
		termcolor -e 32 1 ' ################   '
		termcolor -ne 32 1 '       #################  '
		termcolor -ne 6 34 ',,,,,,,,,,,,,,,,,,,'
		termcolor -e 32 1 '  ###############     '
		termcolor -e 97 32 '                 https://developers.whatsonchain.com/'
        #	termcolor -e 97 34 '   Whats             On                    Chain'
	#	termcolor -e 32 1 '      #####         #####  ,,,,,,,,,,,,,,,   #################     '
	#	termcolor -e 32 1 '    ######          ######  ,,,,,,,,,,,,,  #####################   '
	#	termcolor -e 32 1 '   #####              ##### ,,,,,,,,,,,,, #######################  '
	#	termcolor -e 32 1 '  #####              ,,, ###             ### ,,,             ####  '
	#	termcolor -e 32 1 '  #####      ####   ,,,, ###             ### ,,,,                  '
	#	termcolor -e 32 1 '  #####      ####   ,,,, ###             ### ,,,,                  '
	#	termcolor -e 32 1 '   #####     ####    ,,,, #               # ,,,,             ####  '
	#	termcolor -e 32 1 '    ################# ,,,,,,,,,,,,,,,,,,,,,,,,,, ################  '
	#	termcolor -e 32 1 '     #################  ,,,,,,,,,,,,,,,,,,,,,,, ################   '
	#	termcolor -e 32 1 '       #################  ,,,,,,,,,,,,,,,,,,,  ###############     '
	#	termcolor -e 97 32 '                 https://developers.whatsonchain.com/'
	}
	wocHelp(){
		woclogo
		termcolor -e 0 1 'info ' -r '-  Retrieves information about the state of the chain for the selected network'
		termcolor -e 0 1 'circulatingsupply ' -r '-  Retrieves the circulating supply of BSV'
		termcolor -e 0 1 'tips ' -r '-  Retrieves information about all known tips in the block tree'
		termcolor -e 0 1 'blockhash ' -r '-  Retrieves the block details of a given hash'
		termcolor -e 0 1 'getblockhash ' -r '-  Retrieves the block hash by block height'
		termcolor -e 0 1 'height ' -r '-  Retrieves the block details of a given block height'
		termcolor -e 0 1 'getblockcount ' -r '-  Posts the current block number'
		termcolor -e 0 1 'currentblockinfo ' -r '-  Retrieves the block details of the current block'
		termcolor -e 0 1 'pages ' -r '-  Get pages of transactions from a block'
		termcolor -e 0 1 'headerbyhash ' -r '-  Retrieves the block header details of a given hash'
		termcolor -e 0 1 'headers ' -r '-  Retrieves the last 10 block headers'
		termcolor -e 0 1 'txhash ' -r '-  Retrieves the transaction details for a given transaction hash'
		termcolor -e 0 1 'broadcast ' -r '-  Broadcast a transaction'
		termcolor -e 0 1 'bulk ' -r '-  Fetch details for multiple transactions in single request (20 max)'
		termcolor -e 0 1 'bulktxstatus ' -r '-  Get multiple transactions status in a single request (20 max)'
		termcolor -e 0 1 'decode ' -r '-  Decode raw transaction with json in response or error msg from node'
		termcolor -e 0 1 'receipt ' -r '-  Download transaction receipt (PDF)'
		termcolor -e 0 1 'hex ' -r '-  Returns raw hex for the transaction with given hash'
		termcolor -e 0 1 'bulkhex ' -r '-  Get multiple transactions raw data in hex in a single request (20 max)'
		termcolor -e 0 1 'merkleproof ' -r '-  Returns the merkle branch for a confirmed transaction'
		termcolor -e 0 1 'mempoolinfo ' -r '-  Retrieves various info about the nodes mempool for the selected network'
		termcolor -e 0 1 'mempoolraw ' -r '-  Retrieve a list of transaction ids from the nodes mempool for the selected network'
		termcolor -e 0 1 'addressinfo ' -r '-  Retrieves various address info'
		termcolor -e 0 1 'addressbalance ' -r '-  Retrieves the confirmed and unconfirmed address balance'
		termcolor -e 0 1 'bulkbalance ' -r '-  Fetch confirmed and unconfirmed balance for multiple addresses in a single request (20 max)'
		termcolor -e 0 1 'addresshistory ' -r '-  Retrieves confirmed and unconfirmed address transactions'
		termcolor -e 0 1 'unspent ' -r '-  Retrieves ordered list of UTXOs'
		termcolor -e 0 1 'bulkunspent ' -r '-  Fetch UTXOs for multiple addresses in a single request (20 max)'
		termcolor -e 0 1 'statement ' -r '-  Download address statement (PDF)'
		termcolor -e 0 1 'scripthistory ' -r '-  Retrieves confirmed and unconfirmed script transactions'
		termcolor -e 0 1 'scriptunspent ' -r '-  This endpoint retrieves ordered list of UTXOs'
		termcolor -e 0 1 'bulkscriptunspent ' -r '-  Fetch UTXOs for multiple scripts in a single request (20 max)'
		termcolor -e 0 1 'exchangerate ' -r '-  This endpoint provides exchange rate for BSV'
		termcolor -e 0 1 'usd ' -r '-  Retrieves the USD price of BSV and posts the date'
		termcolor -e 0 1 'getlinks ' -r '-  Identifies whether the posted query text is a block hash, txid or address and responds with WoC links'
		termcolor -e 0 1 'help ' -r '-  Examples of use'
		termcolor -e 0 1 'newrandtx ' -r '-  grabs 1 random transaction from the listing of 100 transactions in the most recent block'
		termcolor -e 0 1 'current100tx ' -r '-  grabs the listing of 100 transactions from the most recent block'
		termcolor -e 0 1 'ratecalc ' -r '-  calculates the USD value of a given amount of BSV'
		termcolor -e 0 1 'currentblockinfo ' -r '-  presents info on the current block'
		termcolor -e 0 1 'lastblocktime ' -r '-  prints the difference in seconds to last block time, or with '
		termcolor -e 0 1 'readBsvCoinbase ' -r '-  finds and prints text strings in the coinbase given a block hash'
		termcolor -e 0 1 'getbestblockhash ' -r '-  prints the best blockhash'
		termcolor -e 0 1 'getUnpaginatedTxlist ' -r '-  creates a file of every transaction in a block from the transaction pages'
	}
	wocHelpDetail(){
		termcolor -e 0 1 'info' -r ' - Retrieves information about the state of the chain for the selected network' -u
		termcolor -e 32 1 'Examples:'
		termcolor -e 33 1 'info'
		termcolor -e 33 1 'info test'
		termcolor -e 33 1 'info stn'
		termcolor -e 0 1 'blockhash' -r ' - Retrieves the block details of a given hash' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'blockhash 000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f'
		termcolor -e 0 1 'height' -r ' - Retrieves the block details of a given block height' -u
		termcolor -e 32 1 'Examples:'
		termcolor -e 33 1 'height 0'
		termcolor -e 33 1 'height 1 stn'
		termcolor -e 0 1 'getblockcount' -r ' - Retrieves the current block height' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'getblockcount'
		termcolor -e 0 1 'currentblockinfo' -r ' - Retrieves the block details of the current block height' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'currentblockinfo'
		termcolor -e 0 1 'pages' -r ' - Get pages of transactions from a block' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'pages 000000000000000000885a4d8e9912f085b42288adc58b3ee5830a7da9f4fef4 2'
		termcolor -e 0 1 'headerbyhash' -r ' - Retrieves the block header details of a given hash' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'headerbyhash 00000000839a8e6886ab5951d76f411475428afc90947ee320161bbf18eb6048'
		termcolor -e 33 1 'headerbyhash 000000000556e364bb9bb45adf587734ed1becd48a8978ad700f8344cf72481c stn'
		termcolor -e 0 1 'headers' -r ' - Retrieves the last 10 block headers' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'headers'
		termcolor -e 33 1 'headers test'
		termcolor -e 0 1 'txhash' -r ' - Retrieves the transaction details for a given transaction hash' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'txhash 0e3e2357e806b6cdb1f70b54c3a3a17b6714ee1f0e68bebb44a74b1efd512098'
		termcolor -e 33 1 'txhash 72c6c856d7a1cf34889be3aa13160d0ab2335236420e944099fefe180172f4aa stn'
		termcolor -e 0 1 'broadcast' -r ' - Broadcast a transaction' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'broadcast 0100000001484d40d45b9ea0d652fca8258ab7caa42541eb52975857f96fb50cd732c8b481000000008a47304402202cb265bf10707bf49346c3515dd3d16fc454618c58ec0a0ff448a676c54ff71302206c6624d762a1fcef4618284ead8f08678ac05b13c84235f1654e6ad168233e8201410414e301b2328f17442c0b8310d787bf3d8a404cfbd0704f135b6ad4b2d3ee751310f981926e53a6e8c39bd7d3fefd576c543cce493cbac06388f2651d1aacbfcdffffffff0162640100000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac00000000'
		termcolor -e 0 1 'bulk' -r ' - Fetch details for multiple transactions in single request (20 max)' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulk \"294cd1ebd5689fdee03509f92c32184c0f52f037d4046af250229b97e0c8f1aa\",\"91f68c2c598bc73812dd32d60ab67005eac498bef5f0c45b822b3c9468ba3258\"'
		termcolor -e 0 1 'bulktxstatus' -r ' - Get multiple transactions status in a single request (20 max)' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulktxstatus \"294cd1ebd5689fdee03509f92c32184c0f52f037d4046af250229b97e0c8f1aa\",\"91f68c2c598bc73812dd32d60ab67005eac498bef5f0c45b822b3c9468ba3258\"'
		termcolor -e 0 1 'decode' -r ' - Decode raw transaction with json in response or error msg from node' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'decode 0100000001484d40d45b9ea0d652fca8258ab7caa42541eb52975857f96fb50cd732c8b481000000008a47304402202cb265bf10707bf49346c3515dd3d16fc454618c58ec0a0ff448a676c54ff71302206c6624d762a1fcef4618284ead8f08678ac05b13c84235f1654e6ad168233e8201410414e301b2328f17442c0b8310d787bf3d8a404cfbd0704f135b6ad4b2d3ee751310f981926e53a6e8c39bd7d3fefd576c543cce493cbac06388f2651d1aacbfcdffffffff0162640100000000001976a914c8e90996c7c6080ee06284600c684ed904d14c5c88ac00000000'
		termcolor -e 0 1 'receipt' -r ' - Download transaction receipt PDF' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'receipt 3c7478a74b180cb4784e86d33d40b48968898ee15851dd133e46e04038c9b963'
		termcolor -e 0 1 'hex' -r ' - Returns raw hex for the transaction with given hash' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'hex 294cd1ebd5689fdee03509f92c32184c0f52f037d4046af250229b97e0c8f1aa'
		termcolor -e 0 1 'bulkhex' -r ' - Get multiple transactions raw data in hex in a single request (20 max)' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulkhex \"294cd1ebd5689fdee03509f92c32184c0f52f037d4046af250229b97e0c8f1aa\",\"91f68c2c598bc73812dd32d60ab67005eac498bef5f0c45b822b3c9468ba3258\"'
		termcolor -e 0 1 'merkleproof' -r ' - Returns the merkle branch for a confirmed transaction'
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'merkleproof 294cd1ebd5689fdee03509f92c32184c0f52f037d4046af250229b97e0c8f1aa'
		termcolor -e 0 1 'mempoolinfo' -r ' - Retrieves various info about the nodes mempool for the selected network'
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'mempoolinfo'
		termcolor -e 33 1 'mempoolinfo test'
		termcolor -e 0 1 'mempoolraw' -r ' - Retrieve a list of transaction ids from the nodes mempool for the selected network'
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'mempoolraw'
		termcolor -e 33 1 'mempoolraw test'
		termcolor -e 0 1 'addressinfo' -r '- Retrieves various address info' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'addressinfo 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'
		termcolor -e 33 1 'addressinfo n4ioKcJWq8LwxMCyUGSyk8H8MMrMKVCKmK stn'
		termcolor -e 0 1 'addressbalance' -r ' - Retrieves the confirmed and unconfirmed address balance' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'addressbalance 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'
		termcolor -e 33 1 'addressbalance n4ioKcJWq8LwxMCyUGSyk8H8MMrMKVCKmK stn'
		termcolor -e 0 1 'bulkbalance' -r ' - Fetch confirmed and unconfirmed balance for multiple addresses in a single request -20 max' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulkbalance \"12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX\",\"1HLoD9E4SDFFPDiYfNYnkBLQ85Y51J3Zb1\"'
		termcolor -e 0 1 'addresshistory' -r ' - Retrieves confirmed and unconfirmed address transactions' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'addresshistory 12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX'
		termcolor -e 33 1 'addresshistory n4ioKcJWq8LwxMCyUGSyk8H8MMrMKVCKmK stn'
		termcolor -e 0 1 'unspent' -r ' - Retrieves ordered list of UTXOs' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'unspent 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'
		termcolor -e 33 1 'unspent n4ioKcJWq8LwxMCyUGSyk8H8MMrMKVCKmK stn'
		termcolor -e 0 1 'bulkunspent' -r ' - Fetch UTXOs for multiple addresses in a single request -20 max' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulkunspent \"12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX\",\"1HLoD9E4SDFFPDiYfNYnkBLQ85Y51J3Zb1\"'
		termcolor -e 0 1 'statement' -r ' - Download address statement PDF' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'statement 12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX'
		termcolor -e 0 1 'scripthistory' -r ' - Retrieves confirmed and unconfirmed script transactions' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'scripthistory f814a7c3a40164aacc440871e8b7b14eb6a45f0ca7dcbeaea709edc83274c5e7'
		termcolor -e 0 1 'scriptunspent' -r ' - This endpoint retrieves ordered list of UTXOs' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'scriptunspent f814a7c3a40164aacc440871e8b7b14eb6a45f0ca7dcbeaea709edc83274c5e7'
		termcolor -e 0 1 'bulkscriptunspent' -r ' - Fetch UTXOs for multiple scripts in a single request -20 max' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'bulkscriptunspent \"f814a7c3a40164aacc440871e8b7b14eb6a45f0ca7dcbeaea709edc83274c5e7\",\"995ea8d0f752f41cdd99bb9d54cb004709e04c7dc4088bcbbbb9ea5c390a43c3\"'
		termcolor -e 0 1 'exchangerate' -r ' - This endpoint provides exchange rate for BSV' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'exchangerate'
		termcolor -e 0 1 'usd' -r ' - Retrieves the USD price of BSV and posts the date' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'usd'
		termcolor -e 0 1 'getlinks' -r ' - Identifies whether the posted query text is a block hash, txid or address and responds with WoC links' -u
		termcolor -e 32 1 'Example:'
		termcolor -e 33 1 'getlinks 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa' -r ' .' -d
	}
        if [[ ! -d bsvjs ]]; then
                mkdir bsvjs
        fi
        cd bsvjs
	# Bash functions for the WhatsOnChain API
	# Use at your own risk
	# https://developers.whatsonchain.com/#introduction
	# dependencies: jq, curl, grep, awk
	# $ wget https://raw.githubusercontent.com/bitsko/Whats-On-Chain-API-for-Bash/main/.functions_test
	# add these functions to your shell session by typing:
	# $ source .functions_test
	# give them persistence by sourcing them in .bashrc
	# if [ -f ~/.functions ]; then
	#    . ~/.functions
	# fi
	# after sourcing the functions, print the listing of functions with:
	# $ woc
	# find examples of use with:
	# $ help
	woc(){
		wocHelp
	}

	help(){
		wocHelpDetail
	}
	##############################################################################################################################
	curlGET(){
	        curl -s --location --request GET "https://api.whatsonchain.com/v1/bsv/${net_}${1}"
	}
	curlGET3(){
                net_=main
                [[ "$3" == "test" ]] && net_=test
                [[ "$3" == "stn" ]] && net_=stn
		curl -s --location --request GET "https://api.whatsonchain.com/v1/bsv/${net_}${1}"
	}
	curlGET2(){
                net_=main
                [[ "$2" == "test" ]] && net_=test
                [[ "$2" == "stn" ]] && net_=stn
		curl -s --location --request GET "https://api.whatsonchain.com/v1/bsv/${net_}${1}"
	}

	jqGET(){
		net_=main
		if [[ $2 == "test" ]]; then
			net_="test"
		elif [[ $2 == "stn" ]]; then
			net_="stn"
		fi
		jq<<<$(curlGET ${1})
	}
	jqGET2(){
		net_=main
		if [[ $3 == "test" ]]; then
			net_="test"
		elif [[ $3 == "stn" ]]; then
			net_="stn"
		fi
		jq<<<$(curlGET ${1})
	}
	helper(){
	        help | less
	}
	jqcheck(){
	        jq --version
	        command -v jq >/dev/null 2>&1 || { echo >&2 "please install jq"
                return
        }
	}
	##############################################################################################################################
	info(){
		jqGET "/chain/info" "$@"
	}
	circulatingsupply(){
        	curlGET "/circulatingsupply" "$@"
	}
	tips(){
		jqGET "/chain/tips" "$@"
	}
	blockhash(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET2 "/block/hash/$1" "$@"
	}
	getblockhash(){
		height $1 | jq -r .coinbaseTx.blockhash | head -n 1
	}
	getblock(){
		getblockhash $1
	}
	height(){
	        if [[ -p "/dev/stdin" ]]; then
			local height="$(cat)"
		else
        	        local height="$1"
	                if [[ -z "$1" ]]; then
				echo "provide a height as \$1 or pipe in a height"
				return
			fi
		fi
	        local wocHeight=$(jqGET "/block/height/$height" "$2")
	        jq<<<"$wocHeight"
	        local truncateCheck=$(jq<<<"$wocHeight" | grep '"isTruncated": true' | awk '{ print $2 }')
	        if [[ "$truncateCheck" == "true" ]]; then
			echo $'\n'"Output is Truncated."$'\n'
			return
		fi
	        local txcount="$(jq .txcount<<<$wocHeight)"
	        if [[ $(jq .tx<<<"$wocHeight" | wc -l) == 102 ]] && [[ "$txcount" != 100 ]]; then
        	        echo "{"$'\n'"\"tx_isTruncated\": \"true\""$'\n'"}"
			return
		fi
	        if [[ -z "$wocHeight" ]]; then
			echo "Block not found. Chain is $(info | jq .blocks) blocks long"
			return
		fi
	}
	pages(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET2 "/block/hash/$1/page/$2" "$@"
	}
	headerbyhash(){
	        if [[ -p "/dev/stdin" ]]; then
	                local hash_="$(cat)"
	        else
	        	local hash_="$1"
			[[ -z "$1" ]] && echo "provide a hash as \$1 or pipe in a hash" && return
	        fi
		jqGET2 "/block/$hash_/header" "$@"
	}
	getblockheader(){
		headerbyhash "$1"
	}
	headers(){
		jqGET "/block/headers" "$@"
	}
	txhash(){
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        if [[ -p "/dev/stdin" ]]; then
		                local hash_="$(cat)"
		        else
	                local hash_="$1"
			[[ -z "$1" ]] && echo "provide a hash as \$1 or pipe in a hash" && return
	        fi
	        local txHash=$(curlGET "/tx/hash/$hash_")
	        	jq<<<"$txHash"
	        local truncateCheck=$(jq<<<"$txHash" | grep '"isTruncated": true' | awk '{ print $2 }')
	        if [[ "$truncateCheck" == "true" ]]; then
			echo $'\n'"Output is Truncated. Use:"$'\n'"rawtxout $1"$'\n'
			return
		fi
	        if [[ -z "$txHash" ]]; then
			echo "Transaction hash not found. try:"$'\n'"txhash $1 test"$'\n'"or"$'\n'"txhash $1 stn"
			return
		fi
	}
	broadcast(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/tx/raw" \
	                --header "Content-Type: application/json" \
	                --data "{\"txhex\": \"$1\" }"
	}
	bulk(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/txs" \
	                --header "Content-Type: application/json" \
	                --data "{\"txids\" : ["$1"] }")
	}
	bulktxstatus(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/txs/status" \
	                --header "Content-Type: application/json" \
	                --data "{\"txids\" : ["$1" ] }")
	}
	decode(){
		[[ -z "$1" ]] && echo "missing input!" && return
		        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/tx/decode" \
	                --header "Content-Type: application/json" \
	                --data "{\"txhex\": \"$1\" }")
	}
	receipt(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        read -r -p "What do you want to name the receipt?"$'\n>' name
	        curl -s --location --request GET  "https://main.whatsonchain.com/receipt/$1" > "$name".pdf
	}
	hex(){
	        if [[ -p "/dev/stdin" ]]; then
	                local hash_="$(cat)"
	        else
	   	     	local hash_="$1"
			[[ -z "$1" ]] && echo "provide a hash as \$1 or pipe in a hash" && return
	        fi
	        curlGET2 "/tx/$hash_/hex" "$@"
	}
	bulkhex(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/txs/hex" \
	                --header "Content-Type: application/json" \
	                --data "{\"txids\" : ["$1" ] }")
	}
	rawtxout(){
	        if [[ -p "/dev/stdin" ]]; then
	                local hash_="$(cat)"
	        else
	        	local hash_="$1"
			[[ -z "$1" ]] && echo "provide a hash as \$1 or pipe in a hash" && return
	        fi
	        local voutCount=0
		if [[ -n "$2" ]]; then
			local voutCount="$2"
		fi
	        curlGET3 "/tx/$hash_/out/$voutCount/hex" "$@"
	}
	merkleproof(){
	        if [[ -p "/dev/stdin" ]]; then
	                local hash_="$(cat)"
		        else
	                local hash_="$1"
			[[ -z "$1" ]] && echo "provide a hash as \$1 or pipe in a hash" && return
	        fi
		jqGET "/tx/$hash_/proof" "$@"
	}
	mempoolinfo(){
		jqGET "/mempool/info" "$@"
	}
	mempoolraw(){
		jqGET "/mempool/raw" "$@"
	}
	addressinfo(){
	        if [[ -p "/dev/stdin" ]]; then
	                local bsv_address="$(cat)"
	        else
	                local bsv_address="$1"
	                if [[ -z "$1" ]]; then
	                        echo "provide an address as \$1"
	                        return
	                fi
	        fi
		jqGET "/address/$bsv_address/info"  "$@"
	}
	addressbalance(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET "/address/$1/balance" "$@"
	}
	bulkbalance(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/addresses/balance" \
	                --header "Content-Type: application/json" \
	                --data "{\"addresses\" : ["$1" ] }")
	}
	addresshistory(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET "/address/$1/history" "$@"
	}
	unspent(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET "/address/$1/unspent" "$@"
	}
	bulkunspent(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/addresses/unspent" \
	                --header "Content-Type: application/json" \
	                --data "{\"addresses\" : ["$1" ] }")
	}
	statement(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        read -r -p "What do you want to name the statement?"$'\n>' name
	        curl -s --location --request GET "https://main.whatsonchain.com/statement/$1" > "$name".pdf
	}
	scripthistory(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET "/script/$1/history" "$@"
	}
	scriptunspent(){
		[[ -z "$1" ]] && echo "missing input!" && return
		jqGET "/script/$1/unspent" "$@"
	}
	bulkscriptunspent(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        net_=main
	        [[ "$2" == "test" ]] && net_=test
	        [[ "$2" == "stn" ]] && net_=stn
	        jq<<<$(curl -s --location --request POST "https://api.whatsonchain.com/v1/bsv/$net_/scripts/unspent" \
	                --header "Content-Type: application/json" \
	                --data "{\"scripts\" : ["$1" ] }")
	}
	exchangerate(){
	        jq<<<$(curl -s --location --request GET "https://api.whatsonchain.com/v1/bsv/main/exchangerate")
	}
	usd(){
	        local currency=$(exchangerate | jq .currency)
	        local rate=$(exchangerate | jq .rate | cut -c -6)
	        echo BSV is "$rate" "$currency". $(date) | sed 's/"//g'
	}
	getlinks(){
		[[ -z "$1" ]] && echo "missing input!" && return
	        local curl_address1="https://api.whatsonchain.com/v1/bsv/main/search/links"
	        local curl_address2=" -H 'Content-Type: application/json' -d '{ \"query\": \"$1\" }'"
	        local curl_address_="${curl_address1}${curl_address2}"
	        local links=jq<<<"$(curl -s -X POST ${curl_address_})"
	        bash<<<"$links"
	}
	getblockcount(){
	        info | jq .blocks
	}
	currentblockinfo(){
	        height $(getblockcount)
	}
	current100tx(){
		currentblockinfo | jq -r .tx | sed 's/null//g' | jq -r .[] | tee -a "100tx.$EPOCHSECONDS.txt"
	}
	newrandtx(){
	        current100tx | shuf -n 1
	}
	ratecalc(){
	        if [[ -p "/dev/stdin" ]]; then
	                local bsv_amount="$(cat)"
	        else
	                local bsv_amount="$1"
	                if [[ -z "$1" ]]; then
	                        echo "provide a bsv amount as \$1"
	                        return
	                fi
	        fi
	        local theRate=$(curl -s https://api.whatsonchain.com/v1/bsv/main/exchangerate | jq -r .rate)
	        echo "$theRate * $bsv_amount" | bc
	}
	lastblocktime(){
		local current_unix_time=$(date +%s)
		local last_block_time=$(getblockcount | height | jq .time | awk NR==1)
		local distance_in_seconds=$(echo "$current_unix_time - $last_block_time" | bc)
		if [[ $1 == "-h" ]]; then
			echo "$(echo "$distance_in_seconds / 60" | bc) minutes since last bsv block"
		else
			echo "$distance_in_seconds"
		fi
	}
	readBsvCoinbase(){
		if [[ -z $1 ]]; then
			echo "supply a block hash such as 000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f"
			exit 1
		fi
		blockhash $1 \
			| jq .coinbaseTx.vin \
			| jq -r .[].coinbase \
			| xxd -r -p \
			| strings -7
	}
	getbestblockhash(){
		info | jq -r .bestblockhash
	}
	getUnpaginatedTxlist(){
		rbccurlGET(){
	       		curl -s --location --request GET \
			"https://api.whatsonchain.com/v1/bsv/main${1}"
		}
		rbcjqGET(){
			jq<<<$(rbccurlGET "${1}")
		}
		guPages(){
			rbcjqGET "/block/hash/$1/page/$2"
		}
		guInfo(){
			rbcjqGET "/chain/info"
		}
		local _current=$1
		if [[ -z $1 ]]; then
			read -r -p "which block?" _current
		fi
		local _wocHeight=$(rbcjqGET "/block/height/$_current")
		if [[ -z "$_wocHeight" ]]; then
			echo "Block not found. Chain is $(guInfo | jq .blocks) blocks long"
			exit 1
		fi
		local get_blkhash=$(jq -r .hash <<<"$_wocHeight")
		local first_100tx=$(jq .tx <<<"$_wocHeight" | jq -r .[])
		local txlist_name="$_current.$get_blkhash.txlist"
		local txcount="$(jq .txcount<<<$_wocHeight)"
		echo "$first_100tx" > "$txlist_name"
		if [[ $(jq .tx<<<"$_wocHeight" | wc -l) == 102 ]] && [[ "$txcount" != 100 ]]; then
			local currentpage=1
			local pages_count=$(jq .pages.uri <<<"$_wocHeight" | jq -r .[] | wc -l)
			while [[ $currentpage -le $pages_count ]]; do
				guPages "$get_blkhash" "$currentpage" | jq -r .[] >> "$txlist_name"
				local currentpage=$((currentpage + 1))
			done
		fi
		local txs_in_block=$(jq .num_tx <<<"$_wocHeight" )
		echo "txs in block : $txs_in_block"
		echo "tx downloaded: $(wc -l $txlist_name)"
	}
	decimaltohex(){
		#takes the version as a decimal
		#pads 0's to 4 bytes
		local decimal_to_hex=$(printf '%x\n' "$1")
		local dec2hex_length=$(awk '{ print length }' <<<"$decimal_to_hex")
		local padding_length=$((8 - dec2hex_length))
		local current_length=0
		while [[ $current_length -lt $padding_length ]]; do
			echo -n 0
			local current_length=$((current_length +1))
		done
		echo -n "$decimal_to_hex"
	}
	swapendian(){
		#changes the endianness of the bytes
	        local reversed=$(rev <<<"$1")
	        while IFS=' ' read -r -n2 byte; do
	                echo -n "$(rev<<<$byte)"
	        done <<<"$reversed"
	}
	getJqValue(){
		jq -r "${1}"<<<"$block_to_reconstruct"
	}
	headerJq(){
		jq -r "${1}"<<<"$bitcoin_header_"
	}
	getblockheaderHexByHeight(){
		echo; echo "HEADER DEBUG"; echo
		local block_to_reconstruct=$(height "$1")
		local bitcoin_header_=$(headerbyhash $(getJqValue ".hash"))
		echo "bitcoin header: $bitcoin_header_"
		local decimal_version=$(getJqValue ".version" | sed 's/,//g' | head -n 1)
		echo "decimal version: $decimal_version"
		local bitcoin_version=$(swapendian $(decimaltohex "$decimal_version"))
		echo "bitcoin_version: $bitcoin_version"
		local prev_blockhash_=$(swapendian $(getJqValue ".previousblockhash"))
	                if [[ -z $prev_blockhash_ && $1 == 0 ]]; then
	                        local prev_blockhash_=0000000000000000000000000000000000000000000000000000000000000000
	                fi
		echo "prev blockhash $prev_blockhash_"
		local bitcoin_merkle_=$(swapendian $(getJqValue ".merkleroot"))
		echo "bitcoin merkle $bitcoin_merkle_"
		local bitcoinunixtime=$(swapendian $(decimaltohex $(getJqValue ".time")))
		echo "bitcoinunix time $bitcoinunixtime"
		local bitcointargbits=$(swapendian $(headerJq ".bits"))
		echo "bitcointargbits $bitcointargetbits"
		local bitcoinblknonce=$(swapendian $(decimaltohex $(headerJq ".nonce" | sed 's/,//g')))
		echo "bitcoin blk nonce: $bitcoinblknonce"
		local header_part_1="${bitcoin_version}${prev_blockhash_}${bitcoin_merkle_}"
		echo "header part 1 $header_part_1"
		local header_part_2="${bitcoinunixtime}${bitcointargbits}${bitcoinblknonce}"
		echo "header part 2 $header_part_2"
		echo "${header_part_1}${header_part_2}"
	}
	txvarintDec2hex(){
		set -e
		local dec2hex_var=$(printf '%x\n' "$1")
		local dec2hex_len=$(awk '{ print length }'<<<"$dec2hex_var")
		if [[ $dec2hex_len == 1 || $dec2hex_len == 15 ]] || \
			[[ $dec2hex_len == 7 || $dec2hex_len == 3 ]]; then
			local dec2hex_var="0${dec2hex_var}"
		elif [[ $dec2hex_len == 5 || $dec2hex_len == 13 ]]; then
		local dec2hex_var="000${dec2hex_var}"
			elif [[ $dec2hex_len == 6 || $dec2hex_len == 14 ]]; then
			local dec2hex_var="00${dec2hex_var}"
		elif [[ $dec2hex_len == 9 ]]; then
			local dec2hex_var="0000000${dec2hex_var}"
		elif [[ $dec2hex_len == 10 ]]; then
			local dec2hex_var="000000${dec2hex_var}"
		elif [[ $dec2hex_len == 11 ]]; then
			local dec2hex_var="00000${dec2hex_var}"
		elif [[ $dec2hex_len == 12 ]]; then
			local dec2hex_var="0000${dec2hex_var}"
		fi
		local dec2hex_len=$(awk '{ print length }'<<<"$dec2hex_var")
		if [[ $dec2hex_len == 4 ]]; then
			local dec2hex_var="fd${dec2hex_var}"
		elif [[ $dec2hex_len == 8 ]]; then
			local dec2hex_var="fe${dec2hex_var}"
		elif [[ $dec2hex_len == 16 ]]; then
			local dec2hex_var="ff${dec2hex_var}"
		fi
		echo "$dec2hex_var"
	}
	txlist(){
		local heightguInfo=$(height "$1")
		local truncate_check=$(jq -r .tx_isTruncated<<<"$heightguInfo" | sed 's/null//g;/^$/d')
		if [[ $truncate_check == true ]]; then
			echo "getUnpaginatedTxlist"
			getUnpaginatedTxlist
			local txcount=$(wc -l "$txlist_name")
			local tx_list=$(cat "$txlist_name")
		else
			local tx_list=$(jq .tx | jq -r .[]<<<"$heightguInfo")
			echo "$tx_list"
			local txcount=$(wc -l<<<"$tx_list")
		fi
		echo "txcount: $txcount"
	}
	getSerializedBlock(){
		echo; echo "HEADER DEBUG"; echo
		local block_to_reconstruct=$(height "$1")
		local bitcoin_header_=$(headerbyhash $(getJqValue ".hash"))
		echo "bitcoin header: $bitcoin_header_"
		local decimal_version=$(getJqValue ".version" | sed 's/,//g' | head -n 1)
		echo "decimal version: $decimal_version"
		local bitcoin_version=$(swapendian $(decimaltohex "$decimal_version"))
		echo "bitcoin_version: $bitcoin_version"
		local prev_blockhash_=$(swapendian $(getJqValue ".previousblockhash"))
	                if [[ -z $prev_blockhash_ && $1 == 0 ]]; then
				local prev_blockhash_=0000000000000000000000000000000000000000000000000000000000000000
			fi
		echo "prev blockhash $prev_blockhash_"
		local bitcoin_merkle_=$(swapendian $(getJqValue ".merkleroot"))
		echo "bitcoin merkle $bitcoin_merkle_"
		local bitcoinunixtime=$(swapendian $(decimaltohex $(getJqValue ".time")))
		echo "bitcoinunix time $bitcoinunixtime"
		local bitcointargbits=$(swapendian $(headerJq ".bits"))
		echo "bitcointargbits $bitcointargbits"
		local bitcoinblknonce=$(swapendian $(decimaltohex $(headerJq ".nonce" | sed 's/,//g')))
		echo "bitcoin blk nonce: $bitcoinblknonce"
		local header_part_1="${bitcoin_version}${prev_blockhash_}${bitcoin_merkle_}"
		echo "header part 1 $header_part_1"
		local header_part_2="${bitcoinunixtime}${bitcointargbits}${bitcoinblknonce}"
		echo "header part 2 $header_part_2"
		echo "both header parts"
		echo "${header_part_1}${header_part_2}"
		echo "serialized block debug"
		# is not be robust
		local block_txs_count=$(getJqValue ".txcount" | head -n 1)
		echo "present transactions count $block_txs_count"
		local block_tx_varint=$(txvarintDec2hex "$block_txs_count")
		echo "present block transaction count varint $block_tx_varint"
		# not robust
		local blocks_txs_list=$(jq .tx<<<"$block_to_reconstruct" | sed 's/null//g' | jq -r .[])
		makeSerializedTxstream(){
			local temp_txstream_file=bitcoin.rawtxstream.block.temp
			if [[ -f $temp_txstream_file ]]; then
				rm $temp_txstream_file
				touch "$temp_txstream_file"
			fi
			while IFS=' ' read -r line; do
				local raw_transaction=$(curl -s --location --request GET "https://api.whatsonchain.com/v1/bsv/main/tx/${line}/hex")
					echo -n "$raw_transaction" >> "$temp_txstream_file"
			done<<<"$blocks_txs_list"
	}
			makeSerializedTxstream
		local serialized_txstream=$(cat "$temp_txstream_file")
		echo "present serialized stream of tx: $serialized_txstream"
		local raw_block_part_1="${bitcoin_version}${prev_blockhash_}${bitcoin_merkle_}"
		local raw_block_part_2="${bitcoinunixtime}${bitcointargbits}${bitcoinblknonce}"
		local bitcoin_block_hd="${raw_block_part_1}${raw_block_part_2}"
		echo "bitcoin block header is: $bitcoin_block_hd"
		local raw_block_part_3="${block_tx_varint}${serialized_txstream}"
		local complete_blk_hex="${bitcoin_block_hd}${raw_block_part_3}"
		local raw_block_len=$(awk '{print length/2}'<<<"$complete_blk_hex")
		echo "present raw block length $raw_block_len"
		local block_byte_sz=$(decimaltohex "$raw_block_len")
		echo "present block byte size $block_byte_sz"
		local blocksize_ibo=$(swapendian "$block_byte_sz")
		echo "$blocksize ibo $blocksize_ibo"
		local magic_bytes="f9beb4d9"
		local blkfilestring="${magic_bytes}${blocksize_ibo}${complete_blk_hex}"
		echo "block file string"
		echo "$blkfilestring" | tee bitcoin_raw_block.hex
	}
	if [[ -z $@ ]]; then
		woc
	else
		$@
	fi
	cd ..
	unset woclogo wocHelp wocHelpDetail woc help curlGET curlGET3 curlGET2 jqGET jqGET2 helper jqcheck info circulatingsupply tips blockhash getblockhash getblock height \
		pages headerbyhash getblockheader headers txhash broadcast bulk bulktxstatus decode receipt hex bulkhex rawtxout merkleproof mempoolinfo mempoolraw addressinfo \
		addressbalance bulkbalance addresshistory unspent bulkunspent statement scripthistory scriptunspent bulkscriptunspent exchangerate usd getlinks getblockcount \
		currentblockinfo current100tx newrandtx ratecalc lastblocktime readBsvCoinbase getbestblockhash getUnpaginatedTxlist rbccurlGET rbcjqGET guPages guInfo \
		decimaltohex swapendian getJqValue headerJq getblockheaderHexByHeight txvarintDec2hex txlist getSerializedBlock net_
}

bsv_api $@
