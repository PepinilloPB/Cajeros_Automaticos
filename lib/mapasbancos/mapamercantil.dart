import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Mercantil extends StatefulWidget {
  const Mercantil({Key key}) : super(key: key);

  @override
  _MercantilState createState() => _MercantilState();
}

class _MercantilState extends State<Mercantil> {
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

  _cercano(LatLng punto) {
    bool cerca = false;
    //         -16.492758277823686;

    double x = Distance().as(LengthUnit.Meter, centro, punto);
    //print('x es $x');
    if (x > 800) cerca = true;

    return cerca;
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
      LatLng(-16.510428534465643, -68.18796771118897), //
      LatLng(-16.508822303869483, -68.16431461673179), //
      LatLng(-16.501175067083324, -68.12102331673194), //
      LatLng(-16.51277625742121, -68.16418693087026), //
      LatLng(-16.523185244124267, -68.17222535721321), //
      LatLng(-16.497411051304415, -68.1744601762503), //
      LatLng(-16.50918014460914, -68.08398543207332), //
      LatLng(-16.540198066775982, -68.08884964556658), //
      LatLng(-16.499426612528712, -68.13298566090891), //
      LatLng(-16.52170359970769, -68.15597028789617), //
      LatLng(-16.498208359318884, -68.14303978789661), //
      LatLng(-16.53210905020888, -68.08722220323752), //
      LatLng(-16.49320810321992, -68.13705850508592), //
      LatLng(-16.543696279520145, -68.07698303207266), //
      LatLng(-16.495033206691012, -68.14400858974433), //
      LatLng(-16.52760872108558, -68.19817979159123), //
      LatLng(-16.516789035613908, -68.15695300508547), //
      LatLng(-16.478521693385968, -68.12042953915098), //
      LatLng(-16.52323088726751, -68.1061354032376), //
      LatLng(-16.53953200549705, -68.09919981857885), //

      LatLng(-16.493331367549334, -68.14054864682957), //
      LatLng(-16.491188551315524, -68.14402527440296), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Mercantil'),
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
