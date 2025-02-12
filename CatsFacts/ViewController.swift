//
//  ViewController.swift
//  CatsFacts
//
//  Created by Marius on 2023-11-13.
//

import UIKit

class ViewController: BaseViewController {
    
//    struct Cat {
//        var data: Cat
//    }
//
//    struct CatsFacts {
//        let fact: [String]
//        let lenght: Int
//    }

    let decoder = JSONDecoder()
    
    var cats: [Cat] = []
    var cat = Cat(fact: "", length: 0)
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var randomCatFactLabel: UILabel!
    @IBOutlet weak var catFactTextView: UITextView!
    @IBOutlet weak var likeFactButton: UIButton!
    @IBOutlet weak var nextFactButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setupUI()
        getCatFacts()
        stopLoading()
    }
    
    func setupUI() {
        randomCatFactLabel.text = "Random Cat Fact"
        self.catFactTextView.text = self.cat.fact
        likeFactButton.setTitle("Like it", for: .normal)
        nextFactButton.setTitle("More facts", for: .normal)
    }
    
    private func getCatFacts() {
        guard let url = URL(string: "https://catfact.ninja/fact") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                if let unwrappedData = data {
                    let object = try decoder.decode(Cat.self, from: unwrappedData)
                    self.cat = object
                    self.configureUI()
                }
            } catch {
                if let unwrappedData = data {
                    print(String(data: unwrappedData, encoding: .utf8) ?? "No data")
                    print(error)
                }
            }
        }
            
            task.resume()
    }
        
       func configureUI() {
            DispatchQueue.main.async {
                self.catFactTextView.text = self.cat.fact
            }
        }

    @IBAction func likeFactButtonTapped(_ sender: Any) {
//        cats.append(cat)
    }
    
    @IBAction func nextFactButtonTapped(_ sender: Any) {
        getCatFacts()
    }
}

