//
//  FontPickerController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 6.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import UIKit

class FontPickerController: UITableViewController {

    var dataSource: [FontFamily] = []
    var rowTapped: ((FontFamily?) -> Void)?
    
    init(fontNames: [FontFamily]) {
        dataSource = fontNames.sorted()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.contentInset = .init(top: Spacing.small, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
    }
}

extension FontPickerController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fontName = dataSource[indexPath.row].rawValue
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 17)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowTapped?(dataSource[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    
}
