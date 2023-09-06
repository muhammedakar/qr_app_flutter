import 'package:flutter/material.dart';
import 'package:qr_app/pages/qr_create_page.dart';
import 'package:qr_app/pages/qr_scan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final List<Widget> _pages = [const QRScanPage(), const QRCreatePage()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_outlined),
              label: "QR Tara",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_outlined), label: "QR Oluştur"),
          ],
        ),
      ),
    );
  }
}
