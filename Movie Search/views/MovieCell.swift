import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var plotView: UILabel!

    var movie: MovieSearchResult! {
        didSet {
            titleView.text = movie.title
            plotView.text = movie.year
        }
    }
}
