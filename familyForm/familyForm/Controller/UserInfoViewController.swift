//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(userInfoScrollView)
        layoutSetup()
        delegateSetup()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private lazy var userInfoScrollView: UserInfoScrollView = {
        let userInfoScrollView = UserInfoScrollView()
        userInfoScrollView.frame = view.bounds
        return userInfoScrollView
    }()
    
    @objc private func clearAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (UIAlertAction) in
            UserInfoManager.shared.clearAll(in: self.userInfoScrollView)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            userInfoScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func delegateSetup() {
        userInfoScrollView.personalInfoInputView.nameInputView.textField.delegate = self
        userInfoScrollView.personalInfoInputView.ageInputView.textField.delegate = self
        userInfoScrollView.childrenHeaderStackView.addChildButtonDelegate = self
        userInfoScrollView.clearButtonDelegate = self
//        userInfoScrollView.ChildInputView.deleteChildButtonDelegate = self
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension UserInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userInfoScrollView.personalInfoInputView.nameInputView.textField {
            userInfoScrollView.personalInfoInputView.ageInputView.textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: - AddChildButtonDelegate
extension UserInfoViewController: AddChildButtonDelegate {
    
    func didTapAddChildButton() {
        if let child = UserInfoManager.shared.createChild(in: userInfoScrollView) {
        child.deleteChildButtonDelegate = self
        }
        UserInfoManager.shared.updateScrollView(in: userInfoScrollView)
    }
}

//MARK: - DeleteChildButtonDelegate
extension UserInfoViewController: DeleteChildButtonDelegate {
    
    func didTapDeleteChildButton(from childInputView: ChildInputView) {
        UserInfoManager.shared.deleteChild(childInputView, in: userInfoScrollView)
    }
}

//MARK: - ClearButtonDelegate
extension UserInfoViewController: ClearButtonDelegate {
    
    func presentAlert(with alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    func didTapClearButton() {
        UserInfoManager.shared.clearAll(in: userInfoScrollView)
    }
}
