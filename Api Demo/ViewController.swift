//
//  ViewController.swift
//  Api Demo
//
//  Created by MacStudent on 2020-01-17.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=46816174261e290d5ea37382c008aaef")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error)
            }else {
                if let urlContent = data {
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        print(jsonResult)

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

