import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  TextEditingController textController = new TextEditingController();
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    print(barcodeScanRes);
    setState(() {
      textController.text = barcodeScanRes;
    });
  }

  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "QR-Scanner",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  Text("Place QR in the area"),
                ],
              ),
            ),
            Expanded(
              //logic for scan
              flex: 4,
              child: MobileScanner(
                  allowDuplicates: true, onDetect: (barcode, args) {}),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: const Text(
                "Baad me likhuga",
                style: TextStyle(
                    color: Colors.black87, fontSize: 14, letterSpacing: 1),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const QRscanner(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.toggle();
          isActive = !isActive;
          //    setState((), {});
        },
        child: const Icon(Icons.flash_on),
      ),
    );
  }
}
