//
//  GrahamPotterViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/23/23.
//

import UIKit
import AVFoundation

class GrahamPotterViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?

    @IBOutlet weak var homeTable: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roundViewCorners(view: homeTable, radius: 18)

    }
    
    func roundViewCorners(view: UIView, radius: CGFloat) {
            view.layer.cornerRadius = radius
            view.layer.masksToBounds = true
        }
    
    func playSound() {
            if let soundURL = Bundle.main.url(forResource: "graham-potter", withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer?.play()
                } catch {
                    print("Error: Could not play sound.")
                }
            }
        }

        
    
    @IBAction func buttonPlay(_ sender: UIButton) {
        playSound()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
