//
//  ViewController.swift
//  apiimage
//
//  Created by MACBOOK AIR on 03/03/20.
//  Copyright © 2020 MACBOOK AIR. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrfinal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as! TableViewCell
        let dic = arrfinal[indexPath.row] as![String:Any]
        let picture = dic["picture"] as! [String:Any]
        let medium = picture["medium"] as! String
        let url = URL(string: medium)
        do
        {
            cell .img.image = UIImage(data: try Data(contentsOf: url!))

        }
        catch
        {
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
var arrfinal = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   json()
    }

    @IBOutlet weak var tbl: UITableView!
    func json() {
        let url = URL(string: "http://randomuser.me/api/?page=1&results=3")
        
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
