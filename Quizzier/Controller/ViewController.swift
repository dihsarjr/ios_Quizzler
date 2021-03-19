

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
    
var quizBrain = QuizBrain()
   
    
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = quizBrain.list[quizBrain.index].name
        progressBar.progress = quizBrain.mark
    }

    @IBAction func answerButton(_ sender: UIButton) {
        if sender.currentTitle == quizBrain.list[quizBrain.index].answer {
            sender.borderColor = UIColor.green
            print("GOOD JOB")
            quizBrain.mark += 0.30
        }else{
            sender.borderColor = UIColor.red
            print("Wrong Bro")
            quizBrain.mark -= 0.30
        }
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
      
    }
    @objc func update()  {
        if quizBrain.index == quizBrain.list.count - 1 {
            quizBrain.index = 0
            
        }else {
            quizBrain.index += 1
        }
        trueButton.borderColor = UIColor.blue
        falseButton.borderColor = UIColor.blue
        question.text = quizBrain.list[quizBrain.index].name
        progressBar.progress = quizBrain.mark
    }
}


