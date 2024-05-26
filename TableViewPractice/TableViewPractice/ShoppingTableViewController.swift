//
//  ShoppingTableViewController.swift
//  TableViewPractice
//
//  Created by Jinyoung Yoo on 5/25/24.
//

import UIKit

struct Shopping {
    var isComplete: Bool
    let wishContent: String
    var isStar: Bool
    var allData: (isComplete: Bool, wishContent: String, isStar: Bool) {
        return (isComplete: self.isComplete, wishContent: self.wishContent, isStar: self.isStar)
    }
    
    init(isComplete: Bool = false, wishContent: String, isStar: Bool = false) {
        self.isComplete = isComplete
        self.wishContent = wishContent
        self.isStar = isStar
    }
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var addTextFieldBackgroundView: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!

    private var shoppingData: [Shopping] = [
        .init(isComplete: true, wishContent: "그립톡 구매하기", isStar: true),
        .init(isComplete: false, wishContent: "사이다 구매", isStar: false),
        .init(isComplete: false, wishContent: "아이패드 케이스 최저가 알아보기", isStar: true),
        .init(isComplete: false, wishContent: "양말", isStar: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 60
        self.tableView.allowsSelection = false
        
        self.configureAddTextFieldBackgroundView()
        self.configureAddTextField()
        self.configureAddButton()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoppingData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WishListCellTableViewCell.self), for: indexPath) as! WishListCellTableViewCell
        let data = self.shoppingData[indexPath.row]

        cell.configure(data: data, tag: indexPath.row)
        
        cell.completeButton.addTarget(self, action: #selector(self.completeButtonTapped), for: .touchUpInside)
        cell.starButton.addTarget(self, action: #selector(self.starButtonTapped), for: .touchUpInside)
        return cell
    }
}

// MARK: - Configure Subviews
extension ShoppingTableViewController {
    private func configureAddTextFieldBackgroundView() {
        self.addTextFieldBackgroundView.layer.cornerRadius = 10
    }
    
    private func configureAddTextField() {
        self.addTextField.textColor = .black
        self.addTextField.placeholder = "무엇을 구매하실 건가요?"
        self.addTextField.borderStyle = .none
    }
    
    private func configureAddButton() {
        self.addButton.setTitle("추가", for: .normal)
        self.addButton.setTitleColor(.black, for: .normal)
        self.addButton.layer.cornerRadius = 10
        self.addButton.addTarget(self, action: #selector(self.addButtonTapped), for: .touchUpInside)
    }
}


// MARK: - User Action Handling
extension ShoppingTableViewController {
    @objc private func addButtonTapped() {
        guard let wishContent = self.addTextField.text, !wishContent.isEmpty else {
            return
        }
        
        let newShoppingData = Shopping(wishContent: wishContent)
        self.shoppingData.append(newShoppingData)
        self.tableView.reloadData()
        
        self.tableView.endEditing(true)
    }
    
    @objc private func completeButtonTapped(sender: UIButton) {
        let idx = sender.tag
        let indexPath = IndexPath(row: idx, section: 0)

        self.shoppingData[idx].isComplete.toggle()
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    @objc private func starButtonTapped(sender: UIButton) {
        let idx = sender.tag
        let indexPath = IndexPath(row: idx, section: 0)

        self.shoppingData[idx].isStar.toggle()
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
}
