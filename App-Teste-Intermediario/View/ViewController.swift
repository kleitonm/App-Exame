//
//  ViewController.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let characterController = TableViewController()

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        delegateTable()
//        registerTableView()
        networkReloadData()
       
    }
    
//    func delegateTable() {
//        self.myTableView.delegate = self
//        self.myTableView.dataSource = self
//    }
    
//    func registerTableView() {
//        self.myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//    }
    
    func networkReloadData() {
        self.characterController.networkCharacters(name: nil) { result, error in
            if result {
                print("Data Ok")
                self.myTableView.reloadData()
            } else {
                print(error!)
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterController.getCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        cell?.setup(value: self.characterController.getCharacter(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
}
