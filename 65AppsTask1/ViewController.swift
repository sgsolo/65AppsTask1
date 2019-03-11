//
//  ViewController.swift
//  65AppsTask1
//
//  Created by Григорий Соловьев on 10.03.2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let kTableViewCellReuseIdentifier = String(describing: TableViewCell.self)
    let basePlaceholdUrlString = "http://placehold.it/375x150?text="
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }

    func configureTableView() {
        let nib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: kTableViewCellReuseIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kTableViewCellReuseIdentifier, for: indexPath) as! TableViewCell
        if let url = URL(string: basePlaceholdUrlString + String(describing: indexPath.item)) {
            cell.url = url
            self.downloadImage(withURL: url, forCell: cell)
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController {
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        APIService.downloadImage(withURL: url) { data in
            if let cell = cell as? TableViewCell, cell.url == url {
                cell.numberImageView.image = UIImage(data: data)
            }
        }
    }
}
