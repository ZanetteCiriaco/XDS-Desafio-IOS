//
//  FoodsViewController.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit
import SkeletonView

class FoodsViewController: UIViewController {

    private let foodsProtocol = FoodPresenter()
    var foods: [Food] = []
    var filtered: [Food] = []
    
    lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.height(40)
        bar.width(UIScreen.main.bounds.width)
        bar.placeholder = "Search"
        bar.delegate = self
        bar.setCustomColor()
        return bar
    }()
    
    let chooseYourFlavorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.text = "Escolha seu sabor"
        return label
    }()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.width(UIScreen.main.bounds.width)
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.register(FoodsTableViewCell.self, forCellReuseIdentifier: FoodsTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodsProtocol.attachView(self)
        self.foodsProtocol.getFoods()
        self.hideKeyboardWhenTappedAround()
        
        configureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func configureView() {
        view.backgroundColor = .black
        
        view.addSubview(searchBar)
        view.addSubview(chooseYourFlavorLabel)
        view.addSubview(table)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        searchBar.topToSuperview(offset: 29)
        searchBar.centerXToSuperview()
        
        chooseYourFlavorLabel.leftToSuperview(offset: 20)
        chooseYourFlavorLabel.topToBottom(of: searchBar, offset: 32)
        
        table.topToBottom(of: chooseYourFlavorLabel, offset: 22)
        table.centerXToSuperview()
        table.bottomToSuperview()
    }
}


extension FoodsViewController: FoodProtocol {
    func getFoods(response: [Food]) {
        self.foods = response
        self.filtered = foods
        self.table.reloadData()
    }
}


extension FoodsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filtered = searchText.isEmpty ? foods : foods.filter { (item) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        table.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


extension FoodsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodsTableViewCell.identifier, for: indexPath) as! FoodsTableViewCell
        
        cell.pizza = self.filtered[indexPath.row]
        return cell
    }
    
    
}

extension FoodsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(filtered[indexPath.row])
        let loadvc = FoodDetailsViewController(food: filtered[indexPath.row])
        loadvc.modalPresentationStyle = .fullScreen
        self.present(loadvc, animated: true)
    }
}

