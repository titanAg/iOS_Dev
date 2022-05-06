//
//  ViewController.swift
//  BunniesHop
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bunnyView1: UIImageView!
    @IBOutlet weak var bunnyView5: UIImageView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedSegment: UISegmentedControl!
    @IBOutlet weak var hopsPerSecond: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    
    @IBAction func setSpeed(_ sender: Any) {
    bunnyView1.animationDuration=TimeInterval(2.0-speedSlider.value)
        
        
        bunnyView5.animationDuration = bunnyView1.animationDuration+TimeInterval(arc4random_uniform(10))/10
        
        bunnyView1.startAnimating()
        bunnyView5.startAnimating()
        
        toggleButton.setTitle("Sit Still!", for: UIControl.State())
        let hopRateString=String(format: "%1.2f hps", 1/(2-speedSlider.value))
        hopsPerSecond.text=hopRateString
    }
    @IBAction func toggleAnimation(_ sender: Any) {
        if (bunnyView1.isAnimating) {
            bunnyView1.stopAnimating()
            bunnyView5.stopAnimating()
            toggleButton.setTitle("Hop!", for: UIControl.State())
        } else {
            bunnyView1.startAnimating()
            bunnyView5.startAnimating()
            toggleButton.setTitle("Sit Still!", for: UIControl.State())
        }
    }
    
    @IBAction func SelectSpeedSeg(_ sender: Any) {
        let speed = Double(speedSegment.selectedSegmentIndex) * 0.4375
        speedSlider.value=Float(speed)
        setSpeed(speedSlider ?? 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hopAnimation: [UIImage] = [
            UIImage(named: "frame-1")!,
            UIImage(named: "frame-2")!,
            UIImage(named: "frame-3")!,
            UIImage(named: "frame-4")!,
            UIImage(named: "frame-5")!,
            UIImage(named: "frame-6")!,
            UIImage(named: "frame-7")!,
            UIImage(named: "frame-8")!,
            UIImage(named: "frame-9")!,
            UIImage(named: "frame-10")!,
            UIImage(named: "frame-11")!,
            UIImage(named: "frame-12")!,
            UIImage(named: "frame-13")!,
            UIImage(named: "frame-14")!,
            UIImage(named: "frame-15")!,
            UIImage(named: "frame-16")!,
            UIImage(named: "frame-17")!,
            UIImage(named: "frame-18")!,
            UIImage(named: "frame-19")!,
            UIImage(named: "frame-20")!
        ]
        bunnyView1.animationImages=hopAnimation
        bunnyView5.animationImages=hopAnimation
        bunnyView1.animationDuration=1.0
        bunnyView5.animationDuration=1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

