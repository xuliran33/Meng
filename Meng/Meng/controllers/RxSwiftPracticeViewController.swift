//
//  RxSwiftPracticeViewController.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/24.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftPracticeViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RxSwift"
    }
    
    lazy var textfield1: UITextField = {
        let textfield1 = UITextField()
        textfield1.placeholder = "输入框"
        textfield1.borderStyle = .roundedRect
        
        return textfield1
    }()
    
    lazy var textfield2: UITextField = {
        let textfield2 = UITextField()
        textfield2.placeholder = "输出框"
        textfield2.borderStyle = .roundedRect
        
        return textfield2
    }()
    
    lazy var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.text = "输入字数"
        return countLabel
    }()
    
    lazy var submitBtn : UIButton = {
        let rxButton = UIButton()
        rxButton.setTitle("RxButtonAction", for: .normal)
        rxButton.setTitleColor(UIColor.black, for: .normal)
        rxButton.setTitleColor(UIColor.gray, for: .disabled)
        return rxButton
    }()
    
    let disposeBag = DisposeBag()
    override func setsubViews() {
        super.setsubViews()
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        let contentView = UIView()
        scrollView.addSubview(contentView)
        
        contentView.addSubview(textfield1)
        contentView.addSubview(textfield2)
        contentView.addSubview(countLabel)
        contentView.addSubview(submitBtn)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view);
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
        }
        
        textfield1.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(topMargin)
            make.left.equalTo(contentView).offset(leftMargin)
            make.centerX.equalTo(contentView)
            make.width.equalTo(screenWidth - 2 * leftMargin)
        }
        
        textfield2.snp.makeConstraints { (make) in
            make.top.equalTo(textfield1.snp_bottomMargin).offset(topMargin)
            make.left.equalTo(contentView).offset(leftMargin)
            make.centerX.equalTo(contentView)
            make.width.equalTo(screenWidth - 2 * leftMargin)
        }
        
        countLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textfield2.snp_bottomMargin).offset(topMargin)
            make.left.equalTo(contentView).offset(leftMargin)
            make.centerX.equalTo(contentView)
            make.width.equalTo(screenWidth - 2 * leftMargin)
        }
        
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(countLabel.snp_bottomMargin).offset(topMargin)
            make.left.equalTo(contentView).offset(leftMargin)
            make.centerX.equalTo(contentView)
            make.width.equalTo(screenWidth - 2 * leftMargin)
        }
        
        contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(submitBtn).offset(20)
        }
        
        inputAction()

    }

    func inputAction() {
        
        let input = textfield1.rx.text.orEmpty.asDriver() // 将普通序列转换为driver
            .throttle(RxTimeInterval.microseconds(300))
 // 在主线程中操作，若0.3秒值多次改变，取最后一次
        input.drive(textfield2.rx.text).disposed(by: disposeBag)
        input.map { "当前字数 \($0.count)"}
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
        input.map { $0.count > 5}
            .drive(submitBtn.rx.isEnabled)
            .disposed(by: disposeBag)
        
       
        
        
        

        textfield1.rx.text.orEmpty.asObservable().subscribe { (text) in
            
        }.disposed(by: disposeBag)
        
        submitBtn.rx.tap.subscribe(onNext: { () in
            print("点击了button")
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)

        
        
    }
}
