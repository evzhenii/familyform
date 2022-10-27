//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

/*
 how to name views
 how to track kid view index to delete it
 how to change clear button width (without changing distribution of stackview
 how to organise code structure (where to put init, viewsetup, variable declarations)
 remove childIndexArray to childrenStackView.arrangedSubviews.count
 */

import UIKit

class UserInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        delegateSetup()
        layoutSetup()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    let personalDataBlock = PersonalDataBlock()
    let kidHeaderBlock = KidHeaderBlock()
    var childIndexArray = [Int]()
    
    lazy private var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = view.bounds
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let childrenStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(self.clearAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func clearAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (UIAlertAction) in
            self.personalDataBlock.input.nameContainer.textField.text = ""
            self.personalDataBlock.input.ageContainer.textField.text = ""
            self.childrenStackView.arrangedSubviews.forEach { (view) in
                self.childrenStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
                self.childrenStackView.removeFromSuperview()
            }
            self.childIndexArray.removeAll()
            self.scroll.contentSize = CGSize(width: self.mainStackView.frame.width, height: self.mainStackView.frame.height + 160)
            self.scroll.setContentOffset(.zero, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    private func viewSetup() {
        view.addSubview(scroll)
        scroll.addSubview(mainStackView)
        mainStackView.addArrangedSubview(personalDataBlock)
        mainStackView.addArrangedSubview(kidHeaderBlock)
        mainStackView.addArrangedSubview(clearButton)
    }
    
    private func delegateSetup() {
        kidHeaderBlock.kidHeaderDelegate = self
        personalDataBlock.input.nameContainer.textField.delegate = self
        personalDataBlock.input.ageContainer.textField.delegate = self
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scroll.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            kidHeaderBlock.heightAnchor.constraint(equalToConstant: 50),
            clearButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func loadView() {
        super.loadView()
        
    }
}

//MARK: - UITextFieldDelegate
extension UserInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == personalDataBlock.input.nameContainer.textField {
            personalDataBlock.input.ageContainer.textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}

//MARK: - KidHeaderDelegate
extension UserInfoViewController: KidHeaderDelegate {
    func didTapAddKid() {
        personalDataBlock.input.nameContainer.textField.resignFirstResponder()
        personalDataBlock.input.ageContainer.textField.resignFirstResponder()
        
        if childIndexArray.count < 5 {
            if childIndexArray.count == 0 {
                mainStackView.insertArrangedSubview(childrenStackView, at: mainStackView.arrangedSubviews.count - 1)
            }
            let kidInputSection = KidInputSection()
            kidInputSection.kidInputDelegate = self
            childIndexArray.append(childIndexArray.count)
            childrenStackView.addArrangedSubview(kidInputSection)
            scroll.contentSize = CGSize(width: mainStackView.frame.width, height: mainStackView.frame.height + 160)
        }
    }
}

//MARK: - KidInputDelegate
extension UserInfoViewController: KidInputDelegate {
    func didTapDeleteButton(from view: KidInputSection) {
        view.removeFromSuperview()
        childIndexArray.remove(at: childIndexArray.count - 1)
        if childIndexArray.count == 0 {
            self.childrenStackView.removeFromSuperview()
        }
        scroll.contentSize = CGSize(width: mainStackView.frame.width, height: mainStackView.frame.height + 160)
    }
}
