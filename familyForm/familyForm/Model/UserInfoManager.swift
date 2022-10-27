//
//  UserInfoManager.swift
//  familyForm
//
//  Created by boockich mac on 27.10.2022.
//

import UIKit


struct UserInfoManager {
    var children: [Int] = []
    
    mutating func clearAll(in view: MainScrollView) {
        print("clearing")
        view.personalInfoInputView.nameInputView.textField.text = ""
        view.personalInfoInputView.ageInputView.textField.text = ""
        view.childrenStackView.arrangedSubviews.forEach { (subView) in
            view.childrenStackView.removeArrangedSubview(subView)
            subView.removeFromSuperview()
            view.childrenStackView.removeFromSuperview()
        }
        children.removeAll()
        view.contentSize = CGSize(width: view.mainStackView.frame.width, height: view.mainStackView.frame.height + 160)
        view.setContentOffset(.zero, animated: true)
    }
}
