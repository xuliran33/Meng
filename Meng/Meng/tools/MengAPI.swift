//
//  MengAPI.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/11.
//

import Foundation
import Moya

let MengProvider = MoyaProvider<Meng>()

public enum Meng {
    case Chanels    // 获取频道页
    case playlist(String)   // 获取歌曲列表
         
}

extension Meng : TargetType {
    public var baseURL: URL {
        switch self {
        case .Chanels:
            return URL(string: "https://www.douban.com")!
        case .playlist(_):
            return URL(string: "https://douban.fm")!
        }
    }
    
    public var path: String {
        switch self {
        case .Chanels:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .Chanels:
            return .requestPlain
        case .playlist(let chanel):
            var params: [String : Any] = [:]
            params["channel"] = chanel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    
    public var headers: [String : String]? {
        return nil
    }
    
    
}


