//
//  ChildInputView.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

protocol DeleteChildButtonDelegate {
    func didTapDeleteChildButton(from view: ChildInputView)
}

class ChildInputView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(userInfoView)
        addSubview(deleteChildButton)
        layoutSetup()
    }
    
    private let userInfoView = UserInfoView()
    
    var deleteChildButtonDelegate: DeleteChildButtonDelegate?
    
    private lazy var deleteChildButton: UIButton = {
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
            
            deleteChildButton.centerYAnchor.constraint(equalTo: userInfoView.nameInputView.centerYAnchor),
            deleteChildButton.leadingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: 20),
        ])
    }
    
    @objc private func deleteButtonTapped() {
        guard let delegate = deleteChildButtonDelegate else { return }
        delegate.didTapDeleteChildButton(from: self)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
