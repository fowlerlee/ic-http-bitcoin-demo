import Result "mo:base/Result";
import I "icmancan";
import Error "mo:base/Error";
import ExperimentalCycles "mo:base/ExperimentalCycles";
import { decodeBody } "helpers";

actor {

  public func getPrice() : async Result.Result<I.DecodedHttpResponse, Text> {
    let ic : I.IC = actor ("aaaaa-aa");

    ExperimentalCycles.add(514_600_000);

    try {
      let httpResponse = await ic.http_request({
        url = "https://api.exchange.coinbase.com/products/ICP-USD/candles?granularity=60&start=1620743971&end=1620744031";
        method = #get;
        max_response_bytes = ?1000 : ?Nat64;
        body = null;
        transform = ?{
          function = transform;
          context = [];
        };
        headers = [{ name = "User-agent"; value = "exchange_rate_canister" }];
      });
      return #ok(decodeBody(httpResponse));
    } catch error {
      return #err("Reject message: " # Error.message(error));
    };

  };

  public query func transform({ context : [Nat8]; response : I.http_response }) : async I.http_response {
    { response with headers = [] };
  };

};
