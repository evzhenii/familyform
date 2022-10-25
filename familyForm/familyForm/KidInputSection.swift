//
//  KidView.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class KidInputSection: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(input)
        addSubview(deleteButton)
        layoutSetup()
    }
    
    private let input = FullInputContainer()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func layoutSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            input.topAnchor.constraint(equalTo: topAnchor),
            input.leadingAnchor.constraint(equalTo: leadingAnchor),
            input.widthAnchor.constraint(equalToConstant: 200),
            input.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: input.nameContainer.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: input.trailingAnchor, constant: 20),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
