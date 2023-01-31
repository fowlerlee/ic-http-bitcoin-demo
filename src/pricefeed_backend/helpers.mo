import I "icmancan";
import Text "mo:base/Text";
import Blob "mo:base/Blob";

module {

    public func decodeBody(response : I.http_response) : I.DecodedHttpResponse {
        switch (Text.decodeUtf8(Blob.fromArray(response.body))) {
            case null { { response with body = "" } };
            case (?decoded) { { response with body = decoded } };
        };
    };
};
