import UIKit


class MasterViewController: UITableViewController, MovieCellDelegate, UISearchBarDelegate, SearchDelegate {

    var detailViewController: DetailViewController? = nil
    var movies = [MovieSearchResult]()

    let searchController = UISearchController(searchResultsController: nil)
    var server: Search!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController
        }

        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        tableView.backgroundView = UINib(
        nibName: "EmptyResultView",
                bundle: NSBundle.mainBundle()
        ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let movie = sender as? MovieSearchResult {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.searchedItem = movie
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let s = server {
            return String(format: "Encontramos %02d resultados:", s.totalResuls)
        }
        else {
            return nil
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MovieCell

        cell.delegate = self
        cell.movie = movies[indexPath.row]

        if let s = server {
            if indexPath.row == movies.count - 1 {
                s.nexPage()
            }
        }

        return cell
    }


    // MARK: - MovieCellDelegate

    func showDetails(movie: MovieSearchResult) {
        performSegueWithIdentifier("showDetail", sender:movie)
    }

    func share(movie: MovieSearchResult) {
        UIAlertView(title:"share", message:movie.title, delegate:nil, cancelButtonTitle:"ok").show()
    }


    // MARK: - UISearchBarDelegate

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let text = searchBar.text where text.characters.count > 0 {
            server = Search(query:text)
            server.delegate = self
            server.nexPage()
        }
    }


    // MARK: - SearchDelegate

    func searchSuccess() {
        movies = server!.movies
        tableView.reloadData()
    }

    func searchError(message: String) {
        movies = [MovieSearchResult]()
        tableView.reloadData()

        UIAlertView(title:"Error", message:message, delegate:nil, cancelButtonTitle:"ok").show()
    }
}
