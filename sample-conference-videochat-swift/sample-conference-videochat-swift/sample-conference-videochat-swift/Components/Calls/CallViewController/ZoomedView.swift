//
//  ZoomedView.swift
//  sample-conference-videochat-swift
//
//  Created by Vladimir Nybozhinsky on 04.10.2018.
//  Copyright © 2018 QuickBlox. All rights reserved.
//

import UIKit

class ZoomedView: UIView {
    //MARK: - Properties
    weak var videoView: UIView? {
        didSet {
            update(videoView)
        }
    }
    
    var didTapView: ((_ zoomedView: ZoomedView?) -> Void)?
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.0, alpha: 1.0)
        addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                    action: #selector(didReceiveTap(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    func update(_ videoView: UIView?) {
        guard let videoView = videoView else { return }
        self.videoView = videoView
        videoView.removeFromSuperview()
        videoView.frame = bounds
        videoView.autoresizingMask = [.flexibleWidth,
                                      .flexibleHeight,
                                      .flexibleLeftMargin,
                                      .flexibleRightMargin,
                                      .flexibleTopMargin,
                                      .flexibleBottomMargin]
        
        addSubview(videoView)
    }
    
    @objc func didReceiveTap(_ __unused: UITapGestureRecognizer?) {
        guard let didTapView = didTapView else { return }
        didTapView(self)
    }
}
