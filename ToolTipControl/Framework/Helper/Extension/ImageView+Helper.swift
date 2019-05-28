//
//  ImageView+Helper.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/27/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /**
     Helper method to call service and fetch UIImage from image url.
     - Parameter url: image url
     */
    func setImage(usingUrl url: URL?) {
        Service.shared.fetchImage(usingUrl: url) { [weak self] image in
            guard let strongSelf = self else { return }
            strongSelf.image = image
        }
    }
}
