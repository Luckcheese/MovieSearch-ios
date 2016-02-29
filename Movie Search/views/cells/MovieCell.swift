import UIKit

protocol MovieCellDelegate {
    func showDetails(movie: MovieSearchResult)
    func share(movie: MovieSearchResult)
}

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var plotView: UILabel!

    var delegate: MovieCellDelegate?

    var movie: MovieSearchResult! {
        didSet {
            titleView.text = movie.title
            plotView.text = movie.year
        }
    }

    @IBAction func showDetails() {
        delegate?.showDetails(movie)
    }

    @IBAction func share() {
        delegate?.share(movie)
    }
}
