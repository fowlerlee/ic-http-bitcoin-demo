# pricefeed
- see lecture by Moritz from Dfinityj
https://www.youtube.com/watch?v=eKD5Ug6fXIw&list=PLeNYxb7vPrkhQN6-ps2krq5Un3xPD3vBQ&index=36

## calling coinbase api
https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductcandles/

url = https://api.exchange.coinbase.com/products/:product_id/candles

curl -L -X GET 'https://api.exchange.coinbase.com/products/ICP-USD/candles?granularity=60&start=1620743971&end=1620744031' \
-H 'Content-Type: application/json' -v -w '%{size_header}'

### Http outcalls pricing
 - https://internetcomputer.org/docs/current/developer-docs/integrations/http_requests/http_requests-how-it-works#pricing
 - calculation as follows:

header_len = header_1.name + header_1.value + ... + header_n.name + header_n.value
request_size = url.len + transform.name.len + transform.context.len + body.len + header_len
http_outcall_cost = 400M + 100k * (request_size + max_response_size)
scaling_factor = subnet_size / 13 
total_cost = scaling_factor * http_outcall_cost