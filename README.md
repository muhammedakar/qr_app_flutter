# QR Code Scan and Create App

Hello, I am Muhammed AKAR i have been dealing with **flutter** for a year this is one of my projects. This app is a fast and user-friendly QR code scanner and generator application. This app can read and create QR codes containing text, links, contact information, geographical locations, and more. I am waiting for your comments. 🫡

### QR Code Scanner:
You can scan QR codes using your device's camera. No internet connection is required.

### QR Code Generator:
Create your own QR codes. They can contain various data types such as text, URLs, email addresses, phone numbers, or geographical locations.
### Connect with me:


<a href="https://www.linkedin.com/in/muhammed-akar-9a0036155/"><img src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" align="left" height="24" width="24" ></a>

<a href="https://stackoverflow.com/users/15971548/muhammed-akar"><img src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/stack-overflow.svg" align="left" height="24" width="24" ></a>  
<br/><br/>
***
![Wealth Funds With TEFAS Data-2](https://github.com/muhammedakar/qr_app_flutter/assets/99355169/b901a46e-e669-47b3-a155-7e809bb502b0)

## Configure:
### for İOS
You should write this code line into the **iOS/Runner/info.plist file**
```
<key>io.flutter.embedded_views_preview</key>
<true/>
<key>NSCameraUsageDescription</key>
<string>This app needs camera access to scan QR codes</string>
```


### for Android


You should write this code line into the **Android/App/src/main/AndroidManifest.xml file**<br/><br/>
    ``<uses-permission android:name="android.permission.CAMERA" />``

## Build

you need to write the following code block in your terminal

    ``flutter build apk``

Finally you can find this app on this path
