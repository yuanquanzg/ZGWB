//
//  WBMainTabBarController.swift
//  ZGWB
//
//  Created by ZZG on 2016/11/12.
//  Copyright © 2016年 ZZG. All rights reserved.
//

import UIKit

class WBMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = [
                            ["clsName":"WBDiscoveryViewController",  "title":"发现", "imageName":"discover"],
                            ["clsName":"WBHomeViewController",  "title":"首页", "imageName":"home"],
                            ["clsName":"WBMessageViewController",  "title":"消息", "imageName":"message_center"],
                            ["clsName":"WBProfileViewController",  "title":"我", "imageName":"profile"],
                        ]
        
    
        var ac = [UIViewController]()
        
        for dict in array {
            
            ac.append(controller(dict: dict))
        }
        
        viewControllers = ac
        
    }
    
    private func controller(dict: [String: String]) ->UIViewController {
        
        let space = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String
        
        
        guard let clsName = dict["clsName"],
                        let title = dict["title"],
                        let imageName = dict["imageName"],
                        let cls = NSClassFromString(space! + "." + clsName) as? UIViewController.Type
            
                        else {
                            return UIViewController();
        }
        
        let vc = cls.init()
        
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named:"tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let nv = WBNavigationController(rootViewController:vc)
        
        return nv
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
