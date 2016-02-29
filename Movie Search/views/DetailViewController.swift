import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var searchedItem: MovieSearchResult? {
        didSet {
            movie = FakeServer().details()
        }
    }

    var movie: Movie? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        if let label = detailDescriptionLabel {
            if let info = movie {
                label.text = info.title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
}
