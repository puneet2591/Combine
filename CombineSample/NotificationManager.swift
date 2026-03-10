//
//  NotificationManager.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 24/02/26.
//

import UserNotifications
import UIKit
import Combine

final class NotificationManager: NSObject, ObservableObject {

    func requestPermission() {
        setupDelegate()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { granted, error in
            print("Granted permission: \(granted)")
        }
    }
    
    func registerForPush() {
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
}

extension NotificationManager : UNUserNotificationCenterDelegate {
    
    func setupDelegate() {
        UNUserNotificationCenter.current().delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Push notification is about to display")
        completionHandler([.banner, .badge, .sound])
    }
}
