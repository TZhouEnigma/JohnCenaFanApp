//
//  VideoVC.swift
//  PartyRock
//
//  Created by chuxiang zhou on 5/24/17.
//  Copyright © 2017 chuxiang zhou. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var videoTitle: UILabel!
    private var _partyRock: PartyRock!
    
    var partyRock: PartyRock{
   
        get{
            return _partyRock
        }
        set{
        _partyRock = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         videoTitle.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
