import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var detailItem: MovieSearchResult? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        if let label = detailDescriptionLabel {
            label.text = detailItem!.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
}
