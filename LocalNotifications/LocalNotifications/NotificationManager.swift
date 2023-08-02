//
//  NotificationManager.swift
//  LocalNotifications
//
//  Created by Ganesh on 02/08/23.
//

import Foundation
import UserNotifications
import CoreLocation

class NotificationManager{
    
    static let shared = NotificationManager()
    
    func requestAuthorization(){
        let options:UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { sucess, error in
            if let error = error{
                print("Error: - \(error.localizedDescription)")
            }else{
                print("Sucess")
            }
        }
    }
    
    func scheduleNotification(trigger:TriggerType){
        let content = UNMutableNotificationContent()
        content.title = "Local Notification!"
        content.body = "This is my first ever location Notification implemetation in SwiftUI"
        content.sound = .default
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger.trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification(){
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}


enum TriggerType:String{
    case time = "time"
    case calender = "calender"
    case location = "location"
    
    var trigger:UNNotificationTrigger{
        switch self {
        case .time:
            return UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        case .calender:
            let dateComponent = DateComponents(hour: 23,minute: 55,weekday: 4)
            return UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        case .location:
            let coordinate = CLLocationCoordinate2D(latitude: 40.0, longitude: 50.0)
            let region = CLCircularRegion(center: coordinate, radius: 100, identifier: UUID().uuidString)
            return UNLocationNotificationTrigger(region: region, repeats: true)
        }
    }
}
