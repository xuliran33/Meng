//
//  ViewController.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rx.modelSelected()
        return tableView
    }()
//    var chanels: Array<JSON>?
    let dataArray = ["RxSwift", "RxSwift tableView"]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadData()

    }
    
//    func loadData() {
//        MengProvider.request(.Chanels) { (result) in
//            if case let .success(reponse) = result {
//                let data = try? reponse.mapJSON()
//                let json = JSON(data!)
//                self.chanels = json["channels"].arrayValue
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    override func setsubViews() {
        super.setsubViews()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    
    // MARK: tableView的代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chanels?.count ?? 0
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        let name = chanels?[indexPath.row].dictionary?["name"]?.string
        cell.textLabel?.text = dataArray[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(RxSwiftPracticeViewController(), animated: true)
            break
        case 1:
            navigationController?.pushViewController(RxSwiftTableViewController(), animated: true)
            break
        default:
            break
        }
    }
    
    

}

