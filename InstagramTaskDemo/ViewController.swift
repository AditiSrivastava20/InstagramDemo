//
//  ViewController.swift
//  InstagramTaskDemo
//
//  Created by Sierra 4 on 13/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//



import UIKit
import CoreData
import Foundation
import AVKit
import AVFoundation
import AVKit
import Kingfisher

class ViewController: UIViewController  {
    
    
    
    
    
    @IBOutlet weak var tableoutlet: UITableView!
    
//    var number = ["Aditi","Palak","Shivani","Kritika","Sameer"]
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?
    
    var firstinfos = [
        
     
        
        firstinfo(name: "Shilvi",pic: URL(string : "http://www.mobileswall.com/wp-content/uploads/2015/12/300-Merry-Christmas-Minions-l.jpg"), comment: "awesome video" , displaypic : URL(string :""),playvideo: URL(string : "http://v1701.wapka-file.com//g02/video/30798246/2866065/ec806KWCPoQBuNOWYYrfT8ABm4YhoZUmWvcIRNHBeqWilEVcPA/cbb1a.mp4?md5=-ijQHOlxrdfLlXD9aIIP5Q&expires=1487679042"), typeofchoice : "video") ,
        
           firstinfo(name: "Riddhi",pic: URL(string :"http://www.hdwallpapers.in/walls/autumn_bench-HD.jpg"), comment: "BRAVO!" , displaypic : URL(string :"http://startuphelpost.com/wp-content/uploads/2016/09/10639606_1036143886425079_7674162283878973709_n-960x509.jpg"),playvideo:URL(string :"") , typeofchoice : "image"),
           
           firstinfo(name: "Anita",pic: URL(string :"http://longwallpapers.com/Desktop-Wallpaper/nature-wallpapers-phone-For-Desktop-Wallpaper.jpg"),comment : "COOL!" , displaypic : URL(string :""),playvideo: URL(string :"http://v1701.wapka-file.com//g02/video/30798246/2866065/ec806KWCPoQBuNOWYYrfT8ABm4YhoZUmWvcIRNHBeqWilEVcPA/cbb1a.mp4?md5=-ijQHOlxrdfLlXD9aIIP5Q&expires=1487679042"), typeofchoice : "video"),
        
        firstinfo(name: "Sudha",pic:  URL(string :"https://www.rpphotographybydesign.co.uk/wp-content/uploads/2014/01/nlw200915pc027.jpg"),comment: "nyc image !" ,displaypic : URL(string :"http://www.3d-wallpapers.info/wp-content/uploads/3d-nature-wallpapers-hd-download.jpg?189db0"),playvideo: URL(string :""), typeofchoice : "image"),
        
        firstinfo(name: "Pari",pic: URL(string :"http://webneel.com/wallpaper/sites/default/files/images/02-2013/valentine-day-wallpaper-1.jpg"),comment : "nyc image !" , displaypic : URL(string :"http://www.freedomwallpaper.com/nature-wallpaper/spring_nature-wide.jpg"),playvideo: URL(string :""), typeofchoice : "image"),
        
        firstinfo(name: "Manisha",pic:  URL(string :"https://static.pexels.com/photos/36487/above-adventure-aerial-air.jpg"),comment : "great pic !" , displaypic: URL(string :"http://garayterrace.com/wp-content/uploads/2016/03/5402157745_c2ba66fc2d_o.jpg"),playvideo: URL(string :""), typeofchoice : "image")
        
        ]
    
    var secondinfos = [
     secondinfo(name2: "Aditi",pic2: URL(string :"https://cdn.allwallpaper.in/wallpapers/1920x1200/2752/sun-coast-digital-art-landscapes-nature-1920x1200-wallpaper.jpg")),
    secondinfo(name2: "Palak",pic2: URL(string :"http://allpicts.in/wp-content/uploads/2015/07/Beautiful-Nature-Wallpaper-with-Two-Lotus-Flowers-in-Pink-500x347.jpg")),
    secondinfo(name2: "Priya",pic2: URL(string :"https://s-media-cache-ak0.pinimg.com/originals/0f/ca/25/0fca2539e9b3e31ea73f522883236138.jpg")),
    secondinfo(name2: "Shalvi",pic2: URL(string :"https://static.pexels.com/photos/55813/geranium-wave-water-rings-55813.jpeg")),
    secondinfo(name2: "Sapna",pic2: URL(string :"https://static.pexels.com/photos/87452/flowers-background-butterflies-beautiful-87452.jpeg")),
    secondinfo(name2: "Kajal",pic2: URL(string :"https://cdn.allwallpaper.in/wallpapers/1920x1200/2752/sun-coast-digital-art-landscapes-nature-1920x1200-wallpaper.jpg")),
        ]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension ViewController: UITableViewDelegate , UITableViewDataSource
{
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (firstinfos.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tablecell = tableView.dequeueReusableCell(withIdentifier : "tablecell" , for : indexPath ) as! dataintableview
        
        tablecell.userInfo = firstinfos[indexPath.row]
      
        
        tablecell.feedimage?.isHidden = true
        tablecell.videoview?.isHidden = true
        
        if(firstinfos[indexPath.row].typeofchoice?.isEqual ("image"))!
        {
            print ("Image Url - \(tablecell.userInfo?.displaypic)")
            tablecell.feedimage?.isHidden = false
            
            print("no")
            
            tablecell.feedimage?.kf.setImage(with: firstinfos[indexPath.row].displaypic)
          
        }
        else
        {
            tablecell.videoview?.isHidden = false
            print("yes")
            print ("Video Url - \(tablecell.userInfo?.playvideo)")
           
            let videoURL =  firstinfos[indexPath.row].playvideo
            let player = AVPlayer(url: videoURL! as URL)
            let playerLayer = AVPlayerLayer(player: player)
            print ("The size : \(tablecell.videoview.bounds)")
            
            
            playerLayer.frame = tablecell.videoview.bounds
            
            tablecell.videoview.layer.addSublayer(playerLayer)
          tablecell.usericon.layer.borderColor = UIColor(red:98/255.0, green:96/255.0, blue:97/255.0, alpha: 1.0).cgColor
                      player.play()
        }
        
        
        return tablecell
    }
    
    
    
    
    
}




extension ViewController: UICollectionViewDelegate ,UICollectionViewDataSource
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return(secondinfos.count)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dataincollectionview
        collectionCell.collectionviewlbl.text = secondinfos[indexPath.row].name2
        collectionCell.collectionviewimg?.kf.setImage(with: secondinfos[indexPath.row].pic2)
 
        return (collectionCell)
    }
    
  /*  func addData(_nameofuser:String, _sender:String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let obtainusername = NSEntityDescription.entity(forEntityName: "username",in: appDelegate.persistentContainer.viewContext)
        let Username = NSManagedObject(entity: obtainusername, insertInto: appDelegate.persistentContainer.viewContext)
     Username.setValue(_nameofuser, forKeyPath: "username")
     Username.setValue(_sender, forKeyPath: "username")
     if(sener == namePass)
     {
     let id = sender
     Username.setValue(id, forKeyPath: id)
     }
     
     
     
        do {
            
            try appDelegate.persistentContainer.viewContext.save()
        } 
     catch let error as NSError{
            
     
            print("Could not save. \(error). \(error.firstinfo)")
        }*/
        
        
        
    }
/* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
     {
     selectedItem = indexPath.section + 1
     print("New section : (selectedItem)")
     if( indexPath.section == indexPath.row)
     {
     
     self.tblView.endUpdates()
     self.tblView.reloadData()
     collectionView.reloadData()
     self.tblView.beginUpdates()
     }
     
     }
     */
    







/*import UIKit
import CoreData
import Foundation
import AVKit
import AVFoundation
import AVKit
import Kingfisher

class ViewController: UIViewController  {
    
    @IBOutlet weak var tableviewoutlet: UITableView!
    var number = ["Aditi","Medha","Kritika","Palak"]
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?
    var selectedItem:Int = 0
    
    var firstinfos = [
        firstinfo(name: "Neelam", identity: "101",pic : URL(string : "http://www.3d-wallpapers.info/wp-content/uploads/3d-nature-wallpapers-hd-download.jpg?189db0"), comment: "awesome video" , displaypic : URL(string :""),playvideo: URL(string : "https://dl.pagal.link/upload_file/367/382/6296/Special%20MP4%20Videos%202014/Dilwale%20Dulhania%20Le%20Jayenge%20-%20NEW%20TRAILER%202014%20-%20MP4.mp4"), type : "video") ,
         
         firstinfo(name: "Tapasya",identity: "102",pic:  URL(string :"http://www.freedomwallpaper.com/nature-wallpaper/spring_nature-wide.jpg"),comment: "nyc image !" , displaypic : URL(string :"http://www.naturewallpaper.eu/desktopwallpapers/flower/thumb/yellow-star-narcissus-thumb.jpg"),playvideo: URL(string :""), type : "image"),
         
         firstinfo(name: "Shilvi",identity: "102",pic: URL(string :"http://longwallpapers.com/Desktop-Wallpaper/nature-wallpapers-phone-For-Desktop-Wallpaper.jpg"),comment : "well clicked " , displaypic : URL(string :""),playvideo: URL(string :"https://dl.pagal.link/upload_file/367/382/6296/Special%20MP4%20Videos%202014/Dilwale%20Dulhania%20Le%20Jayenge%20-%20NEW%20TRAILER%202014%20-%20MP4.mp4"), type : "video"),
         
         
         firstinfo(name: "Sapna",identity: "105",pic: URL(string :"https://www.bigstockphoto.com/images/homepage/2016_bigstock_video.jpg"),comment : "nyc image !" , displaypic : URL(string :"https://www.rpphotographybydesign.co.uk/wp-content/uploads/2014/01/nlw200915pc027.jpg"),playvideo: URL(string :""), type : "image")
]
    var secondinfos = [
        secondinfo(name2: "Surbhi",identity2: "1001",pic2: URL(string :"https://cdn.allwallpaper.in/wallpapers/1920x1200/2752/sun-coast-digital-art-landscapes-nature-1920x1200-wallpaper.jpg")),
       secondinfo(name2: "Akansha",identity2: "1002",pic2: URL(string :"http://allpicts.in/wp-content/uploads/2015/07/Beautiful-Nature-Wallpaper-with-Two-Lotus-Flowers-in-Pink-500x347.jpg")),
        secondinfo(name2: "Fashion",identity2: "1003",pic2: URL(string :"https://s-media-cache-ak0.pinimg.com/originals/0f/ca/25/0fca2539e9b3e31ea73f522883236138.jpg")),
        secondinfo(name2: "beauty",identity2: "1004",pic2: URL(string :"https://static.pexels.com/photos/55813/geranium-wave-water-rings-55813.jpeg")),
     secondinfo(name2: "Love",identity2: "1005",pic2: URL(string :"https://www.rpphotographybydesign.co.uk/wp-content/uploads/2014/01/nlw200915pc027.jpg"))
    ]
    
  


    
    /*@IBAction func heart(_ sender: Any) {
        
        if let btnLikeTblView = sender as? UIButton {
            let initialButtonState =  btnLikeTblView.isSelected //save initial button state
    btnLikeTblView.isSelected = !btnLikeTblView.isSelected //to make interface feel more responsive, change the initial state of the button immediatly. If something goes worng, change it back later (I think thats how Instagram does it)
            
            if let tablecell =  btnLikeTblView.superview?.superview as? DataInTableViewCell { //superview twice to get the cell beacuse first superview is a content view
                let indexPath = self.tableView.indexPath(for: tablecell) //get index path of the cell
                let currentUser = //FIRAuth.auth()?.currentUser
                currentUser?.getTokenForcingRefresh(true) {idToken, error in
                    if let error = error {
                        button.isSelected = initialButtonState //operation failed, return to the initial button state and handle the error
                        //TODO: output an error message
                        return
                    }
                    let post = self.feed.posts[(indexPath?.row)!]
                    post.like(idToken: idToken!, completed: { result in
                        if result == "Successful" {
                            button.isSelected = post.liked
                        }
                        else {
                            button.isSelected = initialButtonState //operation failed, return to the initial buttons state
                        }
            
                    }
                }
            }*/

   override func viewDidLoad() {
        super.viewDidLoad()
    
   }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension ViewController: UITableViewDelegate , UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (firstinfos.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tablecell = tableView.dequeueReusableCell(withIdentifier : "tablecell" , for : indexPath ) as! dataintableview


        tablecell.feedimage?.kf.setImage(with: firstinfos[indexPath.row].displaypic)
        tablecell.usericon?.kf.setImage(with: firstinfos[indexPath.row].pic)
        tablecell.lblusername.text = (with: firstinfos[indexPath.row].name)
        tablecell.lblcomment.text = (with: firstinfos[indexPath.row].comment)
        tablecell.lbllabel.text = number[indexPath.row]
        
        tablecell.userDataInfo = firstinfos[indexPath.row]
        //  cell.lblforComment.text = UserDatas[indexPath.row].comment
        
        tablecell.feedimage?.isHidden = true
        tablecell.videoview?.isHidden = true
        
        // self.view.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.5)
        //self.view.viewWithTag(1)?.hidden = true
        //print ("Array is :  - \(UserDatas[indexPath.row].type)")
        
        if(firstinfos[indexPath.row].type?.isEqual ("image"))!
        {
            print ("Image Url - \(tablecell.userDataInfo?.displaypic)")
           
            tablecell.feedimage?.isHidden = false
                       print("no")
            //  cell.imgCollectionView?.kf.setImage(with: SubUsers[indexPath.row].SubUserPicture)
            tablecell.feedimage?.kf.setImage(with: firstinfos[indexPath.row].displaypic)
            
        }
        else
        {
            tablecell.videoview?.isHidden = false
            print("yes")
            print ("Video Url - \(tablecell.userDataInfo?.playvideo)")
          
            let videoURL =  firstinfos[indexPath.row].playvideo
            let player = AVPlayer(url: videoURL! as URL)
            let playerLayer = AVPlayerLayer(player: player)
            print ("The size : \(tablecell.videoview.bounds)")
            
            playerLayer.frame = tablecell.videoview.bounds
            
            tablecell.videoview.layer.addSublayer(playerLayer)
            tablecell.usericon.layer.borderColor = UIColor(red:98/255.0, green:96/255.0, blue:97/255.0, alpha: 1.0).cgColor
            //playerLayer.frame = cell.viewforVideoStream.bounds
            //self.view.layer.addSublayer(playerLayer)
            player.play()
        }
        
        return(tablecell)
        
        
    }
    
    
}

extension ViewController: UICollectionViewDelegate ,UICollectionViewDataSource
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return(number.count)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! dataincollectionview
        
        collectionCell.collectionviewimg?.kf.setImage(with: secondinfos[indexPath.row].pic2)
        collectionCell.collectionviewlbl.text = number[indexPath.row]
        
        return (collectionCell)
    }
    
    
}*/

//        collectionCell.collectionviewimg.layer.borderColor = UIColor(red:255/255.0, green:225/255.0, blue:255/255.0, alpha: 1.0).cgColor
