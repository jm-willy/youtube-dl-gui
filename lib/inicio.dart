import 'package:flutter/material.dart';
import 'package:flutter_application_1/colores.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'home.dart';
import 'ofertas.dart';
import 'perfil.dart';
import 'recibos.dart';
import 'tienda.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0, // índice inicial a 0 para que abra Home primero
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myTopBarColor,
          title: const Text(
            'Cooperativa San Amador',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "Home",
          useSafeArea: true,
          labels: const ["Home", "Ofertas", "Tienda", "Recibos"],
          icons: const [
            Icons.home,
            Icons.local_offer,
            Icons.store,
            Icons.receipt,
          ],
          tabSize: 48,
          tabBarHeight: 56,
          textStyle: const TextStyle(
            fontSize: 15.5,
            color: Color.fromARGB(255, 251, 255, 254), // antes negro
            fontWeight: FontWeight.w800,
          ),
          // antes gris: Color.fromARGB(255, 158, 174, 158)
          tabIconColor: Color.fromARGB(255, 210, 232, 210),
          tabIconSize: 32.0,
          tabIconSelectedSize: 30.0,
          tabSelectedColor: myButtonColor,
          tabIconSelectedColor: const Color.fromARGB(255, 251, 255, 254),
          tabBarColor: const Color.fromARGB(255, 88, 128, 88), //antes blanco
          onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;
            });
          },
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _motionTabBarController,
          children: <Widget>[
            HomePage(),
            OfferPage(),
            TiendaPage(),
            ReceiptPage(),
          ],
        ),
      ),
    );
  }
}
