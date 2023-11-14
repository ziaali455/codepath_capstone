import UIKit

class MarketplaceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FoodCellDelegate {

    let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(FoodCell.self, forCellWithReuseIdentifier: "Cell")
            cv.backgroundColor = .white
            return cv
        }()

    let searchController = UISearchController(searchResultsController: nil)
    let fruitAndVegetableNames = [
        "Apple", "Banana", "Orange", "Strawberry", "Grapes",
        "Carrot", "Broccoli", "Spinach", "Tomato", "Cucumber",
        "Mango", "Pineapple", "Watermelon", "Blueberry", "Avocado",
        "Lettuce", "Bell Pepper", "Kiwi", "Pomegranate", "Eggplant"
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Explore"

        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true

        let headerLabel = UILabel()
        headerLabel.text = "Explore"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(headerLabel)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                   collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.delegate = self
        collectionView.dataSource = self // Assign the data source here
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // Replace with the actual number of items in your data source
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FoodCell
        let fruitAndVegetableEmojis: [String: String] = [
            "Apple": "🍎",
            "Banana": "🍌",
            "Orange": "🍊",
            "Strawberry": "🍓",
            "Grapes": "🍇",
            "Carrot": "🥕",
            "Broccoli": "🥦",
            "Spinach": "🍃",
            "Tomato": "🍅",
            "Cucumber": "🥒",
            "Mango": "🥭",
            "Pineapple": "🍍",
            "Watermelon": "🍉",
            "Blueberry": "🫐",
            "Avocado": "🥑",
            "Lettuce": "🥬",
            "Bell Pepper": "🫑",
            "Kiwi": "🥝",
            "Pomegranate": "🍑",
            "Eggplant": "🍆",
        ]

        // Create an array of corresponding apple emojis
        let fruitEmojis = fruitAndVegetableNames.map { fruitAndVegetableEmojis[$0] ?? "" }
          // Set the delegate to self
          cell.delegate = self
            
          // Replace the following lines with your actual data source
          let title = fruitEmojis[indexPath.item]
        let foodName = fruitAndVegetableNames[indexPath.item]
          let price = "$\(indexPath.item * 5)"

        cell.titleLabel.text = title
        cell.titleLabel.font = UIFont.systemFont(ofSize: 70)

        cell.nameLabel.textColor = UIColor.white
        cell.priceLabel.textColor = UIColor.white
        cell.nameLabel.font = UIFont.systemFont(ofSize: 30)
        cell.layer.cornerRadius = 10
          cell.backgroundColor = UIColor.orange
          cell.nameLabel.text = foodName
          cell.priceLabel.text = price

          //cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
          return cell
      }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 180) // Adjust the size as per your requirement
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust the spacing as needed
    }
    func foodCellTapped(_ cell: FoodCell) {
            // Handle the tap event here
            if let indexPath = collectionView.indexPath(for: cell) {
                let foodName = "Food Item \(indexPath.item + 1)"
                let price = "$\(indexPath.item * 5)"

                // Show a screen with food details (you can present a new view controller, for example)
                let detailsViewController = FoodDetailsViewController(foodName: foodName, price: price)
                navigationController?.pushViewController(detailsViewController, animated: true)
            }
        }
}
class FoodCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var priceLabel: UILabel!

    weak var delegate: FoodCellDelegate? // Add this line
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupSubviews()
    }

    private func setupSubviews() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    @objc private func handleTap() {
            // Notify the delegate that the cell is tapped
            delegate?.foodCellTapped(self)
        }
}
// Define a protocol for delegate
protocol FoodCellDelegate: AnyObject {
    func foodCellTapped(_ cell: FoodCell)
}
