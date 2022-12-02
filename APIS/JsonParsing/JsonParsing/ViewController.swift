//
//  ViewController.swift
//  JsonParsing
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 Divy Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrfinal.count;
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrfinal.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        let dic = arrfinal[indexPath.row] as! [String:Any];
        
        let ss = dic["name"] as! String;
        let code = dic["callingCodes"] as! [Any]
        let code1  = code[0] as! String
       cell.textLabel?.text = ss
        cell.detailTextLabel?.text = code1
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "secondViewcontroller")as! secondViewcontroller
        
        stb.arrdata = arrfinal[indexPath.row] as! [String:Any]
        
        self.navigationController?.pushViewController(stb, animated: true)
    }

    var arrfinal = [Any]();
    
    @IBOutlet var tbl: UITableView!
    override func viewDidLoad() {
        
        createjsonparsig()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createjsonparsig() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all");
        
        let request = URLRequest(url: url!);
        
        let session = URLSession.shared;
        
        let datatask = session.dataTask(with: request) { (data1, resp, err) in
            
        let strresp = String(data: data1!, encoding: String.Encoding.utf8)
            
         //   print(strresp);
            
            do
            {
            self.arrfinal = try JSONSerialization.jsonObject(with: data1!, options: [])as! [Any]
            
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

