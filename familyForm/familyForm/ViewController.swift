//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        kidHeaderBlock.addKidButton.addTarget(self, action: #selector(addKidButtonTapped), for: .touchUpInside)
        layoutSetup()
        
    }
    
    let kidInputSection = KidInputSection()
    let personalDataBlock = PersonalDataBlock()
    let kidHeaderBlock = KidHeaderBlock()
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc private func addKidButtonTapped() {
        print("success")
    }
    
    private func viewSetup() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(personalDataBlock)
        stack.addArrangedSubview(kidHeaderBlock)
        stack.addArrangedSubview(kidInputSection)
    }
    
    private func layoutSetup() {
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            kidHeaderBlock.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}
//
//extension ViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == ageContainer.field {
//            let allowedCharacters = CharacterSet.decimalDigits
//            let characterSet = CharacterSet(charactersIn: string)
//            return allowedCharacters.isSuperset(of: characterSet)
//        }
//        return true
//    }
//}

