//
//  FoodDetailsViewController.swift
//  MadidiCodePath
//
//  Created by Ali Zia on 11/13/23.
//
import UIKit

class FoodDetailsViewController: UIViewController {

    var foodName: String?
    var price: String?

    convenience init(foodName: String, price: String) {
        self.init()
        self.foodName = foodName
        self.price = price
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Food Details"

        let nameLabel = UILabel()
        nameLabel.text = "Food: \(foodName ?? "")"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let priceLabel = UILabel()
        priceLabel.text = "Price: \(price ?? "")"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(priceLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
