import UIKit


class DetailViewController: UITableViewController, ServerDetailDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    let server = Server()

    var searchedItem: MovieSearchResult? {
        didSet {
            server.details(searchedItem!.imdbID, delegate:self)
        }
    }

    var movie: Movie? {
        didSet {
            self.configureView()
        }
    }

    var infoDir = [(String, String)]()

    func configureView() {
        if let movie = self.movie {
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
                if let m = movie {
                    cell.titleView.text = m.title
                }
                else {
                    cell.titleView.text = searchedItem!.title
                }
                return cell

            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("plot", forIndexPath: indexPath) as! PlotCell
                if let m = movie {
                    cell.plotView.text = m.plot
                }
                return cell

            default:
                let row = indexPath.row - 2

                let cell = tableView.dequeueReusableCellWithIdentifier("infoRow", forIndexPath: indexPath) as! InfoCell
                cell.iconView.image = UIImage(named:infoDir[row].0)
                cell.infoView.text = infoDir[row].1
                return cell
        }
    }


    // MARK: - ServerDetailDelegate

    func serverReturnedError(message: String) {
        UIAlertView(title:"Error", message:message, delegate:nil, cancelButtonTitle:"ok").show()
    }

    func movieDetailRequested(imdbId: String, movie: Movie) {
        self.movie = movie
        tableView.reloadData()
    }
}
