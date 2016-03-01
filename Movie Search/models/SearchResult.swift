import Foundation
import ObjectMapper

class SearchResult: RequestError {

    var total: Int!
    var result: [MovieSearchResult]!

    override func mapping(map: Map) {
        super.mapping(map)
        total <- (map["totalResults"], StringToInt())
        result <- map["Search"]
    }
}
