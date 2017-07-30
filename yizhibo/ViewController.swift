//
//  ViewController.swift
//  yizhibo
//
//  Created by 张艺哲 on 2017/7/25.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var live: YKCell!
    
    var playerView : UIView!
    var ijkPlayer : IJKMediaPlayback!
    

    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnGift: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var leadingImg: UIActivityIndicatorView!
    

    @IBAction func tapBack(_ sender: UIButton) {
        
        ijkPlayer.shutdown()
        
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    @IBAction func tapGift(_ sender: UIButton) {
        let duration = 3.0
        let car  = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let widthCar:CGFloat = 250
        let HeightCar:CGFloat = 125
        
        UIView.animate(withDuration: duration) { 
            car.frame = CGRect(x: self.view.center.x-widthCar/2, y: self.view.center.y - HeightCar/2, width: widthCar, height: HeightCar)
        }
        
     DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
        UIView.animate(withDuration: duration, animations: { 
            car.alpha = 0
        }, completion: { (completed) in
            car.removeFromSuperview()
        })
        }
        
//        
//        let layerfw = CAEmitterLayer()
//        view.layer.addSublayer(layerfw)
//        emmitParticles(from: sender.center, emitter: layerfw, in: view)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+4) { 
//            layerfw.removeFromSuperlayer()
//        }
        
        
    }
    
    @IBAction func btnLike(_ sender: UIButton) {
        
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        heart.center = CGPoint(x: btnLike.frame.origin.x, y: btnLike.frame.origin.y)
        
        view.addSubview(heart)
        
        heart.animate(in: view)
        
        //爱心按钮 大小关键帧动画
        
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        
        btnAnime.values =   [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
        
        btnAnime.keyTimes = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        
        btnAnime.duration = 0.2
        
        sender.layer.add(btnAnime, forKey: "SHOW")
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setBg()
        
        leadingImg.startAnimating()
        
        setPlayView()
        
        
        bringBtnToFront()
    }
    
    func setPlayView(){
        self.playerView = UIView(frame: view.bounds)
        view.addSubview(self.playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        
        let pv = ijkPlayer.view!
        
        pv.frame = playerView.bounds
        
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        playerView.insertSubview(pv, at: 1)
        
        ijkPlayer.scalingMode = .aspectFill
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !self.ijkPlayer.isPlaying(){
            ijkPlayer.prepareToPlay()
            leadingImg.stopAnimating()
            leadingImg.hidesWhenStopped = true

        }
        
    }
    
    
    func setBg(){
        let imgUrl = URL(string: live.portrait)
        bgImage.kf.setImage(with: imgUrl)
        
        let blurEffect = UIBlurEffect(style: .light)
        
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = bgImage.bounds
        
        bgImage.addSubview(effectView)
    }
    
    func bringBtnToFront(){
        view.bringSubview(toFront: btnLike)
        view.bringSubview(toFront: btnBack)
        view.bringSubview(toFront: btnGift)
        view.bringSubview(toFront: leadingImg)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

