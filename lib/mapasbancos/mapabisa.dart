import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Bisa extends StatefulWidget {
  const Bisa({Key key}) : super(key: key);

  @override
  _BisaState createState() => _BisaState();
}

class _BisaState extends State<Bisa> {
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
    if (x > 800) {
      cerca = true;
    } else
      print('x es ${punto.latitude} y es ${punto.longitude}');

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
      //-16.50201493138753, -68.13259497291858
      LatLng(-16.5002045296589, -68.13280601854174), //
      LatLng(-16.50058958353001, -68.13390449685436), //
      LatLng(-16.498765008239513, -68.13378730323811), //
      LatLng(-16.50977499925798, -68.12349043207328), //
      LatLng(-16.500275387640315, -68.12378666090879), //
      LatLng(-16.538674059386402, -68.07717920138974), //
      LatLng(-16.53867693464403, -68.07719108974354), //
      LatLng(-16.545566081413433, -68.09117946090797), //
      LatLng(-16.5400055816442, -68.07918856090805), //
      LatLng(-16.526580391011823, -68.10863010323757), //
      LatLng(-16.513900231771313, -68.12903541673164), //
      LatLng(-16.51255935242399, -68.12127954556706), //
      LatLng(-16.49501277940196, -68.1352902320736), //
      LatLng(-16.495643530936906, -68.12042496090892), //
      LatLng(-16.538583479674106, -68.08342781488355), //
      LatLng(-16.49618731869816, -68.13984631857969), //
      LatLng(-16.52290580111543, -68.1066611167315), //
      LatLng(-16.502814385620514, -68.1364630744026), //
      LatLng(-16.51911405081459, -68.18297463022546), //
      LatLng(-16.546414844128037, -68.09080394556646), //

      LatLng(-16.53195477049304, -68.08725438974363), //
      LatLng(-16.49725525795057, -68.12850599577922), //
      LatLng(-16.497159206788794, -68.13827828974432), //
      LatLng(-16.506031172540915, -68.12020012202613), //
      LatLng(-16.541547192547778, -68.077450660908), //
      LatLng(-16.52422695981935, -68.08693608974376), //
      LatLng(-16.50481583483344, -68.13063665761769), //
      LatLng(-16.54034272154447, -68.05750315906042), //
      LatLng(-16.4911514641594, -68.13580198789676), //
      LatLng(-16.503974152552207, -68.13155921673189), //
      LatLng(-16.486474759780577, -68.14163378961766), //
      LatLng(-16.49882673074102, -68.13384094741497), //
      LatLng(-16.495225366836912, -68.14781767255528), //
      LatLng(-16.53617062715522, -68.09720837440197), //
      LatLng(-34.76207149814843, -58.260065331562515), //
      LatLng(-16.56667833517406, -68.08978991857822), //
      LatLng(-16.49743862274519, -68.1240533897443), //
      LatLng(-16.54935326335266, -68.08665711673103), //
      LatLng(-16.548273384954104, -68.06990499648228), //
      LatLng(-16.494992057552007, -68.14396567440285), //

      LatLng(-16.510669701218394, -68.12231494926232), //
      LatLng(-16.53873576913896, -68.0772006590605), //
      LatLng(-16.478170432309398, -68.12240630536652), //
      LatLng(-16.50351389488331, -68.1214756317931), //
      LatLng(-16.51620886255639, -68.14280094741471), //
      LatLng(-16.49329757911083, -68.13942338974435), //
      LatLng(-16.518126395519516, -68.06446103022552), //
      LatLng(-16.51497311940783, -68.13957497440241), //
      LatLng(-16.499512460774458, -68.13872441673202), //
      LatLng(-16.527799550265808, -68.10332730323765), //
      LatLng(-16.49293172471121, -68.14307979330636), //
      LatLng(-16.485532394071996, -68.14631507440302), //
      LatLng(-16.54573264329177, -68.06334123392027), //
      LatLng(-16.499379777279046, -68.13346374556735), //
      LatLng(-16.544561680396352, -68.06776028974328), //
      LatLng(-16.496366780481008, -68.13496410323816), //
      LatLng(-16.54179334716214, -68.07910076090795), //
      LatLng(-16.500012718447188, -68.11868073207339), //
      LatLng(-16.540440145936557, -68.08942464556655), //
      LatLng(-16.514003939613946, -68.12147963207315), //

      LatLng(-16.50129592807634, -68.12148785906125), //
      LatLng(-16.539992025617888, -68.08054933175906), //
      LatLng(-16.51163862940287, -68.1408393744026), //
      LatLng(-16.49321685271601, -68.1421872590614), //
      LatLng(-16.490712275951523, -68.12301543207373), //
      LatLng(-16.477758479338302, -68.12197792208771), //
      LatLng(-16.498621582278034, -68.14241563207351), //
      LatLng(-16.495053781257237, -68.14398713207359), //
      LatLng(-16.529393234068234, -68.10219084556677), //
      LatLng(-16.538524009684515, -68.08283010323736), //
      LatLng(-16.501838389551367, -68.11722061673186), //
      LatLng(-16.503549638920948, -68.1342231897441), //
      LatLng(-16.47530082208962, -68.11787225906174), //
      LatLng(-16.493116482570723, -68.13735290794015), //
      LatLng(-16.512457843510173, -68.12274016090849), //
      LatLng(-16.506981595841044, -68.12921497440264), //
      LatLng(-16.52937781060275, -68.10184798974363), //
      LatLng(-16.538554864587248, -68.08280864556662), //
      LatLng(-16.52939419647412, -68.07509065757326), //
      LatLng(-16.509300312165383, -68.12900597440252), //

      LatLng(-16.478389349055046, -68.12061993207396), //
      LatLng(-16.52575633264381, -68.11003697440222), //
      LatLng(-16.501975802817793, -68.13276378974415), //
      LatLng(-16.496521908668928, -68.13574568789664), //
      LatLng(-16.502006663558713, -68.13265650139041), //
      LatLng(-16.52955876368278, -68.07354570527956), //
      LatLng(-16.5307291395362, -68.0724317744021), //
      LatLng(-16.501290623580026, -68.1382865474149), //
      LatLng(-16.509312398692064, -68.12350800323797), //
      LatLng(-16.50035822883962, -68.13519228392107), //
      LatLng(-16.49392573557258, -68.14833184814147), //
      LatLng(-16.539401610993867, -68.0730888744019), //
      LatLng(-16.528308892944445, -68.10397414741439), //
      LatLng(-16.48687653438141, -68.0915962032384), //
      LatLng(-16.53983652095116, -68.08402304741414), //
      LatLng(-16.53793858870276, -68.08746821857885), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Bisa'),
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
                  marcador(puntos[77]),
                  marcador(puntos[78]),
                  marcador(puntos[79]),
                  marcador(puntos[80]),
                  marcador(puntos[81]),
                  marcador(puntos[82]),
                  marcador(puntos[83]),
                  marcador(puntos[84]),
                  marcador(puntos[85]),
                  marcador(puntos[86]),
                  marcador(puntos[87]),
                  marcador(puntos[88]),
                  marcador(puntos[89]),
                  marcador(puntos[90]),
                  marcador(puntos[91]),
                  marcador(puntos[92]),
                  marcador(puntos[93]),
                  marcador(puntos[94]),
                  marcador(puntos[95])
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
