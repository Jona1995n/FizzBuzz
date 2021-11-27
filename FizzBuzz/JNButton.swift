//
//  JNButton.swift
//  FizzBuzz
//
//  Created by Jonathan Nunez on 11/11/21.
//

import UIKit

class JNButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        setTitle("0...100", for: .normal)
        setTitleColor( .darkGray , for: .normal)
        backgroundColor       = .init(white: 1.0, alpha: 0.8)
        layer.cornerRadius    = frame.size.height/2
    }
}
