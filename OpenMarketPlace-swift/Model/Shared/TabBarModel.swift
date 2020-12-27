//
//  TabBarModel.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 12/26/20.
//

import SwiftUI
class TabBarModel: ObservableObject {
        
        var tabBarController: UITabBarController?

        func showTabbarView() {
            self.tabBarController?.tabBar.isHidden = false
        }
        
        func hideTabbarView() {
            self.tabBarController?.tabBar.isHidden = true
        }
        
        func disableTabbarTouch() {
            self.tabBarController?.tabBar.isUserInteractionEnabled = false
        }
        
        func enableTabbarTouch() {
            self.tabBarController?.tabBar.isUserInteractionEnabled = true
        }
    }
