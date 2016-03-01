import Foundation
import Alamofire
import AlamofireObjectMapper


protocol ServerError {
    func serverReturnedError(message: String)
}

protocol ServerSearchDelegate: ServerError {
    func moviesSearched(query: String, searchResult: SearchResult)

}

protocol ServerDetailDelegate: ServerError {
    func movieDetailRequested(imdbId: String, movie: Movie)
}

class Server {

    let url = "https://www.omdbapi.com/"

    func search(query: String, delegate: ServerSearchDelegate) {
        Alamofire.request(.GET, url, parameters: ["s": query]).responseObject() {
            (response: Response<SearchResult, NSError>) in

            if let searchResult = response.result.value {
                if searchResult.success! {
                    delegate.moviesSearched(query, searchResult:searchResult)
                }
                else {
                    delegate.serverReturnedError(searchResult.message)
                }
            }
            else {
                delegate.serverReturnedError(response.result.error!.description)
            }
        }
    }

    func details() -> Movie {
        return Movie()
    }
}
