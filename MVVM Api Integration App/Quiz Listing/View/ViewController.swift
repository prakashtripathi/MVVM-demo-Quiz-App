//
//  ViewController.swift
//  MVVM Api Integration App
//
//  Created by Prakash Tripathi on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview : UITableView!
    var viewmodelObject = QuizViewModel()
    var quizModel : QuizModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        
        viewmodelObject.getAPIResponse {[weak self] result in
            switch result {
            case .success(let success):
                self?.quizModel = success
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }


}


extension ViewController : UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizModel?.data.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = quizModel?.data.questions[indexPath.row].question
        
        let label  = cell.viewWithTag(1) as! UILabel
        label.text = quizModel?.data.questions[indexPath.row].question
        return cell
    }
    
    
}

