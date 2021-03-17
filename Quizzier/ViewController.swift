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
    
    let list = [["4+2=3","False"],["5+2+3=10","True"],["2+2+2=6","True"]]
    var index = 0
    var mark: Float = 0.00
    

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = list[0][0]
        progressBar.progress = mark
    }

    @IBAction func answerButton(_ sender: UIButton) {
        if sender.currentTitle == list[index][1] {print("GOOD JOB")
            mark += 0.30
        }else{print("Wrong Bro")
            mark -= 0.30
        }
        update()
    }
    func update()  {
        if index == list.count - 1 {
            index = 0
            
        }else {
            index += 1
        }
       
        question.text = list[index][0]
        progressBar.progress = mark
    }
}

