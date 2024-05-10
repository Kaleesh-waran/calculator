//
//  ViewController.swift
//  Calculator
//
//  Created by Kaleeshwaran P on 02/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    let continerStackView: UIStackView = UIStackView()
    var isOn: Bool = false
    let displayTextField: UITextField = UITextField()
    let mainStackView: UIStackView = UIStackView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavBar()
        setupContinerStackView()
        setupDisplayLabel()
        setupMainStackView()
    }
    
    //MARK: - Methoeds
    private func setupNavBar() {
        
        navigationItem.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "moon.fill"), style: .done, target: self, action: #selector(modeChensh(_:)))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func setupContinerStackView() {
        
        view.addSubview(continerStackView)
        
        continerStackView.axis = .vertical
        continerStackView.distribution = .fillProportionally
        continerStackView.alignment = .fill
        continerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            continerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            continerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -10),
            continerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            continerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
    }
    
    private func setupDisplayLabel() {
        
        continerStackView.addArrangedSubview(displayTextField)
        
        displayTextField.translatesAutoresizingMaskIntoConstraints = false
        displayTextField.placeholder = "0"
        displayTextField.font = UIFont.boldSystemFont(ofSize: 40)
        displayTextField.textAlignment = .right
        
    }
    
    private func setupMainStackView() {
        
        continerStackView.addArrangedSubview(mainStackView)
        
        let row1: UIStackView = self.row1(text1: "AC", text2: "Del", text3: "+/-",
                                          text4: "/",tag1: 15,tag2: 16,tag3: 17,tag4: 13)
        let row2: UIStackView = self.row1(text1: "7", text2: "8", text3: "9", text4: "X",
                                          tag1: 7,tag2: 8,tag3: 9,tag4: 12)
        let row3: UIStackView = self.row1(text1: "4", text2: "5", text3: "6", text4: "-",
                                          tag1: 4,tag2: 5,tag3: 6,tag4: 11)
        let row4: UIStackView = self.row1(text1: "3", text2: "2", text3: "1", text4: "+",
                                          tag1: 3,tag2: 2,tag3: 1,tag4: 10)
        let row5: UIStackView = self.row1(text1: "%", text2: "0", text3: ".", text4: "=",
                                          tag1: 18,tag2: 0,tag3: 14,tag4: 19)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 5
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillEqually
        mainStackView.addArrangedSubview(row1)
        mainStackView.addArrangedSubview(row2)
        mainStackView.addArrangedSubview(row3)
        mainStackView.addArrangedSubview(row4)
        mainStackView.addArrangedSubview(row5)
        
    }
    
    private func row1(text1: String,text2: String,text3: String,text4: String,
                      tag1: Int,tag2: Int,tag3: Int,tag4: Int) -> UIStackView {
        
        let row1StackView: UIStackView = UIStackView()
        
        let _1button: UIButton = {
           
            let button = UIButton()
            
            button.setTitle(text1, for: .normal)
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 20
            button.tag = tag1
            
            return button
        }()
        
        let _2button: UIButton = {
            
            let button = UIButton()
            
            button.setTitle(text2, for: .normal)
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 20
            button.tag = tag2
            
            return button
        }()
        
        let _3button: UIButton = {
            
            let button = UIButton()
            
            button.setTitle(text3, for: .normal)
            button.backgroundColor = .systemGray
            button.layer.cornerRadius = 20
            button.tag = tag3
            
            return button
        }()
        
        let _4button: UIButton = {
            
            let button = UIButton()
            
            button.setTitle(text4, for: .normal)
            button.backgroundColor = .systemOrange
            button.layer.cornerRadius = 20
            button.tag = tag4
            
            return button
        }()
        
        _1button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        _2button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        _3button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        _4button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        row1StackView.addArrangedSubview(_1button)
        row1StackView.addArrangedSubview(_2button)
        row1StackView.addArrangedSubview(_3button)
        row1StackView.addArrangedSubview(_4button)
        
        row1StackView.axis = .horizontal
        row1StackView.alignment = .fill
        row1StackView.spacing = 5
        row1StackView.distribution = .fillEqually
        
        return row1StackView
    }
    
    //MARK: - @objc Methoeds
    
    @objc private func modeChensh(_ sender: UIButton) {
        
        if isOn {
            
            overrideUserInterfaceStyle = .light
            isOn = !isOn
            sender.tintColor = .black
            
        } else {
            
            overrideUserInterfaceStyle = .dark
            isOn = !isOn
            sender.tintColor = .white
            
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        
        ViewModel.shared.getValuve(tag: sender.tag, vc: self)
        
    }
}
  
