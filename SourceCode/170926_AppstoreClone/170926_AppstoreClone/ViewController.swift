//
//  ViewController.swift
//  170926_AppstoreClone
//
//  Created by SIMA on 2017. 9. 26..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ovelay: UIImageView!
    var album: UIImageView!
    var backBtn: UIButton!
    var albumText: UILabel!
    var albumDate: UILabel!
    var middleimg1: UIImageView!
    var middleimg2: UIImageView!
    var middleimg3: UIImageView!
    var middleimg4: UIImageView!
    var middleimg5: UIImageView!
    var middleimg6: UIImageView!
    
    var summaryBtn: UIButton!
    var moviesBtn: UIButton!
    var moreBtn: UIButton!
    var summaryBar: UILabel!
    var movieBar: UILabel!
    var moreBar: UILabel!
    
    var discovBtn: UIButton!
    var genreBtn: UIButton!
    var artistBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        
        //첫번째 뷰 설정하기
        ovelay = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 255))
        ovelay.image = UIImage(named: "Artist Image Overlay Copy@2x.png")
        ovelay.contentMode = UIViewContentMode.scaleAspectFill
        view.addSubview(ovelay)
        
        albumText = UILabel(frame: CGRect(x: 11, y: 183, width: 351, height: 37))
        albumText.textAlignment = .left
        albumText.text = "Nina Dobrev"
        albumText.textColor = .white
        albumText.font = UIFont(name: "AppleGothic", size: 30)
        view.addSubview(albumText)
        
        albumDate = UILabel(frame: CGRect(x: 11, y: 220, width: 351, height: 17))
        albumDate.textAlignment = .left
        albumDate.text = "Actress | August 25, 1987"
        albumDate.textColor = .white
        albumDate.font = UIFont(name: "AppleGothic", size: 14)
        view.addSubview(albumDate)
        ////////////////////////////////////////////////////////////////////////////////
        
        //뒤로 가기 버튼 생성
        backBtn = UIButton(type: .system)
        backBtn.frame = CGRect(x: 12.5, y: 25, width: 12.5, height: 21)
        backBtn.setBackgroundImage(#imageLiteral(resourceName: "Navigation Bar.png"), for: .normal)
        backBtn.setBackgroundImage(#imageLiteral(resourceName: "Back Chevron.png"), for: .highlighted)
        backBtn.addTarget(self, action: #selector(ViewController.backBtnClicked(_:)), for: .touchUpInside)
        view.addSubview(backBtn)
        ////////////////////////////////////////////////////////////////////////////////

        //두번째 뷰 생성
        middleimg1 = UIImageView(frame: CGRect(x: 0, y: 255, width: 110, height: 110))
        middleimg1.image = UIImage(named: "img1.png")
        view.addSubview(middleimg1)
        
        
        let imgCover: UIView = UIView(frame: CGRect(x: 0, y: 255, width: 110, height: 110))
        imgCover.backgroundColor = UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 0.9)
        view.addSubview(imgCover)
        
        
        let imgNum: UILabel = UILabel(frame: CGRect(x: 23, y: 283, width: 64.4, height: 34))
        imgNum.font = UIFont(name: "AppleGothic", size: 28)
        imgNum.text = "25+"
        imgNum.textAlignment = .left
        imgNum.textColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        view.addSubview(imgNum)
        
        
        let photoAlbum: UILabel = UILabel(frame: CGRect(x: 10.5, y: 329, width: 89, height: 17))
        photoAlbum.font = UIFont(name: "AppleGothic", size: 14)
        photoAlbum.text = "Photo Albums"
        photoAlbum.textAlignment = .left
        photoAlbum.textColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        view.addSubview(photoAlbum)
        
        
        middleimg2 = UIImageView(frame: CGRect(x: 110, y: 255, width: 110, height: 110))
        middleimg2.image = UIImage(named: "img2.png")
        view.addSubview(middleimg2)
        
        
        middleimg3 = UIImageView(frame: CGRect(x: 220, y: 255, width: 78, height: 55))
        middleimg3.image = UIImage(named: "img3.png")
        view.addSubview(middleimg3)
        
        
        middleimg6 = UIImageView(frame: CGRect(x: 297, y: 310, width: 78, height: 55))
        middleimg6.image = UIImage(named: "img6.png")
        view.addSubview(middleimg6)
        
        middleimg4 = UIImageView(frame: CGRect(x: 220, y: 310, width: 78, height: 55))
        middleimg4.image = UIImage(named: "img4.png")
        view.addSubview(middleimg4)
        
        
        middleimg5 = UIImageView(frame: CGRect(x: 297, y: 255, width: 78, height: 55))
        middleimg5.image = UIImage(named: "img5.png")
        view.addSubview(middleimg5)
        
        //세번째 뷰 생성
        
        summaryBtn = UIButton(type: .custom)
        summaryBtn.frame = CGRect(x: 0, y: 365, width: view.frame.width/3, height: 45)
        summaryBtn.titleLabel?.font = UIFont(name: "AppleGothic", size: 16)
        summaryBtn.titleLabel?.textAlignment = .center
        summaryBtn.setTitle("Summary", for: .normal)
        summaryBtn.backgroundColor = .white
        summaryBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0), for: .normal)
        summaryBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 0.5), for: .highlighted)
        summaryBtn.setTitleColor(UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0), for: .selected)
        summaryBtn.isSelected = true
        summaryBtn.addTarget(self, action: #selector(ViewController.menubtnClicked(_:)), for: .touchUpInside)
        summaryBtn.tag = 0
        view.addSubview(summaryBtn)
        
        
        
        moviesBtn = UIButton(type: .custom)
        moviesBtn.frame = CGRect(x: view.frame.width/3, y: 365, width: view.frame.width/3, height: 45)
        moviesBtn.titleLabel?.font = UIFont(name: "AppleGothic", size: 16)
        moviesBtn.titleLabel?.textAlignment = .center
        moviesBtn.setTitle("movies", for: .normal)
        moviesBtn.backgroundColor = .white
        moviesBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0), for: .normal)
        moviesBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 0.5), for: .highlighted)
        moviesBtn.setTitleColor(UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0), for: .selected)
        moviesBtn.isSelected = false
        moviesBtn.addTarget(self, action: #selector(ViewController.menubtnClicked(_:)), for: .touchUpInside)
        moviesBtn.tag = 1
        view.addSubview(moviesBtn)
        
       
        moreBtn = UIButton(type: .custom)
        moreBtn.frame = CGRect(x: 2*view.frame.width/3, y: 365, width: 1*view.frame.width/3, height: 45)
        moreBtn.titleLabel?.font = UIFont(name: "AppleGothic", size: 16)
        moreBtn.titleLabel?.textAlignment = .center
        moreBtn.setTitle("more", for: .normal)
        moreBtn.backgroundColor = .white
        moreBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0), for: .normal)
        moreBtn.setTitleColor(UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 0.5), for: .highlighted)
        moreBtn.setTitleColor(UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0), for: .selected)
        moreBtn.isSelected = false
        moreBtn.addTarget(self, action: #selector(ViewController.menubtnClicked(_:)), for: .touchUpInside)
        moreBtn.tag = 2
        view.addSubview(moreBtn)
        
        summaryBar = UILabel(frame: CGRect(x: 0, y: 408, width: 124, height: 3))
        summaryBar.backgroundColor = UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        view.addSubview(summaryBar)
        
        movieBar = UILabel(frame: CGRect(x: view.frame.width/3, y: 408, width: 124, height: 3))
        movieBar.backgroundColor = UIColor.white
        view.addSubview(movieBar)
        
        moreBar = UILabel(frame: CGRect(x: 2*view.frame.width/3, y: 408, width: 124, height: 3))
        moreBar.backgroundColor = UIColor.white
        view.addSubview(moreBar)
        
        
        
        
        //4번째 뷰
        let textHeader: UILabel = UILabel(frame: CGRect(x: 11, y: 429, width: 244, height: 17))
        textHeader.textAlignment = .left
        textHeader.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        textHeader.font = UIFont(name: "AppleGothic", size: 14)
        textHeader.text = "Tarzana, Los Angeles, California, USA"
        view.addSubview(textHeader)
        
        let textBody: UILabel = UILabel(frame: CGRect(x: 11, y: 454, width: 351, height: 140))
        textBody.textAlignment = .left
        textBody.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        textBody.font = UIFont(name: "AppleGothic", size: 14)
        textBody.numberOfLines = 0
        textBody.text = "Blake Lively was born Blake Ellender Brown in Tarzana, California, to a show business family. Her mother, Elaine Lively (née McAlpin), is an acting coach and talent manager, and her father, Ernie Lively (born Ernest Wilson Brown, Jr.), is an actor and teacher. Her brother is actor Eric Lively, and her half-siblings are actors Lori Lively, Robyn."
        view.addSubview(textBody)
    
        //5번째 뷰
        let underView: UIView = UIView(frame: CGRect(x: 0, y: 600, width: 375, height: 49))
        underView.backgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        view.addSubview(underView)
        
        
        
        discovBtn = UIButton(frame: CGRect(x: 42.5, y: 608, width: 40, height: 41))
        discovBtn.setImage(#imageLiteral(resourceName: "Discover.png"), for: .normal)
        discovBtn.setImage(#imageLiteral(resourceName: "DiscoverClicked.png"), for: .selected)
        discovBtn.isSelected = true
        discovBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        discovBtn.addTarget(self, action: #selector(ViewController.underBarMenu(_:)), for: .touchUpInside)
        discovBtn.tag = 0
        view.addSubview(discovBtn)
        
        genreBtn = UIButton(frame: CGRect(x: 170, y: 610, width: 40, height: 39))
        genreBtn.setImage(#imageLiteral(resourceName: "Genre.png"), for: .normal)
        genreBtn.setImage(#imageLiteral(resourceName: "GenreClicked.png"), for: .selected)
        genreBtn.isSelected = false
        genreBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        genreBtn.addTarget(self, action: #selector(ViewController.underBarMenu(_:)), for: .touchUpInside)
        genreBtn.tag = 1
        view.addSubview(genreBtn)
        
        artistBtn = UIButton(frame: CGRect(x: 295, y: 607.3, width: 40, height: 41.7))
        artistBtn.setImage(#imageLiteral(resourceName: "Artist.png"), for: .normal)
        artistBtn.setImage(#imageLiteral(resourceName: "ArtistClicked.png"), for: .selected)
        artistBtn.isSelected = false
        artistBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        artistBtn.addTarget(self, action: #selector(ViewController.underBarMenu(_:)), for: .touchUpInside)
        artistBtn.tag = 2
        view.addSubview(artistBtn)
        
        
        //6번째 뷰
        let lastView: UIView = UIView(frame: CGRect(x: 0, y: 649, width: 375, height: 18))
        lastView.backgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        view.addSubview(lastView)

        
    }
    func underBarMenu (_ sender: UIButton) {
        let index = sender.tag
        if index == 0 {
            discovBtn.isSelected = true
            genreBtn.isSelected = false
            artistBtn.isSelected = false
        }else if index == 1 {
            discovBtn.isSelected = false
            genreBtn.isSelected = true
            artistBtn.isSelected = false
        }else {
            discovBtn.isSelected = false
            genreBtn.isSelected = false
            artistBtn.isSelected = true
        }
    }
    
    func menubtnClicked (_ sender: UIButton) {
        let index = sender.tag
        if index == 0 {
            summaryBtn.isSelected = true
            moviesBtn.isSelected = false
            moreBtn.isSelected = false
            summaryBtn.frame.origin.x = 0
//            summaryBar.backgroundColor = UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0)
//            movieBar.backgroundColor = UIColor.white
//            moreBar.backgroundColor = UIColor.white
            
            
        }else if index == 1 {
            summaryBtn.isSelected = false
            moviesBtn.isSelected = true
            moreBtn.isSelected = false
            summaryBtn.frame.origin.x = view.frame.width/3
//            summaryBar.backgroundColor = UIColor.white
//            movieBar.backgroundColor = UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0)
//            moreBar.backgroundColor = UIColor.white
        }else {
            summaryBtn.isSelected = false
            genreBtn.isSelected = false
            moreBtn.isSelected = true
            summaryBtn.frame.origin.x = 2*view.frame.width/3
//            summaryBar.backgroundColor = UIColor.white
//            movieBar.backgroundColor = UIColor.white
//            moreBar.backgroundColor = UIColor(red: 2.0/255.0, green: 148.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        }
    }
    
    func backBtnClicked (_ sender: UIButton) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

