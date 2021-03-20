//
//  ListView.swift
//  quiztest
//
//  Created by Eugene Kireichev on 20.03.2021.
//

import UIKit

class ListView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .natural
        label.tintColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .natural
        label.tintColor = .systemGray
        label.numberOfLines = 1
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        [titleLabel, subtitleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setup(viewModel: ListViewModel) {
        titleLabel.text = viewModel.titleText
        subtitleLabel.text = viewModel.subtitleText
        setNeedsLayout()
    }
}

struct ListViewModel {
    let titleText: String
    let subtitleText: String
}
