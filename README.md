
# Capture Error

Capture Error is a flutter plugin specifically designed for capturing unhandled exceptions on native android. 

To test this plugin, there are 2 ways,

1 . Use the built-in example app.  
2 . Integrate the plugin in your app.

Detailed desctiption of how to use is given below.

### 1. Use the built-in example app

#### Steps:
1 . Clone the library in your local machine.  
2 . Run the project.  
3 . Click on the floating action button.

#### Results
Entire explaination of the application as well as the exception is given within the app itself. To summarize, clicking on the floating action button triggers a native function (android only) i.e "checkVowel". Since on the native side, it acceps a string, and we are explicitly passing an integer, it is a unhandled type mismatch exception. You'll be notified that the error occured by a Toast Message with an error snipet in it. 

### 2. Integrate the plugin in your app
#### Steps:
1 . Copy the git link below.  
https://github.com/aditya-nahak/catcherror.git  

2 . Go to your project's pubspec.yaml file.  

3 . Add captureerror as a depedency as shown below
```
catcherror:   
    git:
      url: https://github.com/aditya-nahak/catcherror.git
```

4 . Go to the entry point of your application (main function inside main.dart) and use the library as shown below.
```
Catcherror.init(
    () => runApp(const MyApp()),
    postRequestUrl: "https://somerandomurl.com/api/postApi",
    onErrorCallBack: (error, stackTrack) {},
    onHttpRequestFailedCallback: (error, stacktrace){}
    headers: {}
  );
```

5 . Make sure you have imported the plugin before using it. 
```
import 'package:catcherror/catcherror.dart';
```

6 .  The first callback for initFunction is **compulsory** and it should be the **top level function** where the code execution starts.

7 .  **Optional parameters**.  
     ***postRequestUrl***: This acceps a url which can be used to post the error and stacktrace once it is captured.  
     ***onErrorCallBack***: This callback is triggered after the error is captured. It can be used to show dialogs and toast messages to notify the user.
     ***onHttpRequestFailedCallback***: If you pass an empty string to the postRequestUrl or some not supported string, it again is captured as a unhandled native exception. This callback can be used in that scenario.
     ***headers***: You can pass headers for your post request api here.   

8 .  ***And that's it!*** Your application is ready to capture every unhandled native android exception.
