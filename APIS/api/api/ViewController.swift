//
//  ViewController.swift
//  api
//
//  Created by MACBOOK AIR on 03/03/20.
//  Copyright © 2020 MACBOOK AIR. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrfinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dic = arrfinal[indexPath.row] as! [String:Any]
        let location = dic["location"] as! [String:Any]
        let street = location["street"] as! [String:Any]
        let name = street["name"] as! String
        
        let login = dic["login"] as! [String:Any]
        let usernamme = login["username"] as! String
    
        cell.detailTextLabel?.text = usernamme
        cell.textLabel?.text = name
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        json()
    }
    var arrfinal = [Any]()

    @IBOutlet weak var tbl: UITableView!
    func json() {
        let url = URL(string: "http://randomuser.me/api/?page=1&results=7")
        
        let request = URLRequest(url: url!);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request) { (data1, resp, err) in
            
            let strresp = String(data: data1!, encoding: String.Encoding.utf8)
            
             print(strresp);
    
            do
            {
                let jsondata = try JSONSerialization.jsonObject(with: data1!, options: [])as! [String:Any]
                self.arrfinal = jsondata["results"] as! [Any]
                
                DispatchQueue.main.async {
                    
                    self.tbl.reloadData();
                }
            }
            catch
            {
                
            }
            
        }
        datatask.resume()
            
        }
        
        
    }
    
    


