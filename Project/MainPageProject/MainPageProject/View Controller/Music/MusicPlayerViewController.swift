//
//  MusicPlayerViewController.swift
//  MainPageProject
//
//  Created by SIMA on 2017. 10. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController,UIGestureRecognizerDelegate {

    //MARK: - Variable
    var player: AVAudioPlayer!
    var musicPlayer: AVPlayer!
    var isPlay: Bool = false
    var cellImage: MusicCollectionViewCell?
    var songData: SongData?
    var currentIndex = 0{
        willSet{
            let selectedTitle = songData?.songTitle[newValue]
            let selectedArtist = songData?.artist[newValue]
            self.songTitle.text = selectedTitle
            self.artist.text = selectedArtist
        }
    }
    
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var albumDetailView: UIView!
    @IBOutlet weak var lyricAnimationY: NSLayoutConstraint!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var musicCollectionView: UICollectionView!
    @IBOutlet weak var playPasueButton: UIButton!
    @IBOutlet weak var lyricTextView: UITextView!
    @IBOutlet weak var lyricTitle: UILabel!
    @IBOutlet weak var lyricView: UIVisualEffectView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        songData = SongData()
        createUI()
        
        //gesture setting2
        let doubleClickGesture = UITapGestureRecognizer(target: self, action: #selector(self.doubleClickedView))
        let doubleClickGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.doubleClickedView))
        doubleClickGesture.numberOfTapsRequired = 2
        doubleClickGesture1.numberOfTapsRequired = 2
        doubleClickGesture.delegate = self
        doubleClickGesture1.delegate = self
        self.view.addGestureRecognizer(doubleClickGesture)
        self.view.addGestureRecognizer(doubleClickGesture1)
        
        //gesture setting
        let openLyric = UITapGestureRecognizer(target: self, action: #selector(self.tapAlbumCover(_:)))
        let cancelLyric = UITapGestureRecognizer(target: self, action: #selector(self.lyricCancelButton(_:)))
        let cancelLyric1 = UITapGestureRecognizer(target: self, action: #selector(self.lyricCancelButton(_:)))
        musicCollectionView.addGestureRecognizer(openLyric)
        lyricTextView.addGestureRecognizer(cancelLyric)
        lyricView.addGestureRecognizer(cancelLyric1)
    }
    
    //MARK: - Create UI
    
    func createUI() {
        let selectedTitle = songData?.songTitle[currentIndex]
        let selectedArtist = songData?.artist[currentIndex]
        self.songTitle.text = selectedTitle
        self.artist.text = selectedArtist
        musicCollectionView.reloadData()
        
        playPasueButton.isSelected = false
        playPasueButton.setImage(UIImage(named: "play-button") , for: .normal)
        playPasueButton.setImage(UIImage(named: "pause1") , for: .selected)
        
        if let url = Bundle.main.url(forResource: "Song/0", withExtension: "mp3") {
            musicPlayer = AVPlayer(url: url)
        }
        lyricAnimationY.constant = -self.view.frame.size.height
    }
    
    
    //MARK: - Play/Pause by Gesture
    @objc func doubleClickedView(_ sender: UITapGestureRecognizer) {
        if isPlay {
            playPasueButton.isSelected = false
            musicPlayer.pause()
            isPlay = false
        }else {
            playPasueButton.isSelected = true
            musicPlayer.play()
            isPlay = true
        }
    }
    //MARK: - Lyric Open Button
    @objc func tapAlbumCover(_ sender: UITapGestureRecognizer) {
        //앨범 커버 클릭시 가사 띄우기
        lyricAnimationY.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        lyricTitle.text = songData?.songTitle[currentIndex]
        lyricTextView.text = songData?.lyric[currentIndex]
    }
    
    //MARK: - Lyric Cancel Button
    
    @objc func lyricCancelButton(_ sender: UITapGestureRecognizer) {
        lyricAnimationY.constant = -self.view.frame.size.height
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - UI Button
    
    //MARK: - Play/Pause Button
    @IBAction func playPasueButton(_ sender: UIButton) {
        if isPlay {
            sender.isSelected = false
            musicPlayer.pause()
            isPlay = false
        }else {
            sender.isSelected = true
            musicPlayer.play()
            isPlay = true
        }
    }
    
    //MARK: - Next Song Button
    @IBAction func nextSongAction(_ sender: UIButton) {
        if currentIndex < ((songData?.imgList.count)! - 1) {
            currentIndex += 1
            musicPlay()
        }
        moveAlbumPage()
    }
    
    //MARK: - Prev Song Button
    @IBAction func prevSongAction(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            musicPlay()
        }
        moveAlbumPage()
    }
    
    //MARK: - Method
    func musicPlay() {
        if let url = Bundle.main.url(forResource: "Song/\(currentIndex)", withExtension: "mp3") {
            musicPlayer = AVPlayer(url: url)
            if isPlay{
                musicPlayer.play()
            }else {
                musicPlayer.pause()
            }
        }
    }
    
    func moveAlbumPage() {
        musicCollectionView.setContentOffset(CGPoint(x: (musicCollectionView.frame.width * 0.6 + 25) * CGFloat(currentIndex), y: 0), animated: true)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        lyricTitle.text = songData?.songTitle[currentIndex]
        lyricTextView.text = songData?.lyric[currentIndex]
        lyricTextView.setContentOffset(CGPoint(x: 0, y: 0) , animated: true)
    }
}

//MARK: - Extension
//MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension MusicPlayerViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(imgList.count)
        return songData?.imgList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
        cell.imgView.image = songData?.imgList[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sideInset = (collectionView.bounds.size.width - collectionView.bounds.size.width * 0.6) / 2
        
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.6, height: collectionView.frame.width * 0.6)
    }
    
    
}

//MARK: - UIScrollViewDelegate
extension MusicPlayerViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageIndex = Int(targetContentOffset.pointee.x/(scrollView.bounds.size.width * 0.6 + 25))
        
        currentIndex = pageIndex
        
        if let url = Bundle.main.url(forResource: "Song/\(currentIndex)", withExtension: "mp3") {
            musicPlayer = AVPlayer(url: url)
            if isPlay{
                musicPlayer.play()
            }else {
                musicPlayer.pause()
            }
        }
    }
}

