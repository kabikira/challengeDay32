//
//  ViewController.swift
//  challengeDay32
//
//  Created by koala panda on 2023/01/25.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShoppingList"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForWord))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeForList))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingWords.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = shoppingWords[indexPath.row]
        return cell
    }
    @objc func promptForWord() {
        let ac = UIAlertController(title: "Enter what you are buying", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let enterAction = UIAlertAction(title: "Enter", style: .default) { [weak self, weak ac] _ in guard let item = ac?.textFields?[0].text else { return }
            self?.enter(item)
        }
        ac.addAction(enterAction)
        present(ac, animated: true)
    }
    func enter(_ item: String) {
        shoppingWords.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    @objc func removeForList() {
        let ac = UIAlertController(title: "Do you want to delete the listing?", message: "", preferredStyle: .alert)
        let removeAction = UIAlertAction(title: "Done", style: .default) { _ in self.shoppingWords.removeAll()
            self.tableView.reloadData()
        }
        ac.addAction(removeAction)
                     
        present(ac, animated: true)
    }


}

