//
//  ChildInputView.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

protocol DeleteChildButtonDelegate {
    
    func didTapDeleteChildButton(from childInputView: ChildInputView)
}

class ChildInputView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(userInfoInputView)
        addSubview(deleteChildButton)
        layoutSetup()
    }
    
    private let userInfoInputView = UserInfoInputView()
    
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
    
    @objc private func deleteButtonTapped() {
        guard let delegate = deleteChildButtonDelegate else { return }
        delegate.didTapDeleteChildButton(from: self)
    }
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func layoutSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userInfoInputView.topAnchor.constraint(equalTo: topAnchor),
            userInfoInputView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoInputView.widthAnchor.constraint(equalToConstant: 200),
            userInfoInputView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            deleteChildButton.centerYAnchor.constraint(equalTo: userInfoInputView.nameInputView.centerYAnchor),
            deleteChildButton.leadingAnchor.constraint(equalTo: userInfoInputView.trailingAnchor, constant: 20),
        ])
    }
    
    func addSeparator() {
        addSubview(separatorView)
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
