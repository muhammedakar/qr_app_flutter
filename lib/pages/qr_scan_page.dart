import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../services/qr_scan_service.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? urlm;

  QRScanService qrService = QRScanService();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderRadius: 45,
                borderColor: Colors.blue,
                overlayColor: Colors.black.withOpacity(0.9)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: (result != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 5, child: Center(child: Text(urlm!))),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            qrService.launcher(urlm!);
                          },
                          child: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 45,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : const Text('Kodu Taratın'),
          ),
        )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result!.format.name);
        var x = result!.code!.split(' ');
        for (var element in x) {
          if (element.contains('www') ||
              element.contains('https://') ||
              element.contains('http://')) {
            // Kelimenin sonundaki özel karakterleri temizleme işlemi
            final regex = RegExp(r'(https?://|www\.)[^\s]+');
            final Iterable<Match> matches = regex.allMatches(element);
            for (final match in matches) {
              urlm = match.group(0)!;
            }
          } else {
            urlm =
                "https://www.google.com/search?client=safari&rls=en&q=${result!.code!}&ie=UTF-8&oe=UTF-8";
          }
        }
      });
    });
  }
}
