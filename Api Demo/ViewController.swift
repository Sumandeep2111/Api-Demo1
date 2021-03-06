//
//  ViewController.swift
//  Api Demo
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityTextt: UITextField!
    
    @IBOutlet weak var weatherLABEL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    
    @IBAction func selectButton(_ sender: UIButton) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityTextt.text!.replacingOccurrences(of: "", with: "%20"))&appid=46816174261e290d5ea37382c008aaef")!
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   if let error = error{
                       print(error)
                   }else {
                       if let urlContent = data {
                           do{
                               let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                            //  print(jsonResult)
                              // print(jsonResult?["name"] as! String)
                               if let description = ((jsonResult?["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                   print(description)
                                DispatchQueue.main.async {
                                    self.weatherLABEL.text = description
                                }
                               }

                           }catch{
                               print(error)
                           }
                       }
                   }
               }
               //start the task
               task.resume()
    }
    

}

