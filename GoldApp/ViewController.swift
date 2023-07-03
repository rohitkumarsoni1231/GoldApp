//
//  ViewController.swift
//  GoldApp
//
//  Created by Rohit Kumar on 7/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var manufacturingFeesTextField: UITextField!
    @IBOutlet weak var karatTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var todayPriceLabel: UILabel!
    @IBOutlet weak var yesterdayPriceLabel: UILabel!
    @IBOutlet weak var goldPriceStatus: UILabel!
    
    //MARK: - Static Data
    var priceForOneGram: Double = 198.0
    var yesterdayPrice: Double = 199.0
    
    var goldPrice: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        fetchGoldPrice()
        // Schedule a timer to fetch the gold price every 24 hours
        //        Timer.scheduledTimer(timeInterval: 24 * 60 * 60, target: self, selector: #selector(fetchGoldPrice), userInfo: nil, repeats: true)
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        
        guard let weightText = weightTextField.text,
              let manufacturingFeesText = manufacturingFeesTextField.text,
              let karatText = karatTextField.text,
              let weight = Double(weightText),
              let manufacturingFees = Double(manufacturingFeesText),
              var karat = Double(karatText)
        else {
            return
        }
        
        karat = priceForOneGram
        
        let price = (weight * karat) + manufacturingFees
        
        priceLabel.isHidden = false
        priceLabel.text = "\(price) AED"
        
        todayPriceLabel.isHidden = false
        yesterdayPriceLabel.isHidden = false
        goldPriceStatus.isHidden = false
        
        todayPriceLabel.text = "price for 1 gram today : \(priceForOneGram) AED"
        yesterdayPriceLabel.text = "price for 1 gram yesterday : \(yesterdayPrice) AED"
        
        if priceForOneGram > yesterdayPrice {
            goldPriceStatus.text = "Gold price is Increasing"
        } else if priceForOneGram < yesterdayPrice {
            goldPriceStatus.text = "Gold price is Decreasing"
        } else {
            goldPriceStatus.text = "Gold price is the same"
        }
    }
    
//    @objc func fetchGoldPrice() {
//        let headers = [
//            "x-access-token": "goldapi-ffut1rljn59uum-io",
//            "Content-Type": "application/json"
//        ]
//
//        let url = URL(string: "https://www.goldapi.io/api/XAU/AED")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data,
//                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                  let priceInfo = json["price"] as? [String: Any],
//                  let goldPrice = priceInfo["rate"] as? Double else {
//                // Handle API error or invalid response
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.goldPrice = goldPrice
//            }
//        }
//        task.resume()
//    }
    
    
    
    
}
