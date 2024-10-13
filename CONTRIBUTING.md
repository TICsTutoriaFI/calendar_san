# Contributing to the Project

Thank you for your interest in contributing to this library! 

This document outlines how you can run the example application and test the package locally without needing to publish it to **pub.dev** first.

In conclusion you pull this repository from the GitHub and test the library localy.

## How to Test the Package Locally

### Step 1: Clone the Repository

First, clone this repository to your local machine by running the following command in your terminal:

```bash
git clone https://github.com/treeyeies/calendar_san.git
```

### Step 2: cd to the examples directory
After cloning the repository, navigate to the example project folder within the repository:
```bash
cd your_repository/examples
```



### Step 3: example/pubspec.yaml verify dependences (optional):
Verify the dependences is in the form

```bash
...
...
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  calendar_san:
    path: ../
...
...
```


## Step 4: Getting the dependencies
Before any work can be started all the dependencies must be downloaded, for this run:

```sh
flutter pub get
```

## Step 5: Run app
Run the app in browser:
Ctrl + Shift + P / Select Device / Your Browser

Clic to run button


or

```bash
flutter run -d chrome
```

### Step n: Solution to caché flutter problems during the run app
Clean the packege: execute command to clean old references than could are in cache of old flutter projects:

```bash
flutter clean
```
Delete pub cache: The problem could be caused by dependences in caché.

```bash
Copy code
flutter pub cache repair
```

### Finally: You would be able to run the web app

### IMPORTANT
### Consider: syncfusion_flutter_calendar is only for show something, is TEMPORALLY
the syncfusion_flutter_calendar package to the pubspec.yaml file as a example dependency 
for wacth the initial library calendar_san will works with the others developers projects 
(This implementation in calendar_layout.dart in lines 10 to 14 will be DELEATED)
