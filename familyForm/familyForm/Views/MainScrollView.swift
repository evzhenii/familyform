//
//  MainScrollView.swift
//  familyForm
//
//  Created by boockich mac on 27.10.2022.
//

import UIKit

class MainScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }
    
    let personalInfoInputView = UserInfoView()
    let childrenHeaderStackView = ChildrenHeaderStackView()
    
    private let personalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
//        button.addTarget(self, action: #selector(self.clearAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private func viewSetup() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(personalInfoLabel)
        mainStackView.addArrangedSubview(personalInfoInputView)
        mainStackView.addArrangedSubview(childrenHeaderStackView)
        mainStackView.addArrangedSubview(clearButton)
    }
    
    private func layoutSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            clearButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
