//
//  KidHeaderBlock.swift
//  familyForm
//
//  Created by boockich mac on 26.10.2022.
//

import UIKit

protocol KidHeaderDelegate {
    func didTapAddKid()
}

class ChildrenHeaderStackView: UIStackView {
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         spacing = 10
         distribution = .fillProportionally
         addArrangedSubview(label)
         addArrangedSubview(addKidButton)
         addKidButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         translatesAutoresizingMaskIntoConstraints = false
     }
    
    var kidHeaderDelegate: KidHeaderDelegate?
    
    @objc func addKidButtonTappped() {
        guard let delegate = kidHeaderDelegate else { return }
        delegate.didTapAddKid()
    }
    
    
    private let label: UILabel = {
       let label = UILabel()
       label.text = "Дети (макс. 5)"
       label.font = label.font.withSize(20)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   private lazy var addKidButton: UIButton = {
       let button = UIButton()
       button.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
       button.setTitle("Добавить ребенка", for: .normal)
       button.setTitleColor(.link, for: .normal)
       button.setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)), for: .normal)
       button.layer.borderColor = UIColor.link.cgColor
       button.layer.borderWidth = 2
       button.layer.cornerRadius = 25
       button.layer.masksToBounds = true
       button.addTarget(self, action: #selector(addKidButtonTappped), for: .touchUpInside)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
