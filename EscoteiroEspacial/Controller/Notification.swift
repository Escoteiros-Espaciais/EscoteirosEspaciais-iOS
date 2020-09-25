//
//  Notification.swift
//  EscoteiroEspacial
//
//  Created by Kellyane Nogueira on 15/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit
import UserNotifications

enum Message: String, CaseIterable {
    case text1 = "Message1"
    case text2 = "Message2"
    case text3 = "Message3"
    case text4 = "Message4"
    case text5 = "Message5"
}

class Notification: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //schenduleNotification()
    }
    
    func schenduleNotification() {
            
        let center = UNUserNotificationCenter.current()
              
        let content = UNMutableNotificationContent()
        content.title = "Notification's title"
        content.body = Message.allCases.randomElement()!.rawValue
        content.sound = .default
              
        let date = Date().addingTimeInterval(10) //Sugestão de intervalo: 43200 segundos => 12 horas
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //Add image
        guard let path = Bundle.main.path(forResource: "foguete", ofType: "jpg") else {return}
        let imageUrl = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(identifier: "logo", url: imageUrl, options: nil)
            content.attachments = [attachment]
        } catch {
            print("The attachment could not be loaded")
        }
        
        // -------- Create the request ------------
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
              
        // -------- Register the request -----------
        center.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
