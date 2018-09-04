//
//  ViewController.swift
//  maps
//
//  Created by brn.developers on 8/30/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       searchTF.delegate = self
       tableView.delegate = self
       tableView.dataSource = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPlaceByChoice(place: searchTF.text!)
        return true
    }
    func searchPlaceByChoice(place:String)
    {
        var googleAPI = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(place)&key=AIzaSyDgqFzT65QZqCClgvH7WL5xHZ2jvhGnzTU"
        googleAPI = googleAPI.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        var urlRequest = URLRequest(url: URL(string: googleAPI)!)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print("JsonData == \(String(describing: jsonData))")
            }
            else
            {
                print("There is error\(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
        
       
    }
    
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

