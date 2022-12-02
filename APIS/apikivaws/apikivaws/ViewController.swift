//
//  ViewController.swift
//  apikivaws
//
//  Created by MACBOOK AIR on 05/03/20.
//  Copyright © 2020 MACBOOK AIR. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var arrfinal = [Any]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrfinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dic = arrfinal[indexPath.row] as! [String:Any]
        cell.textLabel?.text = dic ["loan_because"] as! String
        
        return cell
    }
    

   // @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        json()
    }
    

    func json() {
        let url = URL(string: "http://api.kivaws.org/v1/lenders/jeremy/teams.json")
        
        let request = URLRequest(url: url!);
        
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: request) { (data1, resp, err) in
            let strResp = String(data: data1!, encoding: String.Encoding.utf8)
            
            print(strResp)
            do
            {
                let jsondata = try JSONSerialization.jsonObject(with: data1!, options: [])as! [String:Any]
                self.arrfinal = jsondata["teams"] as! [Any]
                
                DispatchQueue.main.async {
                    
                    self.tbl.reloadData();
                }
            }
            catch
            {
                
            }
            
        }
    
        
        dataTask.resume()
}
}
