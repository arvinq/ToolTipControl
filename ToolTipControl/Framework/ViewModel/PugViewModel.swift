//
//  PugViewModel.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/26/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation

struct PugViewModel {
    
    let pug: Pug
    let owner: Owner
    
    let pugImageUrl: URL?
    let message: String
    let tagsText: String
    let ownerImageUrl: URL?
    let ownerName: String
    
    let tags: [Tag]
    
    init(pug: Pug) {
        self.pug = pug
        self.owner = pug.owner
        self.tags = pug.tags
        
        self.pugImageUrl = URL(string: pug.image)
        self.message = pug.message.capitalized
        self.ownerImageUrl = URL(string: owner.image)
        self.ownerName = "\(owner.firstName) \(owner.lastName) (Owner)"
        
        let concatTags = tags.reduce("", { (result, eachTag) in
            "\(result)\(eachTag.title)," })
        
        let displayedTags = String(concatTags.dropLast())
        
        if !(displayedTags.isEmpty) {
            self.tagsText = "Tags: \(displayedTags)"
            
        } else {
            self.tagsText = "Tags: no tags available"
        }
        
        
    }
}
