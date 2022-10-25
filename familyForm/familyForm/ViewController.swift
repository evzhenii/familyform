//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let personalData: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let kids: UILabel = {
        let label = UILabel()
        label.text = "Дети (макс. 5)"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
//        stack.alignment = .fill
//        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let fullInputContainer = FullInputContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        layoutSetup()
    }
    
    
    private func viewSetup() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(personalData)
        stack.addArrangedSubview(fullInputContainer)
        stack.addArrangedSubview(kids)
    }
    
    private func layoutSetup() {
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            personalData.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            personalData.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            fullInputContainer.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            fullInputContainer.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
        ])
    }

}

