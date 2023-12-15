import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = new TextEditingController();
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    print(barcodeScanRes);
    setState(() {
      textController.text = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN-PORTAL'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.analytics),
          ),
          InkWell(
            onTap: () {
              scanBarcodeNormal();
            },
            child: Icon(Icons.qr_code_scanner),
          )
        ]),
      ),
    );
  }
}
