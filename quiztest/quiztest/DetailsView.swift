//
//  DetailsView.swift
//  quiztest
//
//  Created by Eugene Kireichev on 20.03.2021.
//

import UIKit

protocol DetailsViewListner: AnyObject {
    func numberOfRowsChanged(_ numberOfRows: Int)
}

class DetailsView: UIView {
    
    private let substrateView = UIView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        return stackView
    }()
    
    private var dataSource: [ListViewModel] = []
    private let minNumberOfRows = 3
    private var shouldShowMinNumberOfRows = false
    private weak var listner: DetailsViewListner?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(substrateView)
        substrateView.translatesAutoresizingMaskIntoConstraints = false
        substrateView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        substrateView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        substrateView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        substrateView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        substrateView.backgroundColor = .systemBlue
        substrateView.layer.cornerRadius = 8
        substrateView.clipsToBounds = true
        
        substrateView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: substrateView.topAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: substrateView.bottomAnchor, constant: -8).isActive = true
        stackView.leftAnchor.constraint(equalTo: substrateView.leftAnchor, constant: 8).isActive = true
        stackView.rightAnchor.constraint(equalTo: substrateView.rightAnchor, constant: -8).isActive = true

        stackView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(reloadStack)))
        
    }
    
    @objc
    private func reloadStack() {
        shouldShowMinNumberOfRows = !shouldShowMinNumberOfRows

        let referenceIndex = shouldShowMinNumberOfRows ? (minNumberOfRows - 1) : (dataSource.count - 1)

        UIView.animate(withDuration: 0.5) {
            self.stackView.arrangedSubviews.enumerated().forEach { index, listView in
                listView.isHidden = index > referenceIndex
            }
        } completion: { _ in
            self.listner?.numberOfRowsChanged(self.shouldShowMinNumberOfRows ? self.minNumberOfRows : self.dataSource.count)
        }
    }
    
    func setup(dataSource: [ListViewModel], listner: DetailsViewListner?) {
        self.dataSource = dataSource
        self.listner = listner
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        dataSource.forEach {
            let listView = ListView()
            listView.setup(viewModel: $0)
            stackView.addArrangedSubview(listView)
        }
        setNeedsLayout()
    }
}
