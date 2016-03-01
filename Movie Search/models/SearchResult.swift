import Foundation
import ObjectMapper

class SearchResult: Mappable {

    var total: Int!
    var result: [MovieSearchResult]!

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        total <- (map["totalResults"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        result <- map["Search"]
    }
}
