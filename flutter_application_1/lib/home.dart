import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'login.dart';
import 'ofertas.dart'; // Asegúrate de importar el archivo de la página de ofertas

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
      initialIndex: 1,
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
          backgroundColor:
              const Color.fromARGB(255, 190, 228, 164), // Verde oliva más suave
          title: const Text(''),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.logout, color: Colors.white), // Icono blanco
              onPressed: () {
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
          labels: const ["Dashboard", "Home", "Ofertas", "Settings"],
          icons: const [
            Icons.dashboard,
            Icons.home,
            Icons.local_offer, // Icono para la pestaña de ofertas
            Icons.settings
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor:
              Colors.grey, // Color gris para los íconos no seleccionados
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor:
              const Color.fromARGB(255, 190, 228, 164), // Verde oliva más suave
          tabIconSelectedColor: Colors.white, // Íconos seleccionados en blanco
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
            MainPageContentComponent(
                title: "Dashboard Page", controller: _motionTabBarController!),
            MainPageContentComponent(
                title: "Home Page", controller: _motionTabBarController!),
            const HomePage(title: 'Ofertas'), // Página de ofertas importada
            MainPageContentComponent(
                title: "Settings Page", controller: _motionTabBarController!),
          ],
        ),
      ),
    );
  }
}

class MainPageContentComponent extends StatelessWidget {
  const MainPageContentComponent({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final MotionTabBarController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 190, 228, 164), // Verde oliva más suave
              padding: const EdgeInsets.symmetric(
                  vertical: 18, horizontal: 30), // Mayor padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordes más suaves
              ),
            ),
            onPressed: () => controller.index = 0,
            child: const Text('0 Page',
                style: TextStyle(color: Colors.white)), // Texto en blanco
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 190, 228, 164), // Verde oliva más suave
              padding: const EdgeInsets.symmetric(
                  vertical: 18, horizontal: 30), // Mayor padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordes más suaves
              ),
            ),
            onPressed: () => controller.index = 1,
            child: const Text('1 Page',
                style: TextStyle(color: Colors.white)), // Texto en blanco
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 190, 228, 164), // Verde oliva más suave
              padding: const EdgeInsets.symmetric(
                  vertical: 18, horizontal: 30), // Mayor padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordes más suaves
              ),
            ),
            onPressed: () => controller.index = 2,
            child: const Text('2 Page',
                style: TextStyle(color: Colors.white)), // Texto en blanco
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 190, 228, 164), // Verde oliva más suave
              padding: const EdgeInsets.symmetric(
                  vertical: 18, horizontal: 30), // Mayor padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordes más suaves
              ),
            ),
            onPressed: () => controller.index = 3,
            child: const Text('3 Page',
                style: TextStyle(color: Colors.white)), // Texto en blanco
          ),
        ],
      ),
    );
  }
}
