//
//  ContentView.swift
//  LocalNotifications
//
//  Created by Ganesh on 02/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Request Permission") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("Schedule Notification Time") {
                NotificationManager.shared.scheduleNotification(trigger: .time)
            }
            
            Button("Schedule Notification Calendar") {
                NotificationManager.shared.scheduleNotification(trigger: .calender)
            }
            
            Button("Schedule Notification Location") {
                NotificationManager.shared.scheduleNotification(trigger: .location)
            }
            
            Button("CancelNotification") {
                NotificationManager.shared.cancelNotification()
            }
            
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber  = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
