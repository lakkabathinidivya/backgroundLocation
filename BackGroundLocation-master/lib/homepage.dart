// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart' as geo;
// import 'package:location/location.dart';
// import 'package:workmanager/workmanager.dart';
// import 'notify.dart' as notif;

// const fetchBackground = "fetchBackground";

// geo.Position? location;
// LocationData? _currentPosition;

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     switch (task) {
//       case fetchBackground:
//         geo.Position userLocation = await geo.Geolocator.getCurrentPosition(
//             desiredAccuracy: geo.LocationAccuracy.high);
//         location = userLocation;
//         notif.Notification notification = notif.Notification();
//         notification.showNotificationWithoutSound(userLocation);
//         print('jhgjhghjghj  --------- $userLocation');

//         break;
//     }
//     return Future.value(true);
//   });
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     getLoc();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('hellloo'),
//       ),
//       body: Center(
//         child: _currentPosition == null
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Lat _________${_currentPosition!.latitude}",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   Text(
//                     "Lng _________${_currentPosition!.longitude}",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   getLoc() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     Location locations = Location();
//     _serviceEnabled = await locations.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await locations.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await locations.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await locations.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         Workmanager().initialize(
//           callbackDispatcher,
//           isInDebugMode: true,
//         );

//         Workmanager().registerPeriodicTask(
//           "1",
//           fetchBackground,
//           frequency: Duration(minutes: 15),
//         );
//         return;
//       }
//     }
//     _currentPosition = await locations.getLocation();
//     setState(() {});
//     print('ghfjhg ______________$_currentPosition');
//   }
// }
