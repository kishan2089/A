
import UIKit

class secondView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrdata = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6;
    }
    
    func converarrtostring(arr:[Any]) -> String {
        
        var str = "";
        for itm in arr {
            
            str.append(itm as! String);
            str.append(",");
            
        }
        
        return str
    }
    
    func converarrtodictostring(arr:[Any]) -> String {
        
        
        var str = "";
        
        for itm in arr {
            
            var dd = itm as! [String:Any];
            
            let name = dd["name"] as! String;
            
            str.append(name);
            str.append(",");
            
        }
        
        return str;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            
            
            cell.textLabel?.text =  "Name  \((arrdata["name"] as! String))";
            
        }
        if indexPath.row == 1 {
            
            cell.textLabel?.text = (arrdata["capital"] as! String);
        }
        if indexPath.row == 2 {
            
            
            let callingcode = arrdata["callingCodes"] as! [Any];
            
            if(callingcode.count>0)
            {
                cell.textLabel?.text = (callingcode[0] as! String);
                
                
            }
            
        }
        
        if indexPath.row == 3 {
          
            
            let borderarr =  arrdata["borders"] as! [Any];
            
            cell.textLabel?.text = converarrtostring(arr: borderarr);
            
            
            
        }
        if indexPath.row == 4 {
            
            
            let curre = arrdata["currencies"] as! [Any];
            
            let currdic = curre[0] as! [String:Any];
            cell.textLabel?.text =  (currdic["symbol"] as! String);
            
            
            
        }
        if indexPath.row == 5 {
            
            
            let arrlang = arrdata["languages"] as! [Any];
            
            cell.textLabel?.text = converarrtodictostring(arr: arrlang);
            
            
        }
        
       // let dic = arrdata[indexPath.row] as! [String:Any]
        
       // cell.textLabel?.text = dic["name"] as! String
        
        
        return cell
        
    }
    
}
