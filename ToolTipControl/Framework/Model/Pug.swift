//
//  Pug.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/26/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation

struct Pug: Codable {
    let image: String
    let message: String
    let tags: [Tag]
    let owner: Owner
    
}

struct Tag: Codable {
    let title: String
}


/** intermediary structure */
struct Pugs: Codable {
    let data: [Pug]
}
