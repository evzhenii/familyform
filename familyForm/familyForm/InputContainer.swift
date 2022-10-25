//
//  InputContainer.swift
//  familyForm
//
//  Created by boockich mac on 25.10.2022.
//

import UIKit

class InputContainer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderSetup()
        viewSetup()
        layoutSetup()
    }
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var title: UILabel = {
        var title = UILabel()
        title.textColor = .gray
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    lazy var field: UITextField = {
        var field = UITextField()
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.backgroundColor = .white
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func borderSetup() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    private func viewSetup() {
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(field)
    }
    
    private func layoutSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
