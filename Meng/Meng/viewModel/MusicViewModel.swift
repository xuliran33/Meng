//
//  File.swift
//  Meng
//
//  Created by os_xuliran on 2021/6/28.
//

import Foundation
import RxSwift

struct MusicViewModel {
    let data = Observable.just(
        [
            Music(name: "歌曲A", singer:"歌手A"),
            Music(name: "歌曲B", singer:"歌曲B"),
            Music(name: "歌曲C", singer:"歌手C"),
            Music(name: "歌曲D", singer:"歌手D"),
            Music(name: "歌曲E", singer:"歌曲E"),
        ]
    )
}
