import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import 'home.dart';
import 'login.dart';
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 190, 228, 164),
          title: const Text('Cooperativa San Amador'),
          automaticallyImplyLeading: false,
          actions: [
            // Icono de perfil en lugar del menú hamburguesa
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                // Navegar a la página de perfil cuando se presione el icono
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                userLogged = false;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
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
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.grey,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: const Color.fromARGB(255, 190, 228, 164),
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
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
