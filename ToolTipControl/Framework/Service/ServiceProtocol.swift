//
//  ServiceProtocol.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/28/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation


protocol ServiceProtocol {
    func fetchInfo(completion: @escaping ([Pug]?) -> ())
}
