import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeWid extends StatelessWidget {
  final String data;
  const QRCodeWid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 23)],
            borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(55),
        child: Center(
          child: QrImageView(
            data: data,
            gapless: false,
          ),
        ),
      ),
    );
  }
}
