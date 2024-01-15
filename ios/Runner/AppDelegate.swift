
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  let platformChannel = "environment_flutter_channel"
  let getFlavor = "flavor_method"

  override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      // check and get native data from flutter
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let flutterChannel = FlutterMethodChannel(name: self.platformChannel, binaryMessenger: controller.binaryMessenger)
      flutterChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case self.getFlavor:
              let flavor = Bundle.main.infoDictionary?["AppFlavor"]
              result(flavor)
          default:
              result(FlutterMethodNotImplemented)
              return
          }
      })

      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
    
