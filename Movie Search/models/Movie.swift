import Foundation
import ObjectMapper

class Movie: RequestError {

    var title: String!
    var year: String!
    var rated: String!
    var released: String!
    var runtime: String!
    var genre: String!
    var director: String!
    var writer: String!
    var actors: String!
    var plot: String!
    var language: String!
    var country: String!
    var awards: String!
    var poster: String!
    var metascore: String!
    var imdbRating: String!
    var imdbVotes: String!
    var imdbID: String!
    var type: String!

    override func mapping(map: Map) {
        super.mapping(map)

        title <- map["Title"]
        year <- map["Year"]
        rated <- map["Rated"]
        released <- map["Released"]
        runtime <- map["Runtime"]
        genre <- map["Genre"]
        director <- map["Director"]
        writer <- map["Writer"]
        actors <- map["Actors"]
        plot <- map["Plot"]
        language <- map["Language"]
        country <- map["Country"]
        awards <- map["Awards"]
        poster <- map["Poster"]
        metascore <- map["Metascore"]
        imdbRating <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
        imdbID <- map["imdbID"]
        type <- map["Type"]
    }
}
