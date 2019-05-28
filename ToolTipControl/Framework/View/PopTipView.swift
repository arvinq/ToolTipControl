//
//  PopTipView.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/27/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation
import UIKit

class PopTipView: UIView {
    
    //MARK: UIViews
    lazy var pugImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.backgroundColor = UIColor(red: 235/255, green: 180/255, blue: 43/255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dataTag: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(message)
        view.addSubview(dataTag)
        return view
    }()
    
    lazy var ownerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ownerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ownerImage)
        view.addSubview(name)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // we want to set the corner radius based on the size the constraints has set on the button.
        // hence we do it in here where constraints are already done setting the sizes
        
        ownerImage.layer.cornerRadius = ownerImage.frame.size.width / 2
    }
    
    /**
     adding view's to subviews
     */
    func setupView() {
        backgroundColor = .white
        addSubview(pugImage)
        addSubview(textView)
        addSubview(ownerView)
        setupLayout()
    }
    
    /**
     Setting up layer's constraints
     */
    func setupLayout() {
        NSLayoutConstraint.activate([
            pugImage.topAnchor.constraint(equalTo: topAnchor),
            pugImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            pugImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            pugImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.topAnchor.constraint(equalTo: pugImage.bottomAnchor),
            textView.bottomAnchor.constraint(equalTo: ownerView.topAnchor),
            
            message.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 10),
            message.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -10),
            message.heightAnchor.constraint(equalTo: textView.heightAnchor, multiplier: 0.5),
            message.topAnchor.constraint(equalTo: textView.topAnchor, constant: 10),
            
            dataTag.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 10),
            dataTag.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -10),
            dataTag.heightAnchor.constraint(equalTo: textView.heightAnchor, multiplier: 0.5),
            dataTag.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -10),
            
            ownerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ownerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ownerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ownerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),
            
            ownerImage.leadingAnchor.constraint(equalTo: ownerView.leadingAnchor, constant: 10),
            ownerImage.widthAnchor.constraint(equalTo: ownerView.widthAnchor, multiplier: 0.25),
            ownerImage.heightAnchor.constraint(equalTo: ownerImage.widthAnchor),
            ownerImage.centerYAnchor.constraint(equalTo: ownerView.centerYAnchor),
            
            name.trailingAnchor.constraint(equalTo: ownerView.trailingAnchor, constant: -10),
            name.centerYAnchor.constraint(equalTo: ownerView.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: ownerImage.trailingAnchor, constant: 10)
            
            ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 500)
    }
}
