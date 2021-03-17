//
//  ViewController.swift
//  Quizzier
//
//  Created by Rashid on 16/03/21.
//

import UIKit


@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {
    
    let list = [
        Question(names: "1+3=5", answers: "False"),
        Question(names: "1+4=5", answers: "True"),
        Question(names: "1+8=5", answers: "False"),
        Question(names: "1+3=9", answers: "False")
    ]
    var index = 0
    var mark: Float = 0.00
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = list[0].name
        progressBar.progress = mark
    }

    @IBAction func answerButton(_ sender: UIButton) {
        if sender.currentTitle == list[index].answer {
            sender.borderColor = UIColor.green
            print("GOOD JOB")
            mark += 0.30
        }else{
            sender.borderColor = UIColor.red
            print("Wrong Bro")
            mark -= 0.30
        }
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
      
    }
    @objc func update()  {
        if index == list.count - 1 {
            index = 0
            
        }else {
            index += 1
        }
        trueButton.borderColor = UIColor.blue
        falseButton.borderColor = UIColor.blue
        question.text = list[index].name
        progressBar.progress = mark
    }
}

struct Question {
    var name: String
    var answer: String
    
    init(names: String, answers: String) {
        self.name = names
        self.answer = answers
    }
}
