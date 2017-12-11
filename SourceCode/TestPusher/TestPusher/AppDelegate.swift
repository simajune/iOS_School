
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        requestNotification()
        return true
    }
    
    private func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (grant, error) in
            print("Grant :",grant, "Error: ",error)
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
            UNUserNotificationCenter.current().delegate = self
            
            let action = UNNotificationAction(identifier: "action",
                                              title: "확인",
                                              options: .destructive)
            
            let action2 = UNTextInputNotificationAction(identifier: "action",
                                                        title: "텍스트 전송",
                                                        options: .foreground)
            
            let category = UNNotificationCategory(identifier: "category1",
                                                  actions: [action, action2],
                                                  intentIdentifiers: [ ],
                                                  options: .customDismissAction)
            UNUserNotificationCenter.current().setNotificationCategories([category])
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
        
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        print("Device TokenString is ", token)
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
