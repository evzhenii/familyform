//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

/*
 how to name views
 how to track kid view index to delete it
 how to change clear button width (without changing distribution of stackview
 how to organise code structure (where to put init, viewsetup, variable declarations)
 remove childIndexArray to childrenStackView.arrangedSubviews.count
 */

import UIKit

class UserInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        delegateSetup()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func loadView() {
        super.loadView()
        view = mainScrollView
    }
    
    var childIndexArray = [Int]()
    let mainScrollView = MainScrollView()
    var userInfoManager = UserInfoManager()

    @objc private func clearAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (UIAlertAction) in
            self.userInfoManager.clearAll(in: self.mainScrollView)
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))

        self.present(alert, animated: true)
    }

    private func delegateSetup() {
        mainScrollView.clearButton.addTarget(self, action: #selector(clearAlert), for: .touchUpInside)
//        kidHeaderBlock.kidHeaderDelegate = self
//        personalDataBlock.input.nameContainer.textField.delegate = self
//        personalDataBlock.input.ageContainer.textField.delegate = self
    }
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

////MARK: - UITextFieldDelegate
//extension UserInfoViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == personalDataBlock.input.nameContainer.textField {
//            personalDataBlock.input.ageContainer.textField.becomeFirstResponder()
//        } else {
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//
//}
//
////MARK: - KidHeaderDelegate
//extension UserInfoViewController: KidHeaderDelegate {
//    func didTapAddKid() {
//        personalDataBlock.input.nameContainer.textField.resignFirstResponder()
//        personalDataBlock.input.ageContainer.textField.resignFirstResponder()
//
//        if childIndexArray.count < 5 {
//            if childIndexArray.count == 0 {
//                mainStackView.insertArrangedSubview(childrenStackView, at: mainStackView.arrangedSubviews.count - 1)
//            }
//            let kidInputSection = KidInputSection()
//            kidInputSection.kidInputDelegate = self
//            childIndexArray.append(childIndexArray.count)
//            childrenStackView.addArrangedSubview(kidInputSection)
//            scroll.contentSize = CGSize(width: mainStackView.frame.width, height: mainStackView.frame.height + 160)
//        }
//    }
//}
//
////MARK: - KidInputDelegate
//extension UserInfoViewController: KidInputDelegate {
//    func didTapDeleteButton(from view: KidInputSection) {
//        view.removeFromSuperview()
//        childIndexArray.remove(at: childIndexArray.count - 1)
//        if childIndexArray.count == 0 {
//            self.childrenStackView.removeFromSuperview()
//        }
//        scroll.contentSize = CGSize(width: mainStackView.frame.width, height: mainStackView.frame.height + 160)
//    }
//}
