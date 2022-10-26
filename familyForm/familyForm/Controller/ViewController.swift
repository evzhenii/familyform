//
//  ViewController.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        delegateSetup()
        layoutSetup()
    }
    
    let kidHeaderBlock = KidHeaderBlock()
    let personalDataBlock = PersonalDataBlock()
    var kidsArray = [UIView]()
    
    lazy private var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = view.bounds
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let stack: UIStackView = {
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
        button.addTarget(self, action: #selector(self.clearAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func clearAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (UIAlertAction) in
            for view in self.kidsArray {
                view.removeFromSuperview()
                self.kidsArray.removeLast()
            }
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    private func viewSetup() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(personalDataBlock)
        stack.addArrangedSubview(kidHeaderBlock)
        stack.addArrangedSubview(clearButton)
    }
    
    private func delegateSetup() {
        kidHeaderBlock.kidHeaderDelegate = self
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            kidHeaderBlock.heightAnchor.constraint(equalToConstant: 50),
            clearButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

//MARK: - KidHeaderDelegate
extension ViewController: KidHeaderDelegate {
    func didTapAddKid() {
        print(kidsArray.count)
        if kidsArray.count < 5 {
            let kidInputSection = KidInputSection()
            kidsArray.append(kidInputSection)
            kidInputSection.kidInputDelegate = self
            for view in kidsArray {
                stack.insertArrangedSubview(view, at: stack.arrangedSubviews.count - 1)
            }
            scroll.contentSize = CGSize(width: stack.frame.width, height: stack.frame.height + 160)
        }
    }
}

//MARK: - KidInputDelegate
extension ViewController: KidInputDelegate {
    func didTapDeleteButton() {
        let view = kidsArray[kidsArray.count - 1]
        view.removeFromSuperview()
        kidsArray.remove(at: kidsArray.count - 1)
        scroll.contentSize = CGSize(width: stack.frame.width, height: stack.frame.height + 160)
    }
}
