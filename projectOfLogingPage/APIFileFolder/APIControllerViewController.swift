//
//  APIControllerViewController.swift
//  projectOfLogingPage
//
//  Created by R86 on 07/02/23.
//

import UIKit

class APIControllerViewController: UIViewController {
    @IBOutlet weak var dataTabelView: UITableView!
    var arrUsers: [Dictionary<String,AnyObject>] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        user()
        // Do any additional setup after loading the view.
    }
    private func setup(){
        
    }
    private func user(){
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else {return}
        var requet = URLRequest(url: url)
        requet.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: requet){ data,response,error in
            guard let apiData = data else {return}
            do{
                let json = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String,AnyObject>]
                self.arrUsers = json
                DispatchQueue.main.async {
                    self.dataTabelView.reloadData()
                }
                
            }catch{
                print(error)
            }
        }
        .resume()
    }
}

extension APIControllerViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let name = arrUsers[indexPath.row]
        cell.textLabel?.text = "\(name["name"] as! String) "
        return cell
    }
}

