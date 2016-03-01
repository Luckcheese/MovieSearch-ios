import Foundation

protocol SearchDelegate {
    func searchSuccess()
    func searchError(message: String)
}

class Search: ServerSearchDelegate {

    private let pageSize = 10

    private let server = Server()

    private var currentPage = 0

    var query: String!
    var totalResuls = 0
    var movies = [MovieSearchResult]()

    var delegate: SearchDelegate?

    init(query: String) {
        self.query = query
    }

    func nexPage() {
        if !canRequestNextPage() {
            return
        }

        currentPage++
        server.search(query, page:currentPage, delegate:self)
    }

    private func canRequestNextPage() -> Bool {
        return currentPage == 0 || totalResuls > currentPage * pageSize
    }


    // MARK: - ServerSearchDelegate

    func moviesSearched(query: String, searchResult: SearchResult) {
        totalResuls = searchResult.total
        movies += searchResult.result
        delegate!.searchSuccess()
    }

    func serverReturnedError(message: String) {
        delegate!.searchError(message)
    }
}
