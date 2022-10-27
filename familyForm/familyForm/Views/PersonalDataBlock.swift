//
//  PersonalDataBlock.swift
//  familyForm
//
//  Created by boockich mac on 26.10.2022.
//

import UIKit

class PersonalDataBlock: UIStackView {
    
    let input = UserInfoView()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Персональные данные"
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 20
        addArrangedSubview(label)
        addArrangedSubview(input)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
