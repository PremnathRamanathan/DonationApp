# poundwishes
iOS mobile application development project


Developing an application for the iOS platform to facilitate ease of access for donations.
The main task was to develop an iOS application which presents the same behavior and functionality as the Company's website. 
Notably, the important aspects for implementation were:

1) User Login/Registration 
2) Weekly Wishes/Other Wishes
3) Campaign status(Almost funded/ Recently started)
4) MyWallet functionality
5) About Company( Information and FAQ’s)

In this project, we are integrating AWS S3 and Cognito services to the mobile application for user authentication and simple media storage and retrieval. The mobile application will interact with AWS features directly using AWS SDK (Software Development Kit).

Development Environment :

The development environment used for this project was Xcode Dev environment. The framework used was cocoa and cocoa touch frameworks. The project follows MVC architecture with Model being the Data source, View being the Storyboards and Controller being the swift ViewController files. For more information on installation of Xcode, refer the link given here.
This project was majorly tested using Iphone6 or IPhone 6s simulators. The constraints to the screens were laid out based on these simulators. The UI might look different or not aligned properly if different iPhone simulators are used.

Code Explanation: 

PoundWishes Project follows MVC framework and best coding practices. The remote connection to AWS is being established via Protocols and passing through various layers. The PoundWishes project for creating a mobile application was started from scratch and all the necessary libraries or frameworks required for this project were downloaded using cocoapods. Visit Cocoa pods website to learn more about how to use cocoapods to download and install external libraries or frameworks.

List of main folders and subdirectories, files in the project that requires attention are given below:
PoundWishes - Contains main project code
RemoteServiceDef -  Remote Connections to AWS
RemoteService.swift – Contains protocols to access AWS features.
UserData.swift – Contains user data compliant with protocols
Model – Contains all the Data sources – Data collected from database
AWSServices  - All the files pertaining to AWS connections. Cognito, DynamoDB, S3.
ViewController – Contains all the controller files. Controls the actions and outlets of views in the project.
RevealViewController – Main Controller class which provides front &     back views for slide-out menu functionality. Use SWRevealViewControllersPush and SWRevealViewControllersPull for custom segues. 
Assets.xcassets  - Container to all media files.
Main.Storyboard – Main storyboard of the mobile application. Contains UI screens and interconnections.
Info.plist – Information file containing app related configurations. Configure App security, permissions, access to external elements here.
PoundWishes-Bridging-Header.h  - Bridging header file is used to include Objective-C file in Swift.
PoundWishes Tests - Contains Test scenarios and test conditions/cases.
Products - Contains the deployable mobile app.
Pods - Contains all pods references relevant to this project. 
Frameworks -  Contains all frameworks relevant to this project

Note: Each file in the project has detailed explanation about what each file performs and how it interacts within the app. The inline comments in the code provides clarity on what each line in the file does. 

Database :
AWS :
The important class files containing the code for accessing Cognito , updating and retrieving data from AWS DynamoDB  are as follows:
AWSConfig.swift – Configures and establishes connection to AWS.Adopts RemoteService protocol for secure processing
AWSConstants – Configure AWS credentials here to establish connection to AWS.
AWSUser – Contains code to access AWS user information from DynamoDB. 
FaceBook Share and Login features are accessible through this mobile application. The Facebook SDKs have been configured and relevant frameworks have also installed. Use your developer tools configurations to access FaceBook features in this project. The code pertaining to Facebook share and Login are commented as these are additional features added to the mobile app and can be used if required. 

MYSQL :

MySQL connection is being established through a web service call using phpMyAdmin which is a free and open source written in PHP intended to handle the administration of MySQL with the use of a web browser.

The php files containing the SQL Queries have been uploaded on Poundwishes ios/ftp domain. These files act as APIs through which the mobile app connects to the MySQL server.  The APIs request and respond using POST method and return the output in JSON format.

All the Data Sources are placed under Model folder in PoundWishes Project.  
ParseJSONData.swift file contains code to download data from database and parse it in JSON format. View Controller access the itemsDownloaded() method in ParseJSON protocol to retrieve and process the downloaded data.

DBFetchDataSource.swift class acts as the data source for basic user information. Try to duplicate this class accordingly to create various other data sources to fetch data for other screens.


