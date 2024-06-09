//
//  MusicPlayerViewController.swift
//  Music Player
//
//  Created by Omid Zaheri on 6/4/24.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {
    
    //Outlet
    
    @IBOutlet weak var pervSongIcon: UIImageView!
    
    @IBOutlet weak var playSongIcon: UIImageView!
    
    @IBOutlet weak var nextSongIcon: UIImageView!
    
    @IBOutlet weak var songSlider: UISlider!
    
    
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Gesture
        
        let playPauseGesture = UITapGestureRecognizer(target: self, action: #selector(playPauseMusic))
        let pervGesture = UITapGestureRecognizer(target: self, action: #selector(pervMusic))
        let nextGesture = UITapGestureRecognizer(target: self, action: #selector(nextMusic))
        
        playSongIcon.isUserInteractionEnabled = true
        playSongIcon.addGestureRecognizer(playPauseGesture)
        
        guard let url = Bundle.main.url(forResource: "hobabe sorati", withExtension: "mp3") else {return}
        
        
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
           
            audioPlayer?.play()
            
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            songSlider.minimumValue = 0
            songSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
            
        }catch{
            print(error)
            
        }
        
    }
    
    @objc func updateSlider() {

        songSlider.value = Float(audioPlayer?.currentTime ?? 0)

    }
    
    @objc func playPauseMusic() {
       
        print("Play Pause")
        
        if audioPlayer!.isPlaying {
            audioPlayer?.pause()
            playSongIcon.image = UIImage(systemName: "play.fill")
        }else{
            audioPlayer?.play()
            playSongIcon.image = UIImage(systemName: "pause.fill")
        }
        
    }
    
    @objc func pervMusic() { }
    @objc func nextMusic() { }
}
