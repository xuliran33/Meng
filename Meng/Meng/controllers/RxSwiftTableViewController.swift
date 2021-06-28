//
//  RxSwiftTableViewController.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/28.
//

import UIKit
import RxSwift

class RxSwiftTableViewController: BaseViewController {
    // 歌曲列表数据源
    let musicListModel = MusicViewModel()
    let cellIndentity = "musicCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentity)
        return tableView
    }()
    // 负责对象销毁
    let disposeBag  = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  给tableView设置cell
        musicListModel.data.bind(to: tableView.rx.items(cellIdentifier: cellIndentity)){_,music,cell in
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
        }.disposed(by: disposeBag)
        
        // 获取点击的model
        tableView.rx.modelSelected(Music.self).subscribe { (music) in
            print(music.name)
        }.disposed(by: disposeBag)
        
        // 获取cell的点击事件
        tableView.rx.itemSelected.bind { indexPath in
            self.tableView.deselectRow(at: indexPath, animated: true)
        }.disposed(by: disposeBag)


    }
    
    override func setsubViews() {
        super.setsubViews()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
}
