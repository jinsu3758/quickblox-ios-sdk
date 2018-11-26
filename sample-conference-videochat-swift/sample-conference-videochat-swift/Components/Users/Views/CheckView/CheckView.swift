//
//  CheckView.swift
//  sample-conference-videochat-swift
//
//  Created by Vladimir Nybozhinsky on 17.10.2018.
//  Copyright © 2018 QuickBlox. All rights reserved.
//

import UIKit

class CheckView: UIView {
    //MARK: - Properties
    let checkboxNormalImage = UIImage(named: "checkbox-normal")
    let checkboxPressedImage = UIImage(named: "checkbox-pressed")
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView(image: checkboxNormalImage)
        imageView.frame = bounds
        return imageView
    }()
    
    var check: Bool? {
        didSet {
            guard let check = check else { return }
            imageView.image = check ? checkboxPressedImage : checkboxNormalImage
        }
    }
    
    //MARK: - Life Circle
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}
