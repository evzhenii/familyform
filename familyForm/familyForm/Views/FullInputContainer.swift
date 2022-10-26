//
//  PersonalData.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class FullInputContainer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }
    
    let nameContainer: InputContainer = {
        let container = InputContainer()
        container.title.text = "Имя"
        container.field.placeholder = "Введите имя..."
        return container
    }()
    
    let ageContainer: InputContainer = {
        let container = InputContainer()
        container.title.text = "Возраст"
        container.field.keyboardType = .asciiCapableNumberPad
        container.field.clearButtonMode = .whileEditing
        container.field.placeholder = "Введите возраст..."
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
