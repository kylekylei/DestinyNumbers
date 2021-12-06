//
//  ResultViewController.swift
//  DestinyNumbers
//
//  Created by Kyle Lei on 2021/12/1.
//
	
import UIKit

class ResultViewController: UIViewController {
    
    var birthday: Date
    init?(coder: NSCoder, birthday: Date) {
        self.birthday = birthday
        super.init(coder: coder)
    }    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var numberMeaningLabel: UILabel!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var consLabel: UILabel!
    @IBOutlet weak var numberImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    var number = 1
    
    func birthday(date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "y-M-d"
        return dateFormater.string(from: date)
    }

    func calculateLifeNumber(date: Date) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yMd"
        var numberString = dateFormater.string(from: date)
        var sum = 0
        repeat {
            sum = 0
            for character in numberString {
                let number = Int(String(character))!
                sum += number
            }
            numberString = "\(sum)"
        }while sum > 9
        return sum
    }
    
    func updateUI() {
        birthdayLabel.text = birthday(date: birthday)
        number = calculateLifeNumber(date: birthday)
        numberImage.image = UIImage(systemName: "\(number).square")
        numberMeaningLabel.text = destinyNumbers[number].numberMeaning
        prosLabel.text = destinyNumbers[number].pros
        consLabel.text = destinyNumbers[number].cons
        descriptionText.text = destinyNumbers[number].descriptions
        print(calculateLifeNumber(date: birthday))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
        updateUI()
    }

}
