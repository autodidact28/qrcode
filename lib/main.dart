import 'package:flutter/material.dart';
import 'package:qr/dashboard.dart';
import 'package:qr/scanner.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    dashboard(),
    Scanner(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin-Portal'),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.analytics), label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.qr_code_scanner), label: 'Scanner'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            CurrentPage = index;
          });
        },
        selectedIndex: CurrentPage,
      ),
    );
  }
}
