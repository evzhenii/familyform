//
//  KidView.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

protocol KidInputDelegate {
    func didTapDeleteButton(from view: KidInputSection)
}

class KidInputSection: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(userInfoView)
        addSubview(deleteButton)
        layoutSetup()
    }
    
    private let userInfoView = UserInfoView()
    
    var kidInputDelegate: KidInputDelegate?
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        button.setTitle("Удалить", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func layoutSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoView.widthAnchor.constraint(equalToConstant: 200),
            userInfoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            deleteButton.centerYAnchor.constraint(equalTo: userInfoView.nameInputView.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: 20),
        ])
    }
    
    @objc private func deleteButtonTapped() {
        guard let delegate = kidInputDelegate else { return }
        delegate.didTapDeleteButton(from: self)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
