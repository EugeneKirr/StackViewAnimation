//
//  ListViewCell.swift
//  quiztest
//
//  Created by Eugene Kireichev on 20.03.2021.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    private let listView = ListView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear

        contentView.addSubview(listView)
        
        listView.translatesAutoresizingMaskIntoConstraints = false
        listView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        listView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        listView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        listView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setup(viewModel: ListViewModel) {
        listView.setup(viewModel: viewModel)
    }
    
}

