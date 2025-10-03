//
//  AboutViewController.swift
//  Cantoboard
//
//  Created by Alex Man on 23/11/21.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let sections: [[(image: UIImage, title: String, url: String)]] = [
        [
            (CellImage.learn, LocalizedStrings.about_learnJyutping, "https://jyutping.org"),
            (CellImage.sourceCode, LocalizedStrings.about_sourceCode, "https://github.com/CanCLID/Cantoboard"),
            (CellImage.sourceCode, LocalizedStrings.about_upstreamSourceCode, "https://github.com/Cantoboard/Cantoboard"),
        ],
        [
            (CellImage.repository, "Rime Input Method Engine 中州韻輸入法引擎 (librime)", "https://github.com/rime/librime"),
            (CellImage.repository, "Rime 粵語拼音方案 (rime-cantonese)", "https://github.com/rime/rime-cantonese"),
            (CellImage.repository, "Rime 倉頡三代", "https://github.com/Arthurmcarthur/Cangjie3-Plus"),
            (CellImage.repository, "Rime 倉頡五代", "https://github.com/Jackchows/Cangjie5"),
            (CellImage.repository, "Rime 速成", "https://github.com/rime/rime-quick"),
            (CellImage.repository, "Rime 筆劃", "https://github.com/rime/rime-stroke"),
            (CellImage.repository, "Open Chinese Convert 開放中文轉換 (OpenCC)", "https://github.com/BYVoid/OpenCC"),
            (CellImage.repository, "ISEmojiView", "https://github.com/isaced/ISEmojiView"),
        ],
        [
            (CellImage.telegram, LocalizedStrings.about_telegram, "https://t.me/rime_cantonese"),
            (CellImage.email, LocalizedStrings.about_email, "mailto:support@jyutping.org"),
            (CellImage.rate, LocalizedStrings.about_appStore, "https://apps.apple.com/app/id6752963850"),
            (CellImage.team, LocalizedStrings.about_joinUs, "https://github.com/CanCLID"),
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = LocalizedStrings.other_about
        navigationController?.navigationBar.largeTitleTextAttributes = String.HKAttribute
        navigationController?.navigationBar.titleTextAttributes = String.HKAttribute
        view.backgroundColor = .systemBackground
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { Self.sections.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { Self.sections[section].count }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return LocalizedStrings.about_resources
        case 1: return LocalizedStrings.about_credit
        case 2: return LocalizedStrings.about_getInTouch
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.textLabel?.attributedText = self.tableView(tableView, titleForHeaderInSection: section)?.toHKAttributedString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Self.sections[indexPath.section][indexPath.row]
        return UITableViewCell(title: row.title, image: row.image)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let url = URL(string: Self.sections[indexPath.section][indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }
}
