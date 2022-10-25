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
        layoutSetup()
    }
    
    private let personalDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
     let kidsLabel: UILabel = {
        let label = UILabel()
        label.text = "Дети (макс. 5)"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addKidButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Добавить ребенка", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)), for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.link.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kidsContainer: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
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
    
    let fullInputContainer = FullInputContainer()
    
    private func viewSetup() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(personalDataLabel)
        stack.addArrangedSubview(fullInputContainer)
        stack.addArrangedSubview(kidsContainer)
        kidsContainer.addArrangedSubview(kidsLabel)
        kidsContainer.addArrangedSubview(addKidButton)
        
    }
    
    private func layoutSetup() {
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addKidButton.heightAnchor.constraint(equalToConstant: 50),
            addKidButton.widthAnchor.constraint(equalToConstant: 210),
        ])
    }

}

