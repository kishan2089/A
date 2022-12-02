//
//  secondViewcontroller.swift
//  JsonParsing
//
//  Created by MAC on 28/02/20.
//  Copyright © 2020 Divy Patel. All rights reserved.
//

import UIKit

class secondViewcontroller: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
        
    }
    
    func converarrtostring(arr:[Any]) -> String {
        
        var str = "";
        for itm in arr {
            
            str.append(itm as! String);
             str.append(",");
            
            
         }
        return str;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            cell.textLabel?.text = (arrdata["name"] as! String);
        }
        if indexPath.row == 1 {
            cell.textLabel?.text = (arrdata["capital"] as! String);
        }
        if indexPath.row == 2 {
            
            let borderdic = arrdata["borders"] as! ([Any])
        
            cell.textLabel?.text = converarrtostring(arr: borderdic)
        
        
        }
        return cell;
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
       // if indexPath.row == 0 {
            
            
            //cell.textLabel?.text =  "Name  \((arrdata["name"] as! String))";
            
       // }
       // if indexPath.row == 1 {
            
           // cell.textLabel?.text = (arrdata["capital"] as! String);
       // }
       // if indexPath.row == 2 {
            
            
            //let callingcode = arrdata["callingCodes"] as! [Any];
            
           // if(callingcode.count>0)
           // {
             //   cell.textLabel?.text = (callingcode[0] as! String);
                
                
           // }
            
        //}
    }
    

    var arrdata = [String:Any]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
