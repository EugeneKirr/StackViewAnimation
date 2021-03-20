//
//  DetailsViewCell.swift
//  quiztest
//
//  Created by Eugene Kireichev on 20.03.2021.
//

import UIKit

class DetailsViewCell: UITableViewCell {
    
    private let detailsView = DetailsView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(detailsView)
        
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        detailsView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        detailsView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor).isActive = true
        detailsView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        detailsView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setup(dataSource: [ListViewModel], listner: DetailsViewListner) {
        detailsView.setup(dataSource: dataSource, listner: listner)
    }
    
}
