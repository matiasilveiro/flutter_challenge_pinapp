import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let commentsChannel = FlutterMethodChannel(name: "challenge.pinapp/comments",
                                                   binaryMessenger: controller.binaryMessenger)
        commentsChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "getCommentsForPost" else {
                result(FlutterMethodNotImplemented)
                return
            }
            guard let postId = call.arguments as? Int else {
                result(FlutterMethodNotImplemented)
                return
            }
            self.getCommentsForPost(postId: postId, result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getCommentsForPost(postId: Int, result: @escaping FlutterResult) {
        Task {
            guard let comments = await CommentsService.getCommentsForPost(postId: postId) else {
                result(FlutterError(code: "ERROR",
                                    message: "An error occurred while fetching the comments.",
                                    details: nil))
                return
            }
            result(comments)
        }
    }
}
