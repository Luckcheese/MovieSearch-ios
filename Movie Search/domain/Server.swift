import Foundation
import Alamofire
import AlamofireObjectMapper


protocol ServerSearchDelegate {
    func moviesSearched(query: String, searchResult: SearchResult)
}

protocol ServerDetailDelegate {
    func movieDetailRequested(imdbId: String, movie: Movie)
}

class Server {

    let url = "https://www.omdbapi.com/"

    func search(query: String, delegate: ServerSearchDelegate) {
        Alamofire.request(.GET, url, parameters: ["s": query]).responseObject() {
            (response: Response<SearchResult, NSError>) in

            delegate.moviesSearched(query, searchResult: response.result.value!)
        }
    }

    func details() -> Movie {
        return Movie()
    }
}
