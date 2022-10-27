//
//  MainScrollView.swift
//  familyForm
//
//  Created by boockich mac on 27.10.2022.
//

import UIKit

protocol ClearButtonDelegate {
    func didTapClearButton(from userInfoScrollView: UserInfoScrollView)
    func presentAlert(with alert: UIAlertController)
}

class UserInfoScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
        layoutSetup()
    }
    
    var clearButtonDelegate: ClearButtonDelegate?
    var personalInfoInputView = UserInfoView()
    let childrenHeaderStackView = ChildrenHeaderStackView()
    
    var childrenStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let personalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var userInfoStackView: UIStackView = {
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
        button.addTarget(self, action: #selector(clearAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func clearAlert() {
        guard let delegate = clearButtonDelegate else { return }

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (UIAlertAction) in
            delegate.didTapClearButton(from: self)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        delegate.presentAlert(with: alert)
//        self.present(alert, animated: true)
    }
    
    private func viewSetup() {
        addSubview(userInfoStackView)
        userInfoStackView.addArrangedSubview(personalInfoLabel)
        userInfoStackView.addArrangedSubview(personalInfoInputView)
        userInfoStackView.addArrangedSubview(childrenHeaderStackView)
        userInfoStackView.addArrangedSubview(clearButton)
    }
    
    private func layoutSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoStackView.topAnchor.constraint(equalTo: topAnchor),
            userInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userInfoStackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            
            clearButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
