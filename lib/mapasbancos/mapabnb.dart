import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import 'package:geolocator/geolocator.dart';

class Bnb extends StatefulWidget {
  const Bnb({Key key}) : super(key: key);

  @override
  _BnbState createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
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
      LatLng(-16.523327915843993, -68.17191547624984), //
      LatLng(-16.51037710213502, -68.18806427070733), //JFK
      LatLng(-16.506188894871535, -68.16381211857944), //
      LatLng(-16.506092721389187, -68.16253047440273), //
      LatLng(-16.509526452957573, -68.15902080323792), //
      LatLng(-16.520231827645656, -68.20921638789622), //
      LatLng(-16.501454262942005, -68.13583216090885), //
      LatLng(-16.506835209018913, -68.12951957440261), //
      LatLng(-16.531919311673043, -68.07377897440206), //
      LatLng(-16.49506406853952, -68.14393348789672), //
      LatLng(-16.49873757283455, -68.13428981673204), //
      LatLng(-16.53202676770912, -68.08722220323752), //
      LatLng(-16.495161143183715, -68.12222443022598), //
      LatLng(-16.540217854957902, -68.07859198789578), //
      LatLng(-16.53195016763175, -68.07384334741428), //
      LatLng(-16.53960101498105, -68.08630604371898), //
      LatLng(-16.509876491252047, -68.12346874741482), //
      LatLng(-16.48753492414473, -68.13884521673226), //
      LatLng(-16.4900249252653, -68.14157200323825), //
      LatLng(-16.526973320307484, -68.10651107440223), //

      LatLng(-16.494981917545275, -68.13539752042733), //
      LatLng(-16.495186757852103, -68.1477794744029), //
      LatLng(-16.50340425194622, -68.13089150323805), //
      LatLng(-16.506379088462825, -68.12010034556731), //
      LatLng(-16.497294135396537, -68.13853711673218), //
      LatLng(-16.53889830478806, -68.08414183022514), //
      LatLng(-16.539809351144736, -68.07793921857873), //
      LatLng(-16.544531257183866, -68.06786414741401), //
      LatLng(-16.53225133792491, -68.08695521388688), //
      LatLng(-16.509923158878916, -68.12638368974399), //
      LatLng(-16.504424319171353, -68.13075938974411), //
      LatLng(-16.514038635781333, -68.12897657440247), //
      LatLng(-16.49538931599147, -68.12949110323824), //
      LatLng(-16.496381080492405, -68.13456140323817), //
      LatLng(-16.50777953505031, -68.1649144214273), //
      LatLng(-16.510808014090067, -68.12772057440243), //
      LatLng(-16.50339421242224, -68.12046638974412), //
      LatLng(-16.479077697385144, -68.14844310508612), //
      LatLng(-16.504801493174675, -68.1008097302258), //
      LatLng(-16.510603832493047, -68.12225650508546), //

      LatLng(-16.49839589825048, -68.141999033921), //
      LatLng(-16.522895515314627, -68.10673621857912), //
      LatLng(-16.4999000962808, -68.12408486090888), //
      LatLng(-16.506855782329723, -68.12956248974409), //
      LatLng(-16.524729003103523, -68.0868533609083), //
      LatLng(-16.52871622410621, -68.10208013207281), //
      LatLng(-16.49725032248501, -68.12835387440276), //
      LatLng(-16.495191530480604, -68.14025791857972), //
      LatLng(-12.187077002386179, -76.99775490516205), //
      LatLng(-16.493104615749967, -68.19637920323818), //
      LatLng(-16.540115006149385, -68.07860271673117), //
      LatLng(-16.498816798787395, -68.1341949897443), //
      LatLng(-16.518884398438715, -68.06229160323767), //
      LatLng(-16.54111332873296, -68.05778733207276), //
      LatLng(-16.49537659439929, -68.11660810508577), //
      LatLng(-16.52940078151672, -68.10043268974366), //
      LatLng(-16.49311734101185, -68.13729884741507), //
      LatLng(-16.51018779976296, -68.13716477440249), //
      LatLng(-16.512320793094393, -68.08985469622672), //
      LatLng(-16.515245467936428, -68.13930637440244), //

      LatLng(-16.586566293409803, -68.23892140323633), //
      LatLng(-16.542102056061683, -68.091522060908), //
      LatLng(-16.490784288531625, -68.12303688974448), //
      LatLng(-16.501442662929037, -68.12235881673196), //
      LatLng(-16.501428880547152, -68.13307991857957), //
      LatLng(-16.489490149590786, -68.14343407440298), //
      LatLng(-16.498816798787395, -68.13413061673207), //
      LatLng(-16.527462648639606, -68.14868924556686), //
      LatLng(-16.491718102734758, -68.11681518974436), //
      LatLng(-16.491053551334925, -68.14430784556752), //
      LatLng(-16.542022962597784, -68.07986450508493), //
      LatLng(-16.49178266470368, -68.19312518789673), //
      LatLng(-16.50630323499877, -68.12720263207329), //
      LatLng(-16.518016451199905, -68.20849384371937), //
      LatLng(-16.502780777563046, -68.1320733878966), //
      LatLng(-16.517598469563463, -68.16315051857926), //
      LatLng(-16.509404977387252, -68.12354018974409), //
      LatLng(-16.49316490318104, -68.14270087440286), //
      LatLng(-16.491972827231386, -68.13378568974441), //
      LatLng(-34.51481571749752, -58.47652397735293), //

      LatLng(-16.50034590966778, -68.12203278974421), //
      LatLng(-16.497585932898172, -68.17439580323807), //
      LatLng(-16.52716803288415, -68.14839557440212), //
      LatLng(-16.522434186377026, -68.11195901673153), //
      LatLng(-16.50008890041033, -68.13439846090874), //
      LatLng(-16.49998887049173, -68.11836071038081), //
      LatLng(-16.56125184757085, -68.0967561431579), //
      LatLng(-16.509341347148645, -68.12795623324364), //
      LatLng(-16.486699058762547, -68.12180481857986), //
      LatLng(-16.52567404743658, -68.11005843207296), //
      LatLng(-16.524470599460468, -68.11044467034527), //
      LatLng(-16.520264726165813, -68.11010328789612), //
      LatLng(-16.497295031554444, -68.17441204301402), //
      LatLng(-16.536404806523002, -68.05083531857883), //
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Banco BNB'),
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
