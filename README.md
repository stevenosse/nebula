# Nebula

Find your dream job. Using GitHub Jobs open API and proudly crafted with Flutter.

  
## Description
Nebula is a flutter project boilerplate
The project structure is :

```
  lib/
    core/
      models/
      utils/
      my_app.dart
    providers/
    screens/
    services/
    widgets/
    main.dart
```

### Core
Contains the code for 
- your app declaration(for example, for an app named Vanilla would have a file **vanilla.dart** here that will contain the declaration of the MaterialApp/CurpertinoApp/WidgetsApp
- the **routes.dart** 
where you declare all the application routes
- **networker.dart** 
where the network service is instantiated
- **utils** 
where you store your helper classes and functions. Contains (by default): *NException* (Custom Exception class for API calls error handling, compatible only with Dio), *Constants* (Contains the application constants).

## Models
Contains the dart classes for the json responses of your API

## Providers
Contains a **base_provider.dart** extended by the other app providers. This class is abstract, thus should never be instantiated.
Your app providers will be stored in this folder.

## Screens
All the screens for your app.

## Services
The classes responsible of the API calls or direct interaction with the data sources

## Widgets
Where you store the custom widgets you'll create

## Getting Started

- Clone this repository
- run `flutter packages get` from the command line inside the project folder to install packages
- Run the app from your preferred IDE
