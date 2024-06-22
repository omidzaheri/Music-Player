//
//  MusicPlayerViewController.swift
//  Music Player
//
//  Created by Omid Zaheri on 6/4/24.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController,AVAudioPlayerDelegate {
    
    
    //Outlet
    
    @IBOutlet weak var pervSongIcon: UIImageView!
    
    @IBOutlet weak var playSongIcon: UIImageView!
    
    @IBOutlet weak var nextSongIcon: UIImageView!
    
    @IBOutlet weak var songSlider: UISlider!
    
    
    
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestures()
        initMusicPlayer()
        
    }
    
    func initMusicPlayer() {
        guard let url = Bundle.main.url(forResource: "hobabe sorati", withExtension: "mp3") else {return}
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            audioPlayer?.delegate = self
            audioPlayer?.play()
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            songSlider.minimumValue = 0
            songSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
            
        }catch{
            print(error)
            
        }
    }
    
    func setupGestures() {
        let playPauseGesture = UITapGestureRecognizer(target: self, action: #selector(playPauseMusic))
        
        playSongIcon.isUserInteractionEnabled = true
        playSongIcon.addGestureRecognizer(playPauseGesture)
    }
    
    
    
    @objc func updateSlider() {
        
        songSlider.value = Float(audioPlayer?.currentTime ?? 0)
        
    }
    
    @objc func playPauseMusic() {
        
        print("Play Pause")
        
        if audioPlayer!.isPlaying {
            pauseSong()
        }else{
            playSong()
        }
    }
    
    //func
    
    func playSong() {
        audioPlayer?.play()
        playSongIcon.image = UIImage(systemName: "pause.fill")
    }
    func pauseSong() {
        audioPlayer?.pause()
        playSongIcon.image = UIImage(systemName: "play.fill")
    }
    
    @IBAction func sliderTouchDown(_ sender: UISlider) {
        pauseSong()
    }
    
    @IBAction func sliderTouchUpInside(_ sender: UISlider) {
        playSong()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        audioPlayer?.currentTime = TimeInterval(sender.value)
    }
    
    @IBAction func sliderTouchUpOutSide(_ sender: UISlider) {
        playSong()
    }

    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        timer?.invalidate()
        timer = nil
        
        playSongIcon.image = UIImage(systemName: "play.fill")
        songSlider.value = Float(audioPlayer?.duration ?? 0)

    }
}
