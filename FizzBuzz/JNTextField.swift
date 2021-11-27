//
//  JNTextField.swift
//  FizzBuzz
//
//  Created by Jonathan Nunez on 11/11/21.
//

import UIKit

class JNTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpField() {
        JNTextField.appearance().tintColor = .link
        layer.cornerRadius = 10
        layer.borderColor = UIColor.black.cgColor
        textColor = .black
        font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 2.5))
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        autocorrectionType = .no
        clipsToBounds = true
        
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView = indentView
        leftViewMode = .always
    }
}
