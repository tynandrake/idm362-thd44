//
//  ThiagoSilvaViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/19/23.
//

import UIKit
import AVFoundation

class ThiagoSilvaViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func playSound() {
            if let soundURL = Bundle.main.url(forResource: "thiago-silva", withExtension: "mp3") {
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
