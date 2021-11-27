//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Jonathan Nunez on 11/11/21.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    
    var tableView: UITableView!
    
    var mainHeader: MainHeader!
    
    var footerView: UIView!
    
    var list = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.isHidden = true
        mainHeader.prefixedButton.addTarget(self, action: #selector(addNumbers), for: .touchUpInside)
    }

    func configureUI() {
        tableView = UITableView()
        tableView.rowHeight = 55
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        let headerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        mainHeader = MainHeader(frame: headerFrame)
        tableView.tableHeaderView = mainHeader
        view.addSubview(mainHeader)
        mainHeader.textField.delegate = self
    }
    
    @objc func addNumbers() {
        for num in 1...100 {
            let number = "\(num),"
            mainHeader.textField.text?.append(number)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = (textField.text as NSString?)!.replacingCharacters(in: range, with: string)

            // do whatever modifications you need to do, e.g. remove commas:
            text = text.replacingOccurrences(of: ",", with: "")
            let modulo = text.count % 1
            for index in stride(from: modulo, to: text.count, by: 1).reversed() {
                print(index)
                if index != 0 {
                    text.insert(",", at: text.index(text.startIndex, offsetBy: index))
                }
            
            }
            // manually set the new value
            textField.text = text

            // don't let it update itself
            return false
    }
    
    func didSearchFizzBuzz() {
        list.removeAll()
        
        if let text = mainHeader.textField.text, text != "" {
            let numbers = mainHeader.textField.text?.components(separatedBy: ",")
            
            for num in numbers! {
                if let _ = Int(num) {
                    print("All characters are Ints 👍🏽")
                } else {
                    
                    let alert = UIAlertController(title: "please make sure to pass in numbers only", message: nil, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    return
                }
                
                print(Int(num)!)
                if Int(num)! % 3 == 0, Int(num)! % 5 == 0 {
                    list.append("FIZZBUZZ 💤🐝💤🐝💤🐝💤🐝💤🐝💤🐝💤")
                } else if Int(num)! % 3 == 0 {
                    list.append("FIZZ 💤💤💤💤💤💤💤💤💤💤💤💤💤💤")
                } else if Int(num)! % 5 == 0 {
                    list.append("BUZZ 🐝🐝🐝🐝🐝🐝🐝🐝🐝🐝🐝🐝🐝🐝")
                } else {
                    list.append(num)
                }
               
                print(list)
            }
        } else {
            
            let alert = UIAlertController(title: "Please provide an input array", message: "Pass in an array for some fizzFun", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(defaultAction)
            self.present(alert, animated: true, completion: nil)
            print("textField is empty")
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        didSearchFizzBuzz()
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
        
        
        return true
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
