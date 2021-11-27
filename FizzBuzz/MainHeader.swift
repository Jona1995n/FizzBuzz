//
//  MainHeader.swift
//  FizzBuzz
//
//  Created by Jonathan Nunez on 11/11/21.
//

import UIKit

class MainHeader: UIView {
    
    
    var textField: UISearchTextField = UISearchTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 45))
    
    var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "INPUT ARRAY"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "(FOR SOME FIZZBUZZ FUN)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var prefixedButton: JNButton = JNButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemIndigo
        
        addSubview(searchLabel)
        searchLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        searchLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        addSubview(detailLabel)
        detailLabel.leftAnchor.constraint(equalTo: searchLabel.rightAnchor, constant: 5).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: -7).isActive = true
        
        
        addSubview(textField)
        textField.backgroundColor = .systemBackground
        textField.returnKeyType = .search
        textField.keyboardType = .numbersAndPunctuation
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 10).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        addSubview(prefixedButton)
        prefixedButton.translatesAutoresizingMaskIntoConstraints = false
        prefixedButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        prefixedButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        prefixedButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
