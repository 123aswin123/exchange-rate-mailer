#!/bin/sh -l

#Executing with sh -c helps in catching errors inside Github Actions,
#If one runs commnds without it, errors arent spit out.
sh -c "echo The Base Currency is $INPUT_BASE_CURRENCY"
sh -c "apk add curl"
sh -c "apk add jq"


sh -c curl https://api.exchangeratesapi.io/latest?base=$INPUT_BASE_CURRENCY\&symbols=INR > resp.json
sh -c "cat resp.json | jq '.rates.INR' > fxRate.json"
sh -c 'FX_RATE=`cat fxRate.json`;echo 1 CAD = $FX_RATE INR'
