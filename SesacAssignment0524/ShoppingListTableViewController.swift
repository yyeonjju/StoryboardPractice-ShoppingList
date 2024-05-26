//
//  ShoppingListTableViewController.swift
//  SesacAssignment0524
//
//  Created by 하연주 on 5/25/24.
//

import UIKit

struct ShopItem {
    var isChceked : Bool
    let label : String
    var isBookmarked : Bool
}

class ShoppingListTableViewController: UITableViewController {
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shopList = [
        ShopItem(isChceked: false, label: "사이다", isBookmarked: true),
        ShopItem(isChceked: false, label: "그립톡 구매하기", isBookmarked: true),
        ShopItem(isChceked: true, label: "아이패드", isBookmarked: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
        title = "쇼핑"

        setupUI()
    }
    
    // MARK: - UI
    private func setupUI () {
        addTextField.placeholder = "무엇을 구매하실건가요?"
        addTextField.backgroundColor = .systemGray5
        addTextField.layer.cornerRadius = 15
        
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = .systemGray3
        addButton.layer.cornerRadius = 10
        addButton.setTitleColor(.black, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as! ShoppingListTableViewCell
        let rowData = shopList[indexPath.row]
        
        //checkboxButton
        cell.checkboxButton.setImage(UIImage(systemName: "checkmark.square\(rowData.isChceked ? ".fill" : "")"), for: .normal)
        cell.checkboxButton.tintColor = .black
        cell.checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
        cell.checkboxButton.tag = indexPath.row
        
        //shoppingItemLabel
        cell.shoppingItemLabel.text = rowData.label
        
        //starButton
        cell.starButton.setImage(UIImage(systemName: "star\(rowData.isBookmarked ? ".fill" : "")"), for: .normal)
        cell.starButton.tintColor = .black
        cell.starButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
        

        cell.backgroundColorView.backgroundColor = .systemGray5
        cell.backgroundColorView.layer.cornerRadius = 10
        
        return cell
    }
    
    
    // MARK: - addEvent
    @objc func checkboxButtonTapped(sender : UIButton) {
        let index = sender.tag
        shopList[index].isChceked.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    @objc func bookmarkButtonTapped(sender : UIButton) {
        let index = sender.tag
        shopList[index].isBookmarked.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    @objc func addButtonTapped() {
        shopList.append(ShopItem(isChceked: false, label: addTextField.text ?? "", isBookmarked: false))
        tableView.reloadData()
        addTextField.text = ""
    }


}
