//
//  ViewController.swift
//  jsondata
//
//  Created by Birendra on 26/02/20.
//  Copyright © 2020 Birendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbl: UITableView!
    
    var arr = [Any]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getjsonData()
        // Do any additional setup after loading the view.
    }
    func getjsonData () {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: request) { (data1, resp, err) in
            
            let strresp = String(data: data1!, encoding: String.Encoding.utf8)
            
            do {
                try self.arr = JSONSerialization.jsonObject(with: data1!, options: []) as! [Any]
                
                DispatchQueue.main.async {
                    
                    self.tbl.reloadData()
                }
            } catch {
                
            }
        }
        
        datatask.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let dic = arr[indexPath.row] as! [String:Any]
        
        cell.textLabel?.text = dic["name"] as! String
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! secondView
        
        stb.arrdata = arr[indexPath.row] as! [String : Any]
        
        self.navigationController?.pushViewController(stb, animated: true)
    }


}

