//
//  MengUIProtocal.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/25.
//

import Foundation

protocol MengUIProtocal {
    // 每个UI界面都要调用该方法, 以保证页面的一致性, 方便后续优化
    func setsubViews()
}
