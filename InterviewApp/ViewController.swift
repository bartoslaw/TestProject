//
//  ViewController.swift
//  InterviewApp
//
//  Created by Bartłomiej Smektała on 16/12/2020.
//

import UIKit

class ViewController: UIViewController, View {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UILabel!
    
    var controller: Controller?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller = Controller()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        let state = self.controller?.getData()
        
        if state == .data {
            self.showData()
        } else if state == .error {
            self.showError()
        } else {
            self.showEmpty()
        }
    }
    
    func showData() {
        self.tableView.reloadData()
    }
    
    func showError() {
        self.errorView.isHidden = false
    }
    
    func showEmpty() {
        let alertController = UIAlertController(title: "No Data", message: "No data found", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        cell.myTitleLabel.text = self.controller?.data[indexPath.row]
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

