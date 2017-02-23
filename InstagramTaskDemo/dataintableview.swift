//
//  dataintableview.swift
//  InstagramTaskDemo
//
//  Created by Sierra 4 on 17/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class dataintableview: UITableViewCell {
var Count = 1
  
   
    @IBOutlet weak var pop: UIButton!
    @IBOutlet weak var feedimage: UIImageView!
   
    @IBOutlet weak var videoview: UIView!
    @IBOutlet weak var lbllabel: UILabel!
    @IBOutlet weak var lblcomment: UILabel!
    @IBOutlet weak var likeno: UILabel!
    @IBOutlet weak var btnshare: UIButton!
    @IBOutlet weak var btncomment: UIButton!
    @IBOutlet weak var likebtn: UIButton!
    @IBOutlet weak var usericon: UIImageView!
    @IBOutlet weak var lblusername: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    var userInfo :firstinfo?
        {
        didSet
        {
            updateUI()
            
        }
        
    }
    
    fileprivate func updateUI()
    {
        lblusername.text = userInfo?.name
        lblcomment.text = userInfo?.comment
        lbllabel.text = userInfo?.name
        usericon.kf.setImage(with: userInfo?.pic)
      
        
        
    }
    
    
   
    @IBAction func heart(_ sender: Any) {
        if(Count%2 != 0)
        {
            UIView.animate(withDuration: 0.4, animations:  {
                self.likebtn.transform = CGAffineTransform(scaleX : 0.2, y: 0.2)},
                           completion: { _ in
                            UIView.animate(withDuration: 0.4)
                            {
                                self.likebtn.transform = CGAffineTransform.identity
                                self.likebtn.alpha = 1
                                self.likebtn.backgroundColor = UIColor.clear
                            }
            })
            let image = UIImage(named: "like.png") as UIImage?
            likebtn.setImage(image, for: UIControlState.normal)
            Count = Count + 1
            self.likeno.text = String(Count)
            
            
        }
        else{
            UIView.animate(withDuration: 0.4, animations:  {
                self.likebtn.transform = CGAffineTransform(scaleX : 0.2, y: 0.2)},
                           completion: { _ in
                            UIView.animate(withDuration: 0.4)
                            {
                                self.likebtn.transform = CGAffineTransform.identity
                            }
            })
            let image = UIImage(named: "like-2.png") as UIImage?
            likebtn.setImage(image, for: UIControlState.normal)
            Count = Count - 1
            self.likeno.text = String(Count)
            self.likebtn.alpha = 1
            self.likebtn.backgroundColor = UIColor.clear
            
        }
        
           }
    
    @IBAction func popup(_ sender: Any) {
        var tapGesture = UITapGestureRecognizer(target: self , action: #selector(self.tapBlurButton2(_:)))
        pop.addGestureRecognizer(tapGesture)
        
        
    }
    func tapBlurButton2(_ sender: UIButton)
    {
     
        UIView.animate(withDuration: 0.4, animations:  {
            self.pop.transform = CGAffineTransform(scaleX : 0.4, y: 0.4)
            self.pop.transform = CGAffineTransform.identity
            let image = UIImage(named: "button.png") as UIImage?
            self.pop.setImage(image, for: UIControlState.normal)
            self.pop.transform = CGAffineTransform.identity
            
            
            
            
        },
                       
                       completion: { _ in
                        UIView.animate(withDuration: 0.4)
                        {                            self.pop.transform = CGAffineTransform.identity
                            let image = UIImage(named: "") as UIImage?
                            self.pop.setImage(image, for: UIControlState.normal)
                            self.Count = self.Count + 1
                            self.likeno.text = String(self.Count)
                            
                            
                        }
        })
        let image = UIImage(named: "heart-1.png") as UIImage?
        likebtn.setImage(image, for: UIControlState.normal)
        Count = Count + 1
        self.likeno.text = String(Count)
        
    }
    



     override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
