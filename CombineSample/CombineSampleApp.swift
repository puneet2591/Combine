//
//  CombineSampleApp.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 18/02/26.
//

import SwiftUI

@main
struct CombineSampleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    @StateObject var notificationManager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    notificationManager.requestPermission()
                    notificationManager.registerForPush()
                    //scheduleLocalNotification()
                }
        }
    }
    
    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Combine"
        content.body = "This is local notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
