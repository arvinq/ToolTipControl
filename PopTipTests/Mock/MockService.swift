//
//  MockService.swift
//  PopTipTests
//
//  Created by Arvin Quiliza on 5/28/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation
@testable import ToolTipControl

class MockService {
    
    let mockFetchInfoResponse: Pug = Pug(image: "pugImageUrl", message: "any message",
                                         tags: [Tag(title: "sample")],
                                         owner: Owner(firstName: "mr", lastName: "last", image: "first"))
}

extension MockService: ServiceProtocol {
    /**
     Mock fetchInfo for Unit test
     */
    func fetchInfo(completion: @escaping ([Pug]?) -> ()) {
        completion([mockFetchInfoResponse])
    }
    
    
}
