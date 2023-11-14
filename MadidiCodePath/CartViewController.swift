import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        // Cart Icon
        let cartIcon = UILabel()
        cartIcon.text = "🛒"
        cartIcon.font = UIFont.systemFont(ofSize: 60)
        cartIcon.textAlignment = .center
        cartIcon.translatesAutoresizingMaskIntoConstraints = false

        // Cart Label
        let cartLabel = UILabel()
        cartLabel.text = "Your Cart"
        cartLabel.font = UIFont.boldSystemFont(ofSize: 24)
        cartLabel.textColor = .white
        cartLabel.textAlignment = .center
        cartLabel.translatesAutoresizingMaskIntoConstraints = false

        // Item List
        let itemListLabel = UILabel()
        itemListLabel.text = "Items in your cart:"
        itemListLabel.font = UIFont.systemFont(ofSize: 18)
        itemListLabel.textColor = .white
        itemListLabel.translatesAutoresizingMaskIntoConstraints = false

        // Sample Items
        let item1Label = UILabel()
        item1Label.text = "🍎 Apple - $2.99"
        item1Label.font = UIFont.systemFont(ofSize: 16)
        item1Label.textColor = .white
        item1Label.translatesAutoresizingMaskIntoConstraints = false

        let item2Label = UILabel()
        item2Label.text = "🥑 Avocado - $1.99"
        item2Label.font = UIFont.systemFont(ofSize: 16)
        item2Label.textColor = .white
        item2Label.translatesAutoresizingMaskIntoConstraints = false

        // Stack View for Items
        let itemsStackView = UIStackView(arrangedSubviews: [item1Label, item2Label])
        itemsStackView.axis = .vertical
        itemsStackView.spacing = 8
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false

        // Checkout Button
        let checkoutButton = UIButton(type: .system)
        checkoutButton.setTitle("  Pay", for: .normal)
        checkoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.backgroundColor = .black // Change to your desired color
        checkoutButton.layer.cornerRadius = 8
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)

        // Add Subviews
        view.addSubview(cartIcon)
        view.addSubview(cartLabel)
        view.addSubview(itemListLabel)
        view.addSubview(itemsStackView)
        view.addSubview(checkoutButton)

        // Constraints
        NSLayoutConstraint.activate([
            cartIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),

            cartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cartLabel.topAnchor.constraint(equalTo: cartIcon.bottomAnchor, constant: 8),

            itemListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemListLabel.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 20),

            itemsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemsStackView.topAnchor.constraint(equalTo: itemListLabel.bottomAnchor, constant: 8),

            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            checkoutButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc func checkoutButtonTapped() {
        // Handle checkout button tapped
        print("Checkout button tapped!")
    }
}
