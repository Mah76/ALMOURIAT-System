// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:final_project/Const.dart';
// import 'package:final_project/appfiles/Home/map/polygon_util.dart';
// import 'package:final_project/appfiles/Home/map/rider_info.dart';
// import 'package:final_project/appfiles/Home/report/livedata.dart';
// import 'package:final_project/appfiles/Home/Homescreen/resultdata.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:maps_toolkit/maps_toolkit.dart' as map;

// class Maptracking extends StatefulWidget {
//   const Maptracking({Key? key}) : super(key: key);

//   @override
//   State<Maptracking> createState() => MaptrackingState();
// }

// class MaptrackingState extends State<Maptracking> {
//   late DatabaseReference _dbrefe;
//   var dlat;
//   var dlan;

//   final Completer<GoogleMapController> _controller = Completer();
//   BitmapDescriptor currentlocation = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor checkPointOne = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor checkPointTow = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor checkPointThree = BitmapDescriptor.defaultMarker;

//   bool isIntheTrackRaceArea = true;
//   // LatLng intialLocation = const LatLng(25.99096393024973, 50.4806988304455);
//   LatLng intialLocation = const LatLng(25.989435, 50.479603);
//   // LatLng intialLocation = const LatLng(25.946591, 50.493874);

//   String address = "";
//   List<LatLng> polygonPoins = const [
//     LatLng(25.988307, 50.479793),
//     LatLng(25.946591, 50.493874),
//     LatLng(25.945163, 50.499062),
//     LatLng(25.945553, 50.499485),
//     LatLng(25.946851, 50.499378),
//     LatLng(25.977940, 50.492308),
//     LatLng(25.984851, 50.490155),
//     LatLng(25.988659, 50.488688),
//     LatLng(25.987775, 50.484835),
//     LatLng(25.988487, 50.480994),
//     LatLng(25.988326, 50.479793),
//   ];
//   @override
//   void initState() {
//     addCustomMarker();
//     getAddressFromLatLon(intialLocation);
//     isIntheTrackRaceArea =
//         PolygonUtil.containsLocation(intialLocation, polygonPoins, false);
//     _dbrefe = FirebaseDatabase.instance.reference();

//     super.initState();
//   }

//   Text buildText(String s) {
//     return Text(
//       s,
//       style: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   void latChange() {
//     _dbrefe.child('horse1').child('lat').onValue.listen((event) {
//       Object? lat = event.snapshot.value;
//       print('lat is: $lat');
//       setState(() {
//         dlan = lat;
//       });
//     });
//   }

//   void lanChange() {
//     _dbrefe.child('horse1').child('lan').onValue.listen((event) {
//       Object? lan = event.snapshot.value;
//       print('lan is: $lan');
//       setState(() {
//         dlat = lan;
//       });
//     });
//   }

//   void addCustomMarker() async {
//     BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(),
//       "img/icons/horsemap.png",
//     ).then(
//       (markerIcon) {
//         setState(() {
//           currentlocation = markerIcon;
//         });
//       },
//     );
//     BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(),
//       "img/icons/checkpoint.png",
//     ).then(
//       (markerIcon) {
//         setState(() {
//           checkPointOne = markerIcon;
//         });
//       },
//     );
//     BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(),
//       "img/icons/checkpoint.png",
//     ).then(
//       (markerIcon) {
//         setState(() {
//           checkPointTow = markerIcon;
//         });
//       },
//     );
//     BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(),
//       "img/icons/checkpoint.png",
//     ).then(
//       (markerIcon) {
//         setState(() {
//           checkPointThree = markerIcon;
//         });
//       },
//     );
//   }

//   void getAddressFromLatLon(LatLng latLng) {
//     placemarkFromCoordinates(
//       latLng.latitude,
//       latLng.longitude,
//       localeIdentifier: "en_BD",
//     ).then(
//       (placemarks) {
//         String firstAddress =
//             "${placemarks[0].name}, ${placemarks[0].administrativeArea}";
//         if (firstAddress != address) {
//           setState(() {
//             isIntheTrackRaceArea =
//                 PolygonUtil.containsLocation(latLng, polygonPoins, false);
//             address = firstAddress;
//           });
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: iconColor,
//         elevation: 0,
//         title: const Text(
//           "Track Race",
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               mapToolbarEnabled: true,
//               zoomControlsEnabled: true,
//               initialCameraPosition: const CameraPosition(
//                 target: LatLng(25.99096393024973, 50.4806988304455),
//                 zoom: 15.6746,
//               ),
//               onMapCreated: (controller) {
//                 _controller.complete(controller);
//               },
//               markers: {
//                 Marker(
//                   markerId: const MarkerId("currentlocation"),
//                   position: intialLocation,
//                   icon: currentlocation,
//                   draggable: true,
//                   onDragEnd: (value) {
//                     getAddressFromLatLon(value);
//                   },
//                 ),
//                 Marker(
//                   markerId: const MarkerId("checkPointOne"),
//                   position: const LatLng(25.976569, 50.482923),
//                   icon: checkPointOne,
//                   draggable: true,
//                   onDragEnd: (value) {
//                     getAddressFromLatLon(value);
//                   },
//                 ),
//                 Marker(
//                   markerId: const MarkerId("checkPointTow"),
//                   position: const LatLng(25.946548, 50.494207),
//                   icon: checkPointTow,
//                   draggable: true,
//                   onDragEnd: (value) {
//                     getAddressFromLatLon(value);
//                   },
//                 ),
//                 Marker(
//                   markerId: const MarkerId("checkPointThree"),
//                   position: const LatLng(25.954496, 50.497483),
//                   icon: checkPointThree,
//                   draggable: true,
//                   onDragEnd: (value) {
//                     getAddressFromLatLon(value);
//                   },
//                 ),
//               },
//               polygons: {
//                 Polygon(
//                   polygonId: const PolygonId("abir"),
//                   fillColor: iconColor.withOpacity(0.6),
//                   strokeColor: Colors.red,
//                   strokeWidth: 2,
//                   points: polygonPoins,
//                 ),
//               },
//             ),
//           ),
//           SafeArea(
//             top: false,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12),
//                 ),
//               ),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         "Horse Location",
//                         style: mystyle20B,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         color: Color(0xFFF8F8F8),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(12),
//                         ),
//                       ),
//                       child: ListTile(
//                         minLeadingWidth: 32,
//                         leading: CircleAvatar(
//                           radius: 16,
//                           backgroundColor: isIntheTrackRaceArea
//                               ? iconColor
//                               : const Color(0xFFEC3A3A),
//                           child: const Icon(
//                             Icons.near_me,
//                             color: Colors.white,
//                             size: 20,
//                           ),
//                         ),
//                         title: Text(
//                             isIntheTrackRaceArea
//                                 ? address
//                                 : "The horse outside the track race!",
//                             style: Theme.of(context).textTheme.titleMedium),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.white,
//                       padding: const EdgeInsets.only(top: 16),
//                       child: ListTile(
//                         iconColor: iconColor,
//                         leading: const CircleAvatar(
//                           backgroundColor: iconColor,
//                           radius: 24,
//                           backgroundImage:
//                               AssetImage("img/icons/horseiconmap.png"),
//                         ),
//                         title: const Text(
//                           "PRINCESSE SAFINAT",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, color: iconColor),
//                         ),
//                         subtitle: const Text(""),
//                         trailing: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: white,
//                             shape: CircleBorder(),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     // HorseData(),
//                                     HorseData(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             // ignore: prefer_const_constructors
//                             decoration: BoxDecoration(
//                               // ignore: prefer_const_constructors
//                               image: DecorationImage(
//                                 image: CachedNetworkImageProvider(
//                                     'https://firebasestorage.googleapis.com/v0/b/hcrsbh-b87b6.appspot.com/o/Horse%2Freport.png?alt=media&token=f74d0881-5d54-4498-87b7-1231e5a8dd26'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/map/polygon_util.dart';
import 'package:final_project/appfiles/Home/report/livedata2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../customWidget/customAppBar.dart';

class Maptracking extends StatefulWidget {
  const Maptracking({Key? key}) : super(key: key);

  @override
  State<Maptracking> createState() => MaptrackingState();
}

class MaptrackingState extends State<Maptracking> {
  late DatabaseReference _dbrefe;
  late double lat = 15.989435;
  late double lan = 10.479603;

  final Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor currentlocation = BitmapDescriptor.defaultMarker;
  BitmapDescriptor checkPointOne = BitmapDescriptor.defaultMarker;
  BitmapDescriptor checkPointTow = BitmapDescriptor.defaultMarker;
  BitmapDescriptor checkPointThree = BitmapDescriptor.defaultMarker;

  bool isIntheTrackRaceArea = true;
  // LatLng intialLocation = const LatLng(25.99096393024973, 50.4806988304455);
  LatLng intialLocation = const LatLng(25.989435, 50.479603);
  // LatLng intialLocation = const LatLng(25.946591, 50.493874);

  String address = "";
  List<LatLng> polygonPoins = const [
    LatLng(25.988307, 50.479793),
    LatLng(25.946591, 50.493874),
    LatLng(25.945163, 50.499062),
    LatLng(25.945553, 50.499485),
    LatLng(25.946851, 50.499378),
    LatLng(25.977940, 50.492308),
    LatLng(25.984851, 50.490155),
    LatLng(25.988659, 50.488688),
    LatLng(25.987775, 50.484835),
    LatLng(25.988487, 50.480994),
    LatLng(25.988326, 50.479793),
  ];
  @override
  void initState() {
    addCustomMarker();
    _dbrefe = FirebaseDatabase.instance.ref();
    dataChange();
    super.initState();
  }

  void dataChange() {
    _dbrefe.child('horse1').onValue.listen((event) {
      //  print(event.snapshot.value.toString());
      dynamic data = event.snapshot.value;
      // data.forEach((key, value) {
      //   setState(() {
      //     lat = data['lat'];
      //     lan = data['lan'];
      //   });
      // });

      setState(() {
        // print(data['Data']['lat']);
        // print(data['Data']['lan']);

        LatLng newLocation = LatLng(data['Data']['lat'], data['Data']['lan']);
        getAddressFromLatLon(newLocation);
        isIntheTrackRaceArea =
            PolygonUtil.containsLocation(newLocation, polygonPoins, false);
        lat = data['Data']['lat'];
        lan = data['Data']['lan'];
      });
    });
  }

  // void latChange() {
  //   _dbrefe.child('horse1').child('lat').onValue.listen((DatabaseEvent event) {
  //     print('==================================================== $event');
  //     dynamic data = event.snapshot.value;
  //     print('lat: $data');
  //     setState(() {
  //       lat = data;
  //     });
  //   });
  // }

  // void lanChange() {
  //   _dbrefe.child('horse1').child('lan').onValue.listen((DatabaseEvent event) {
  //     print('==================================================== $event');
  //     dynamic data = event.snapshot.value;
  //     print('lan: $data');
  //     setState(() {
  //       lan = data;
  //     });
  //   });
  // }

  void addCustomMarker() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/icons/horsemap.png",
    ).then(
      (markerIcon) {
        setState(() {
          currentlocation = markerIcon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/icons/checkpoint.png",
    ).then(
      (markerIcon) {
        setState(() {
          checkPointOne = markerIcon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/icons/checkpoint.png",
    ).then(
      (markerIcon) {
        setState(() {
          checkPointTow = markerIcon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "img/icons/checkpoint.png",
    ).then(
      (markerIcon) {
        setState(() {
          checkPointThree = markerIcon;
        });
      },
    );
  }

  void getAddressFromLatLon(LatLng latLng) {
    placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
      localeIdentifier: "en_BD",
    ).then(
      (placemarks) {
        String firstAddress =
            "${placemarks[0].name}, ${placemarks[0].administrativeArea}";
        if (firstAddress != address) {
          setState(() {
            isIntheTrackRaceArea =
                PolygonUtil.containsLocation(latLng, polygonPoins, false);
            address = firstAddress;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Track Race',
        isLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(25.95, 50.55),
                  zoom: 10,
                ),
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("currentlocation"),
                    position: LatLng(lat, lan),
                    // double.parse(item[index]["lat"]
                    // ),
                    // double.parse(item[index]["lan"]
                    // ),

                    icon: currentlocation,
                    draggable: true,
                    onDragEnd: (value) {
                      getAddressFromLatLon(value);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId("checkPointOne"),
                    position: const LatLng(25.975674, 50.479197),
                    icon: checkPointOne,
                    draggable: true,
                    onDragEnd: (value) {
                      getAddressFromLatLon(value);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId("checkPointTow"),
                    position: const LatLng(25.945557, 50.489751),
                    icon: checkPointTow,
                    draggable: true,
                    onDragEnd: (value) {
                      getAddressFromLatLon(value);
                    },
                  ),
                  Marker(
                    markerId: const MarkerId("checkPointThree"),
                    position: const LatLng(25.962799, 50.490673),
                    icon: checkPointThree,
                    draggable: true,
                    onDragEnd: (value) {
                      getAddressFromLatLon(value);
                    },
                  ),
                },
                polygons: {
                  Polygon(
                    polygonId: const PolygonId("abir"),
                    fillColor: iconColor.withOpacity(0.6),
                    strokeColor: Colors.red,
                    strokeWidth: 2,
                    points: polygonPoins,
                  ),
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Horse Location",
                          style: mystyle20B,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: ListTile(
                          minLeadingWidth: 32,
                          leading: CircleAvatar(
                            radius: 16,
                            backgroundColor: isIntheTrackRaceArea
                                ? iconColor
                                : const Color(0xFFEC3A3A),
                            child: const Icon(
                              Icons.near_me,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                              isIntheTrackRaceArea
                                  ? address
                                  : "The horse outside the track race!",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 16),
                        child: ListTile(
                          iconColor: iconColor,
                          leading: const CircleAvatar(
                            backgroundColor: iconColor,
                            radius: 24,
                            backgroundImage:
                                AssetImage("img/icons/horseiconmap.png"),
                          ),
                          title: const Text(
                            "PRINCESSE SAFINAT",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: iconColor),
                          ),
                          subtitle: const Text(""),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: white,
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GraphPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                // ignore: prefer_const_constructors
                                image: const DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      'https://firebasestorage.googleapis.com/v0/b/hcrsbh-b87b6.appspot.com/o/Horse%2Freport.png?alt=media&token=f74d0881-5d54-4498-87b7-1231e5a8dd26'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
