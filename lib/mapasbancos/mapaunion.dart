import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Union extends StatefulWidget {
  const Union({Key key}) : super(key: key);

  @override
  _UnionState createState() => _UnionState();
}

class _UnionState extends State<Union> {
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

//-16.492758277823686, -68.12446468243748
  @override
  Widget build(BuildContext context) {
    centro = LatLng(lat, lng);
    List<LatLng> puntos = [
      LatLng(-16.49630291028035, -68.13487019521476), //
      LatLng(-16.49928277502771, -68.1332449613972), //
      LatLng(-16.504788925323027, -68.13064513011086), //
      LatLng(-16.501012600378232, -68.12208149633926), //
      LatLng(-16.49521054104395, -68.13391532886588), //
      LatLng(-16.506858988634633, -68.12736123379747), //
      LatLng(-16.49492611796426, -68.13173631705654), //
      LatLng(-16.495016438655604, -68.11698884914324), //
      LatLng(-16.498046680984288, -68.12264373042687), //
      LatLng(-16.509025259700294, -68.12807386681823), //
      LatLng(-16.49299806099733, -68.13695490751725), //
      LatLng(-16.496726673891878, -68.13819035354172), //
      LatLng(-16.50324236196524, -68.12928555753616), //
      LatLng(-16.494200491003877, -68.14413855444482), //
      LatLng(-16.503048263926534, -68.12146636621677), //
      LatLng(-16.49698371695858, -68.14225239761477), //
      LatLng(-16.49295336133216, -68.13695560751727), //
      LatLng(-16.502472974441392, -68.13677263478499), //
      LatLng(-16.478172245720284, -68.1204144983095), //
      LatLng(-16.50716276039736, -68.11975111733746), //

      LatLng(-16.497321123601708, -68.13510622959296), //
      LatLng(-16.503432837545592, -68.12139636223085), //
      LatLng(-16.514384270480473, -68.13958547712348), //
      LatLng(-16.509900188849468, -68.12738301256226), //
      LatLng(-16.497148311767713, -68.14229969761477), //
      LatLng(-16.501372523474146, -68.13306172701897), //
      LatLng(-16.4972182519543, -68.13508477192221), //
      LatLng(-16.525849625298616, -68.10642961394495), //
      LatLng(-16.496339879583356, -68.13675995751721), //
      LatLng(-16.493994744335932, -68.14413855444482), //
      LatLng(-16.507972469029884, -68.1245055576946), //
      LatLng(-16.521669306820897, -68.10671601848172), //
      LatLng(-16.497964383979404, -68.12287976480508), //
      LatLng(-16.499929830298562, -68.13306678228149), //
      LatLng(-16.52798696310686, -68.10170498662313), //
      LatLng(-16.50865866784781, -68.1355501935769), //
      LatLng(-16.490571574575434, -68.13969357315024), //
      LatLng(-16.50840752836218, -68.11908944460545), //
      LatLng(-16.492806805086904, -68.14016157258939), //
      LatLng(-16.538652245498696, -68.09565233544615), //

      LatLng(-16.521024583574757, -68.08660930248801), //
      LatLng(-16.511228048386656, -68.12656762107395), //
      LatLng(-16.509173869652646, -68.15888961430784), //
      LatLng(-16.517706346720423, -68.11559466274896), //
      LatLng(-16.497003744900432, -68.15209934836176), //
      LatLng(-16.479984861842375, -68.12045846497936), //
      LatLng(-16.52356422289078, -68.15174788915154), //
      LatLng(-16.508455381827627, -68.12439146480467), //
      LatLng(-16.501822450823735, -68.13125854689666), //
      LatLng(-16.537143514800345, -68.06694053186165), //
      LatLng(-16.52564580769687, -68.10637148326201), //
      LatLng(-16.497579826060086, -68.15175602562984), //
      LatLng(-16.49749144414289, -68.16505545525798), //
      LatLng(-16.509328967500338, -68.11847535653196), //
      LatLng(-16.515631124074943, -68.0623185954739), //
      LatLng(-16.504142319604927, -68.1621138267986), //
      LatLng(-16.533898529884617, -68.07450803191676), //
      LatLng(-16.49724455231459, -68.17506279399456), //
      LatLng(-16.522535643605586, -68.15222881585899), //
      LatLng(-16.493129642126114, -68.17370130648175), //

      LatLng(-16.504603004231893, -68.13073211862185), //
      LatLng(-16.50397773074739, -68.1621138267986), //
      LatLng(-16.492882744732032, -68.17390024853069), //
      LatLng(-16.489376186658465, -68.17232151101425), //
      LatLng(-16.541624742972584, -68.07692218420763), //
      LatLng(-16.507175621344437, -68.16425373705688), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco Unión'),
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
                  //posicion actual
                  Marker(
                      point: centro,
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
                  //cajeros
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
                  marcador(puntos[65])
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
