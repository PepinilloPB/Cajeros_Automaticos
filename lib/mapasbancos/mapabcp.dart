import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Bcp extends StatefulWidget {
  const Bcp({Key key}) : super(key: key);

  @override
  _BcpState createState() => _BcpState();
}

class _BcpState extends State<Bcp> {
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
      LatLng(-16.53859600444991, -68.08287301857885), //
      LatLng(-16.51164836962042, -68.12175315906097), //
      LatLng(-16.50796455679572, -68.12845955906106), //
      LatLng(-16.485104410531083, -68.12226245906166), //
      LatLng(-16.523815302180466, -68.1124659455669), //
      LatLng(-16.508975171339724, -68.12597488789642), //
      LatLng(-16.499909848231148, -68.11869146090875), //
      LatLng(-16.53983652095116, -68.0840337762495), //
      LatLng(-16.505711147478866, -68.1294390455672), //
      LatLng(-16.508890998176547, -68.16433003022571), //
      LatLng(-16.502780777563046, -68.1320733878966), //
      LatLng(-16.5343547145265, -68.0754661032374), //
      LatLng(-16.510541685544855, -68.18821447440254), //
      LatLng(-16.499154576383216, -68.1746904343359), //
      LatLng(-16.53048479671729, -68.07324743907775), //
      LatLng(-16.509972245409493, -68.1648975744025), //
      LatLng(-16.508875876993383, -68.16448664926244), //
      LatLng(-16.52657467745357, -68.10688007440224), //
      LatLng(-16.500940375410558, -68.12295087440265), //
      LatLng(-16.539809351144736, -68.07781047255425), //

      LatLng(-16.5218392857121, -68.20412490508528), //
      LatLng(-16.47880516822777, -68.12061010508607), //
      LatLng(-16.523074472872995, -68.10653863392065), //
      LatLng(-16.597617052608044, -68.17476075905925), //
      LatLng(-16.499936370341096, -68.12409228974417), //
      LatLng(-16.495268332489534, -68.14787291857971), //
      LatLng(-16.53893944457748, -68.08420620323737), //
      LatLng(-16.54003489093631, -68.07433871673123), //
      LatLng(-16.49818457537291, -68.13487916090888), //
      LatLng(-16.548721086715666, -68.20891624898019), //
      LatLng(-16.514400391158045, -68.12920571673175), //
      LatLng(-16.500561848924303, -68.13304521673194), //
      LatLng(-16.544693403514664, -68.07662195536516), //
      LatLng(-16.497740861788962, -68.1356453609089), //
      LatLng(-16.51199084286424, -68.16402161673169), //
      LatLng(-16.49814289792781, -68.14289767625031), //
      LatLng(-16.51875068020184, -68.06217358604856), //
      LatLng(-16.54538629699526, -68.0703933339202), //
      LatLng(-16.50587605457465, -68.12032220508559), //
      LatLng(-16.499930422278727, -68.11872364741488), //

      LatLng(-16.495513167051012, -68.13587328420144), //
      LatLng(-16.49393593057771, -68.13203030323822), //
      LatLng(-16.497597432909757, -68.13911794187219), //
      LatLng(-16.52406883096063, -68.08702928392057), //
      LatLng(-16.509628518057102, -68.12388334556708), //
      LatLng(-16.511432801286066, -68.14089584741475), //
      LatLng(-16.545255427303964, -68.09137368604806), //
      LatLng(-16.49314775367147, -68.14249570139056), //
      LatLng(-16.500063252369724, -68.14504332837825), //
      LatLng(-16.53202676770912, -68.08715783022528), //
      LatLng(-16.499916648238433, -68.13123007440278), //
      LatLng(-16.490867526115764, -68.12269401857982), //
      LatLng(-16.500581592223885, -68.13899368789664), //
      LatLng(-16.497160958149802, -68.12854716090901), //
      LatLng(-16.517730922929513, -68.15073890323775), //
      LatLng(-16.499213282749757, -68.1715979744027), //
      LatLng(-16.494445678950093, -68.12109966090897), //
      LatLng(-16.529183435745217, -68.10239627440214), //
      LatLng(-16.498184859292635, -68.13325690323805), //
      LatLng(-16.492087577071015, -68.1376983032383), //

      LatLng(-16.50244312966219, -68.16410587440271), //
      LatLng(-16.5037895995885, -68.12097364741484), //
      LatLng(-16.489763049895227, -68.20744153022606), //
      LatLng(-16.497434345599732, -68.13883797625036), //
      LatLng(-16.497839236178837, -68.12191563207354), //
      LatLng(-16.496110967495568, -68.1314879013905), //
      LatLng(-16.479439262181227, -68.22169983022627), //
      LatLng(-16.540758867523156, -68.09040311673117), //
      LatLng(-16.540232206280475, -68.07894021673121), //
      LatLng(-16.51497311940783, -68.13956424556702), //
      LatLng(-16.488437311287193, -68.14074350323834), //
      LatLng(-16.49508464310245, -68.14394421673211), //
      LatLng(-16.49312519052125, -68.19642211857968), //
      LatLng(-16.493754579669325, -68.14405578789682), //
      LatLng(-16.521933101794048, -68.21050477227439), //
      LatLng(-16.51477858138779, -68.13412948789632), //
      LatLng(-16.503555583939587, -68.13726753207338), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco BCP'),
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
                  marcador(puntos[24]),
                  marcador(puntos[25]),
                  marcador(puntos[26]),
                  marcador(puntos[27]),
                  marcador(puntos[28]),
                  marcador(puntos[29]),
                  marcador(puntos[30]),
                  marcador(puntos[31]),
                  marcador(puntos[32]),
                  marcador(puntos[33]),
                  marcador(puntos[34]),
                  marcador(puntos[35]),
                  marcador(puntos[36]),
                  marcador(puntos[37]),
                  marcador(puntos[38]),
                  marcador(puntos[39]),
                  marcador(puntos[40]),
                  marcador(puntos[41]),
                  marcador(puntos[42]),
                  marcador(puntos[43]),
                  marcador(puntos[44]),
                  marcador(puntos[45]),
                  marcador(puntos[46]),
                  marcador(puntos[47]),
                  marcador(puntos[48]),
                  marcador(puntos[49]),
                  marcador(puntos[50]),
                  marcador(puntos[51]),
                  marcador(puntos[52]),
                  marcador(puntos[53]),
                  marcador(puntos[54]),
                  marcador(puntos[55]),
                  marcador(puntos[56]),
                  marcador(puntos[57]),
                  marcador(puntos[58]),
                  marcador(puntos[59]),
                  marcador(puntos[60]),
                  marcador(puntos[61]),
                  marcador(puntos[62]),
                  marcador(puntos[63]),
                  marcador(puntos[64]),
                  marcador(puntos[65]),
                  marcador(puntos[66]),
                  marcador(puntos[67]),
                  marcador(puntos[68]),
                  marcador(puntos[69]),
                  marcador(puntos[70]),
                  marcador(puntos[71]),
                  marcador(puntos[72]),
                  marcador(puntos[73]),
                  marcador(puntos[74]),
                  marcador(puntos[75]),
                  marcador(puntos[76]),
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
