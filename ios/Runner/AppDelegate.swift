import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //This API key should be replaced with SOSSI's own key after handoff
    GMSServices.provideAPIKey("AIzaSyCN2GI_xvmDaLFAi1KyYrn9AeVIyeUTw7s"),
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
