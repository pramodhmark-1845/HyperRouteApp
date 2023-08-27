import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class googlemapstrack extends StatefulWidget{
  @override
  _googlemapstrackState createState() => _googlemapstrackState();
}

class _googlemapstrackState extends State<googlemapstrack> {

  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyD2J8ooPiB4GQzeJEE_K5nTG3IhmZ7F6kA";

  Set<Marker> markers = Set();
  Map<PolylineId, Polyline> polylines = {};
  LatLng busLocation = LatLng(11.2625, 75.8391);

  List <LatLng> p = [LatLng(11.2574, 75.7824),LatLng(11.2722, 75.8372),LatLng(11.3051,75.8781 ),LatLng(11.3184, 75.9399)];
  BitmapDescriptor dot_icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  void makecustomicon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/dot-23853.png")
        .then((icon) => {
      setState((){
        dot_icon=icon;
      })
    });
  }
  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId("Start_Location"),
      position: p[0],
      infoWindow: InfoWindow(
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    markers.add(Marker(
      markerId: MarkerId("End_Location"),
      position: p[3], //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Destination Point ',
        snippet: 'Destination Marker',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    for(int i=0;i<2;i++) // length-1
        {
      markers.add(
        Marker(
          markerId: MarkerId('m'),
          icon: dot_icon,
          position: p[i+1],
          infoWindow: InfoWindow(title: 'SubStation'),
        ),
      );
    }
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(1.0,1.0)),
        'assets/bus.png')
        .then((icon) {
      Marker customMarker = Marker(
        markerId: MarkerId(busLocation.toString()),
        position: busLocation,
        infoWindow: InfoWindow(title: 'bus location',snippet: 'bus '),
        icon:  icon ,
      );
      markers.add(customMarker);
    });

    getDirections(p);
    super.initState();
  }


  getDirections(List<LatLng>p) async {
    List<LatLng> polylineCoordinates = [];
    for(int i=0;i<3;i++) {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(p[i].latitude, p[i].longitude),
        PointLatLng(p[i+1].latitude, p[i+1].longitude),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      } else {
        print(result.errorMessage);
      }
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    makecustomicon();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text("Calicut -> Kattangal"),
        backgroundColor: Color(0xF73A2DCD),
        toolbarHeight: height*0.06,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: p[2],
          zoom: 11,
        ),
        markers: markers,
        polylines: Set<Polyline>.of(polylines.values),
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}