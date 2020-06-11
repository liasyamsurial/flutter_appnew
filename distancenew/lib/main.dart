import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  String _locationMessage = "";
  String _locationDistance = "";

  double get startLatitude => null;
  double get startLongitude => null;

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

    double startLatitude = position.latitude;
    double startLongitude = position.longitude;

  }

  void _getDistance() async {
    double distanceInMeters = await Geolocator().distanceBetween(startLatitude, startLongitude, 52.3546274, 4.8285838);
    print(distanceInMeters);

    setState(() {
      _locationDistance = "$distanceInMeters";
    });
  }

  bool sensor1 = true; //false means air naik .
  bool sensor2 = true;
  bool sensor3 = true;

  String distance1;   //setiap distance ni sama ada nilai dia location dia or null if dia banjir;
  String distance2;
  String distance3;

  void _solusiEl() {
    if(sensor1&&sensor2&&sensor3){//Kalau Semua betul
        //execute pengiraan antara tiga ni
        setState(() {
          distance1 =null;
          distance2 =null;
          distance3 =null;
        });
        if(sensor1){
          setState(() {
            distance1 = 'Berapa distance dia';
          });
        }
        if(sensor2){
           setState(() {
            distance1 = 'Berapa distance dia';
          });
        }
        if(sensor3){
           setState(() {
            distance1 = 'Berapa distance dia';
          });
        }
    }
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
            appBar: AppBar(
                title: Text("Location Services")
            ),
            body: Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_locationMessage),
                    FlatButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        color: Colors.purpleAccent,
                        child: Text("Find Location")
                    ),
                    Text(_locationDistance),
                    FlatButton(
                        onPressed: () {
                          _getDistance();
                        },
                        color: Colors.purple,
                        child: Text("Location Distance")
                    )
                  ]
              ),
            )
        )
    );
  }
}
