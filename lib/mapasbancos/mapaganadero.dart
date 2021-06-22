import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Ganadero extends StatefulWidget {
  const Ganadero({Key key}) : super(key: key);

  @override
  _GanaderoState createState() => _GanaderoState();
}

class _GanaderoState extends State<Ganadero> {
  double lat = -16.492758277823686;
  double lng = -68.12446468243748;
  double zoom = 15.0;
  //LatLng centro = LatLng(-16.4897, -68.1193);
  LatLng centro;

  MapController mapController;
  StatefulMapController statefulMapController;
  StreamSubscription<StatefulMapControllerStateChange> sub;

  @override
  void initState() {
    mapController = MapController();
    statefulMapController = StatefulMapController(mapController: mapController);
    statefulMapController.onReady
        .then((value) => print('Controlador de mapa listo'));
    sub = statefulMapController.changeFeed.listen((event) {});
    getCurrentLocation();
    super.initState();
  }

  void _zoommove(double cambio) {
    zoom = zoom + cambio;
    mapController.move(centro, zoom);
  }

  _cercano(LatLng punto) {
    bool cerca = false;
    //         -16.492758277823686;

    double x = Distance().as(LengthUnit.Meter, centro, punto);
    //print('x es $x');
    if (x > 800) cerca = true;

    return cerca;
  }

  getCurrentLocation() async {
    final geoposicion = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (!mounted) return;

    setState(() {
      lat = geoposicion.latitude;
      if (lat == 37.4219983) lat = -16.492758277823686;

      lng = geoposicion.longitude;
      if (lng == -122.084) lng = -68.12446468243748;
    });
  }

  Marker marcador(LatLng p) {
    return Marker(
        point: p,
        width: 20.0,
        height: 20.0,
        builder: (context) => Container(
                child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: (_cercano(p)) ? Colors.blueAccent : Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
            )));
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    centro = LatLng(lat, lng);
    List<LatLng> puntos = [
      LatLng(-16.498950076593736, -68.13383847440275), //
      LatLng(-16.540523706606653, -68.08038184741417), //
      LatLng(-16.509091596223357, -68.12425096577881), //
      LatLng(-16.49928668461552, -68.12420112440282), //
      LatLng(-16.503179630680272, -68.1312188878966), //
      LatLng(-16.499454721823597, -68.17479420323815), //
      LatLng(-16.53206790896339, -68.0871149148838), //
      LatLng(-16.527044605962516, -68.14848140508508), //
      LatLng(-16.509026130982818, -68.1642478167317), //
      LatLng(-16.510479966782583, -68.18818228789642), //
      LatLng(-16.529269808569072, -68.10224448974364), //
      LatLng(-16.510095118478944, -68.12604598604888), //
      LatLng(-16.54459209579292, -68.06677020323727), //
      LatLng(-16.54012104564747, -68.07800937624951), //
      LatLng(-16.49512056860558, -68.14017887255518), //
      LatLng(-16.530926537322934, -68.07269071857898), //
      LatLng(-16.505304753967, -68.12964601857955), //
      LatLng(-16.495105217663205, -68.14391203022598), //
      LatLng(-16.47579510456274, -68.12930950323857), //
      LatLng(-16.518894684453095, -68.0621628572132), //

      LatLng(-16.527861263495193, -68.10331657440229), //
      LatLng(-16.49907352145893, -68.13388138974423), //
      LatLng(-16.50247545095868, -68.12098177440262), //
      LatLng(-16.543688410148015, -68.0770431455665), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Ganadero'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                zoom: zoom,
                center: centro,
              ),
              layers: [
                PolylineLayerOptions(polylines: statefulMapController.lines),
                PolygonLayerOptions(polygons: statefulMapController.polygons),
                TileLayerOptions(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/pepinilloplayboy/ckox4zxd317nm18pk0pcd88a5/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGVwaW5pbGxvcGxheWJveSIsImEiOiJja293eXk0N2UwMmF3MnBuMXpqdG5ia2h3In0.tyj1JpOy64CgR7ptrvF3mQ',
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoicGVwaW5pbGxvcGxheWJveSIsImEiOiJja293eXk0N2UwMmF3MnBuMXpqdG5ia2h3In0.tyj1JpOy64CgR7ptrvF3mQ',
                      'id': 'mapbox.mapbox-streets-v7'
                    }),
                MarkerLayerOptions(markers: [
                  Marker(
                      //posicion actual
                      point: LatLng(lat, lng),
                      width: 15.0,
                      height: 15.0,
                      builder: (context) => Container(
                              child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ))),
                  marcador(puntos[0]),
                  marcador(puntos[1]),
                  marcador(puntos[2]),
                  marcador(puntos[3]),
                  marcador(puntos[4]),
                  marcador(puntos[5]),
                  marcador(puntos[6]),
                  marcador(puntos[7]),
                  marcador(puntos[8]),
                  marcador(puntos[9]),
                  marcador(puntos[10]),
                  marcador(puntos[11]),
                  marcador(puntos[12]),
                  marcador(puntos[13]),
                  marcador(puntos[14]),
                  marcador(puntos[15]),
                  marcador(puntos[16]),
                  marcador(puntos[17]),
                  marcador(puntos[18]),
                  marcador(puntos[19]),
                  marcador(puntos[20]),
                  marcador(puntos[21]),
                  marcador(puntos[22]),
                  marcador(puntos[23]),
                ]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: () {
                  setState(() {
                    _zoommove(-1);
                  });
                }),
            IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: () {
                  setState(() {
                    _zoommove(1);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
