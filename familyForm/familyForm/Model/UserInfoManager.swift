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
            if children.count == 0 {
                userInfoScrollView.userInfoStackView.insertArrangedSubview(userInfoScrollView.childrenStackView, at: userInfoScrollView.userInfoStackView.arrangedSubviews.count - 1)
            }
            let childInputView = ChildInputView()
            childInputView.deleteChildButtonDelegate = UserInfoViewController()
            userInfoScrollView.childrenStackView.insertArrangedSubview(childInputView, at: userInfoScrollView.childrenStackView.arrangedSubviews.count - children.count)
            children.append(children.count)
        }
    }
    
    mutating func deleteChild(_ childInputView: ChildInputView, in userInfoScrollView: UserInfoScrollView) {
        userInfoScrollView.childrenStackView.removeArrangedSubview(childInputView)
        childInputView.removeFromSuperview()
        print("before deleting there are \(children.count) children")
        children.removeLast()

        clearAll(in: userInfoScrollView)
        if children.count == 0 {
        }
        
    }
    
    func deleteChildrenStackView(in userInfoScrollView: UserInfoScrollView) {
        userInfoScrollView.childrenStackView.removeFromSuperview()
    }
    
    mutating func clearAll(in userInfoScrollView: UserInfoScrollView) {
        clearFields(in: userInfoScrollView)
        userInfoScrollView.childrenStackView.arrangedSubviews.forEach { (subView) in
            userInfoScrollView.childrenStackView.removeArrangedSubview(subView)
            subView.removeFromSuperview()
        }
        deleteChildrenStackView(in: userInfoScrollView)
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
