//
//  RootViewController.swift
//  PhotoApp
//
//  Created by Валентин Панин on 06.12.2020.
//

import UIKit

// рутовый контроллер

class RootViewController: UITableViewController {
    
    private enum Const {
        static let defaultCellIdentifier = "defaultCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Const.defaultCellIdentifier)
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "RootViewController"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(self.leftNavigationButtonPressed))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(self.rightNavigationButtonPressed))
    }
    
    @objc
    func leftNavigationButtonPressed() {
        NSLog("left navigation button was pressed")
    }
    
    @objc
    func rightNavigationButtonPressed() {
        NSLog("right navigation button was pressed")
        let viewController = OldViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension RootViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectPhotoViewController.ViewControllerType.allCases.count
    }
    
}

extension RootViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.defaultCellIdentifier)!
        cell.textLabel?.text = "\(SelectPhotoViewController.ViewControllerType.allCases[indexPath.row])"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            return
        }
        
        let viewController = SelectPhotoViewController(type: SelectPhotoViewController.ViewControllerType.allCases[indexPath.row])
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
