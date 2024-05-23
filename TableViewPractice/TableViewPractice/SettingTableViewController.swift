//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by Jinyoung Yoo on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    private var sectionTitles = ["전체 설정", "개인 설정", "기타"]
    private var rowTitles = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTitles[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic")!
        
        cell.textLabel?.text = rowTitles[indexPath.section][indexPath.row]
        
        return cell
    }

}
