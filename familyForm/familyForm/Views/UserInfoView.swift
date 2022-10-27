//
//  PersonalData.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class UserInfoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }
    
    let nameContainer: DataContainerView = {
        let container = DataContainerView()
        container.title.text = "Имя"
        container.textField.placeholder = "Введите имя..."
        return container
    }()
    
    let ageContainer: DataContainerView = {
        let container = DataContainerView()
        container.title.text = "Возраст"
        container.textField.keyboardType = .asciiCapableNumberPad
        container.textField.clearButtonMode = .whileEditing
        container.textField.placeholder = "Введите возраст..."
        return container
    }()
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private func viewSetup() {
        addSubview(stack)
        stack.addArrangedSubview(nameContainer)
        stack.addArrangedSubview(ageContainer)
    }
    
    private func layoutSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
