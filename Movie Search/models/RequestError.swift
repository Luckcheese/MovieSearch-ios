import Foundation
import ObjectMapper

class RequestError: Mappable {

    var success: Bool!
    var message: String!

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        success <- (map["Response"], BoolToString())
        message <- map["Error"]
    }
}
