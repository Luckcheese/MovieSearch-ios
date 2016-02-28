import Foundation

class FakeServer {

    func search() -> [MovieSearchResult] {
        var result = [MovieSearchResult]()
        for _ in 0...10 {
            result.append(MovieSearchResult())
        }

        return result
    }
}
