//
//  ViewController.swift
//  OpenWeather
//
//  Created by Chakane Shegog on 9/22/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var weatherData = [weatherLocation]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        weatherData = Weather.getWeatherData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let locationData = segue.destination as? WeatherDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name is in identity inspector")
        }
        let location = weatherData[indexPath.row]
        locationData.weatherLocationData = location
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let data = weatherData[indexPath.row]
        cell.textLabel?.text = data.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
}

extension ViewController: UITableViewDelegate {}

