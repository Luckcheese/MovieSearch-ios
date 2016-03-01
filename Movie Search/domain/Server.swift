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

            if self.handleRequestError(response, delegate:delegate) {
                delegate.moviesSearched(query, searchResult:response.result.value!)
            }
        }
    }

    func details(imdbId: String, delegate: ServerDetailDelegate) {
        Alamofire.request(.GET, url, parameters: ["i": imdbId]).responseObject() {
            (response: Response<Movie, NSError>) in

            if self.handleRequestError(response, delegate:delegate) {
                delegate.movieDetailRequested(imdbId, movie: response.result.value!)
            }
        }
    }

    private func handleRequestError<T: RequestError>(response: Response<T, NSError>, delegate: ServerError) -> Bool {
        if let result = response.result.value {
            if result.success! {
                return true
            }
            else {
                delegate.serverReturnedError(result.message)
            }
        }
        else {
            delegate.serverReturnedError(response.result.error!.description)
        }
        return false

    }
}
