import Foundation
import ObjectMapper

class SearchResult: Mappable {

    var total: Int!
    var result: [MovieSearchResult]!

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        total <- (map["totalResults"], StringToInt())
        result <- map["Search"]
    }
}
