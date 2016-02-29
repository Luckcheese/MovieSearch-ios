import UIKit


class DetailViewController: UITableViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var searchedItem: MovieSearchResult? {
        didSet {
            movie = FakeServer().details()
        }
    }

    var movie: Movie! {
        didSet {
            self.configureView()
        }
    }

    var infoDir = [(String, String)]()

    func configureView() {
        infoDir.removeAll(keepCapacity: true)

        infoDir.append(("ic_actors", movie.actors))
        infoDir.append(("ic_directors", movie.director))
        infoDir.append(("ic_writers", movie.writer))
        infoDir.append(("ic_release_date", movie.released))
        infoDir.append(("ic_duration", movie.runtime))
        infoDir.append(("ic_genre", movie.genre))
        infoDir.append(("ic_metascore", movie.metascore))
        infoDir.append(("ic_awards", movie.awards))
        infoDir.append(("ic_country", movie.country))

        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 79.0
        self.configureView()
    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoDir.count + 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("image_title", forIndexPath: indexPath) as! ImageTitleCell
                cell.titleView.text = movie.title
                return cell

            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("plot", forIndexPath: indexPath) as! PlotCell
                cell.plotView.text = movie.plot
                return cell

            default:
                let row = indexPath.row - 2

                let cell = tableView.dequeueReusableCellWithIdentifier("infoRow", forIndexPath: indexPath) as! InfoCell
                cell.iconView.image = UIImage(named:infoDir[row].0)
                cell.infoView.text = infoDir[row].1
                return cell
        }
    }

//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        switch indexPath.row {
//            case 0:
//                return 337.0
//
//            case 1:
//                return 91.0
//
//            default:
//                return UITableViewAutomaticDimension
//        }
//    }
//
//    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}
