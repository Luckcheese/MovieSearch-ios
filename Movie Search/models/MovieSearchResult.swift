import Foundation
import ObjectMapper

class MovieSearchResult: Mappable {

    var title: String!
    var year: String!
    var imdbID: String!

    required init?(_ map: Map){

    }

    func mapping(map: Map) {
        title <- map["Title"]
        year <- map["Year"]
        imdbID <- map["imdbID"]
    }
}
