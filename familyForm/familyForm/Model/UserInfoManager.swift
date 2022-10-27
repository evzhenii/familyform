//
//  UserInfoManager.swift
//  familyForm
//
//  Created by boockich mac on 27.10.2022.
//

import UIKit


struct UserInfoManager {
    
    var children = [Int]()
    
    static var shared = UserInfoManager()
    
    mutating func addChild(in userInfoScrollView: UserInfoScrollView) {
        if children.count < 5 {
            let childInputView = ChildInputView()
            if children.count > 0 {
                childInputView.addSeparator()
            }
            childInputView.deleteChildButtonDelegate = UserInfoViewController()
            userInfoScrollView.childrenStackView.insertArrangedSubview(childInputView, at: userInfoScrollView.childrenStackView.arrangedSubviews.count - children.count)
            children.append(children.count)
        }
    }
    
    mutating func deleteChild(_ childInputView: ChildInputView, in userInfoScrollView: UserInfoScrollView) {
        userInfoScrollView.childrenStackView.removeArrangedSubview(childInputView)
        childInputView.removeFromSuperview()
        children.removeLast()
    }
    
    mutating func clearAll(in userInfoScrollView: UserInfoScrollView) {
        clearFields(in: userInfoScrollView)
        userInfoScrollView.childrenStackView.arrangedSubviews.forEach { (subView) in
            userInfoScrollView.childrenStackView.removeArrangedSubview(subView)
            subView.removeFromSuperview()
        }
        children.removeAll()
        
        updateScrollView(in: userInfoScrollView)
        userInfoScrollView.setContentOffset(.zero, animated: true)
    }
    
    func clearFields(in userInfoScrollView: UserInfoScrollView) {
        userInfoScrollView.personalInfoInputView.nameInputView.textField.text = ""
        userInfoScrollView.personalInfoInputView.ageInputView.textField.text = ""
    }
    
    func updateScrollView(in userInfoScrollView: UserInfoScrollView) {
        let stackViewFrame = userInfoScrollView.userInfoStackView.frame
        userInfoScrollView.contentSize = CGSize(width: stackViewFrame.width, height: stackViewFrame.height + 160)
    }
}
