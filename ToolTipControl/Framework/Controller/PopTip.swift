//
//  PopTipViewController.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/26/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import UIKit


public class PopTip: UIViewController {
    
    let popTipView = PopTipView()
    
    /**
     Assign viewModel's values to the view's properties once view model obtain a value
     */
    var pugViewModel: PugViewModel? {
        didSet {
            popTipView.message.text = pugViewModel?.message
            popTipView.dataTag.text = pugViewModel?.tagsText
            popTipView.name.text = pugViewModel?.ownerName
            
            popTipView.pugImage.setImage(usingUrl: pugViewModel?.pugImageUrl)
            popTipView.ownerImage.setImage(usingUrl: pugViewModel?.ownerImageUrl)
        }
    }
    
    /**
     Loading custom view
   */
    override public func loadView() {
        super.loadView()
        view = popTipView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        fetchInfo()
    }
    
    /**
     Fetching pugs from service
     */
    func fetchInfo() {
        
        Service.shared.fetchInfo { [weak self] pugs in
            
            let pugsArray = pugs?.map { singlePug in
                return PugViewModel(pug: singlePug)
                } ?? []
            
            self?.pugViewModel = pugsArray[0]
            
        }
        
    }
    
    /**
     Sets up popover
     - Parameter viewItem: source view from the calling view controller
     */
    public func showToolTip(onItem viewItem: UIView) {
        modalPresentationStyle = .popover
        
        let presentationController = self.presentationController as! UIPopoverPresentationController
        presentationController.backgroundColor = self.view.backgroundColor
        presentationController.sourceView = viewItem
        presentationController.sourceRect = viewItem.bounds
        presentationController.permittedArrowDirections = [.down, .up]
        presentationController.delegate = self
    }
}

extension PopTip: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
