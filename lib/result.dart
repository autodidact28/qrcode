// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:qr_scanner/qr_scanner.dart';

// class Result extends StatelessWidget {
//   final String code;
//   final Function() closeScreen;
//   const Result({super.key, required this.closeScreen, required this.code});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               closeScreen();
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.black87,
//             )),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             QrImage(data: code, Size: 150, version: QrVersions.auto),
//             Text(
//               "scanned result",
//               style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "$code",
//               style: TextStyle(color: Colors.black87, letterSpacing: 1),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 "Copy",
//                 style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
