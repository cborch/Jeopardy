//
//  SplashScreenViewController.swift
//  JeopardyTrainer
//
//  Created by Carter Borchetta on 12/16/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    
    var yAtLaunch: CGFloat = 0.0
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yAtLaunch = logoImageView.frame.origin.y
        logoImageView.frame.origin.y = self.view.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playSound(soundName: "jeopardy-intro", audioPlayer: &audioPlayer)
        UIView.animate(withDuration: 2.0, animations: {self.logoImageView.frame.origin.y = self.yAtLaunch})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error data from \(soundName) could not be played as an audio file")
            }
            
        } else {
            print("Error could not load data from file \(soundName)")
        }
    }
    
    
    @IBAction func logoTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "ShowCategories", sender: nil)
    }
    

}
