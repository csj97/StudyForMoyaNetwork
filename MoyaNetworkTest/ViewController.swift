//
//  ViewController.swift
//  MoyaNetworkTest
//
//  Created by OpenObject on 2023/02/13.
//

import UIKit
import Moya

class ViewController: UIViewController {
  
  @IBOutlet weak var labelText: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func tapOnGetButton(_ sender: UIButton) {
    getDataFromJsonPlaceHolder()
  }
  
  func getDataFromJsonPlaceHolder() {
    let moyaProvider = MoyaProvider<APIClient>()
    
    moyaProvider.request(.todos) { result in
      switch result {
      case .success(let response):
//        guard let todoTitle = try? response.mapJSON() else { return }
        guard let todo = try? response.map([Todos].self) else { return }
        self.labelText.text = todo[Int.random(in: 1..<10)].title
      case .failure(let moyaError):
        print(moyaError.errorDescription ?? "Moya API Request Error")
      }
    }
  }
  
}

