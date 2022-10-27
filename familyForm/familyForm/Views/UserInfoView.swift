//
//  UserInfoView.swift
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
    
    let nameInputView: DataInputView = {
        let dataInputView = DataInputView()
        dataInputView.title.text = "Имя"
        dataInputView.textField.placeholder = "Введите имя..."
        dataInputView.textField.clearButtonMode = .whileEditing
        return dataInputView
    }()
    
    let ageInputView: DataInputView = {
        let dataInputView = DataInputView()
        dataInputView.title.text = "Возраст"
        dataInputView.textField.keyboardType = .asciiCapableNumberPad
        dataInputView.textField.clearButtonMode = .whileEditing
        dataInputView.textField.placeholder = "Введите возраст..."
        return dataInputView
    }()
    
    let userInfoStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private func viewSetup() {
        addSubview(userInfoStackView)
        userInfoStackView.addArrangedSubview(nameInputView)
        userInfoStackView.addArrangedSubview(ageInputView)
    }
    
    private func layoutSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: topAnchor),
            userInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
