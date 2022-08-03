# Capture Error

Capture Error is a flutter plugin specifically designed for capturing unhandled exceptions on native android. 

To test this plugin, there are 2 ways:

1. Use the built-in example app.  
2. Integrate the plugin into your app.

A detailed description of how to use is given below.

### 1. Use the built-in example app

#### Steps:
1. Clone the library in your local machine.  
2. Run the project.  
3. Click on the floating action button.

#### Results:
An entire explanation of the application as well as the exception is given within the app itself. To summarize, clicking on the floating action button triggers a native function (android only) i.e "checkVowel". Since on the native side, it accepts a string, and we are explicitly passing an integer, it is an unhandled type mismatch exception. You'll be notified that the error occurred by a Toast Message with an error snippet in it. 

### 2. Integrate the plugin into your app
#### Steps:
1. Copy the git link below.
    ```bash
    https://github.com/aditya-nahak/catcherror.git
    ```

2. Go to your project's pubspec.yaml file.  

3. Add captureerror as a dependency as shown below
    ```yaml
      catcherror:   
          git:
            url: https://github.com/aditya-nahak/catcherror.git
    ```

4. Go to the entry point of your application (main function inside main.dart) and use the library as shown below.

    ```dart
    Catcherror.init(
        () => runApp(const MyApp()),
        postRequestUrl: "https://somerandomurl.com/api/postApi",
        onErrorCallBack: (error, stackTrack) {},
        onHttpRequestFailedCallback: (error, stacktrace){}
        headers: {}
      );
    ```


5. Make sure you have imported the plugin before using it. 
    ```dart
    import 'package:catcherror/catcherror.dart';
    ```


6.  The first callback for initFunction is *compulsory* and it should be the *top-level function* where the code execution starts.

7.  *Optional parameters*.  
     
    - ***postRequestUrl***: This accepts a URL that can be used to post the error and stacktrace once it is captured.  
     
    - ***onErrorCallBack***: This callback is triggered after the error is captured. It can be used to show dialogs and toast messages to notify the user.
    
    - ***onHttpRequestFailedCallback***: If you pass an empty string to the postRequestUrl or some not supported string, it again is captured as an unhandled native exception. This callback can be used in that scenario.  
     
    - ***headers***: You can pass headers for your post request API here.   

8.  **And that's it!** Your application is ready to capture every unhandled native android exception.

## Screenshots:

![WhatsApp Image 2022-08-04 at 2 24 12 AM](https://user-images.githubusercontent.com/70506653/182710211-c052a89f-afee-4cb0-94e1-bdc97d84b0cd.jpeg)
![WhatsApp Image 2022-08-04 at 2 24 12 AM (1)](https://user-images.githubusercontent.com/70506653/182710227-f8edadec-9041-4302-8713-cfdbf1111ced.jpeg)
![WhatsApp Image 2022-08-04 at 2 24 12 AM (2)](https://user-images.githubusercontent.com/70506653/182710258-3cafe05f-5060-4f03-824e-5140f40a9c1f.jpeg)
