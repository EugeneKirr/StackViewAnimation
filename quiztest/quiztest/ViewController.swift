//
//  ViewController.swift
//  quiztest
//
//  Created by Eugene Kireichev on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let detailsView = DetailsView()
    private let statusView = ListView()
    
    private let dataSource: [ListViewModel] = [
        .init(titleText: "Tap here", subtitleText: ""),
        .init(titleText: "Title 1", subtitleText: "Subtitle 1"),
        .init(titleText: "Title 2", subtitleText: "Subtitle 2"),
        .init(titleText: "Title 3", subtitleText: "Subtitle 3"),
        .init(titleText: "Title 4", subtitleText: "Subtitle 4"),
        .init(titleText: "Title 5", subtitleText: "Subtitle 5"),
        .init(titleText: "Title 6", subtitleText: "Subtitle 6"),
        .init(titleText: "Title 7", subtitleText: "Subtitle 7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        
        scrollView.addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        detailsView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        detailsView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        detailsView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        detailsView.setup(dataSource: dataSource, listner: self)
        
        scrollView.addSubview(statusView)
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 10).isActive = true
        statusView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        statusView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        statusView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        statusView.setup(viewModel: .init(titleText: " Status Title", subtitleText: " Status Subtitle"))
        statusView.backgroundColor = .systemYellow
        statusView.layer.cornerRadius = 8
        statusView.clipsToBounds = true
    }
}

extension ViewController: DetailsViewListner {
    func numberOfRowsChanged(_ numberOfRows: Int) {
        print(numberOfRows)
    }
}
