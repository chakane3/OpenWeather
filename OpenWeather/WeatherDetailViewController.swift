//
//  WeatherDetailViewController.swift
//  OpenWeather
//
//  Created by Chakane Shegog on 9/22/21.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weatherLocationData: weatherLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let locationData = weatherLocationData else {
            fatalError("nil found, check segue")
        }
        navigationItem.title = locationData.name
        descriptionLabel.text = "The temperature here is: \(String(locationData.main.temp))\nBut it feels like: \(String(locationData.main.feels_like))"
        
    }

}
