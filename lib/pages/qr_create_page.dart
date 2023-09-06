import 'package:flutter/material.dart';
import 'package:qr_app/widgets/qr_code_wid.dart';

class QRCreatePage extends StatefulWidget {
  const QRCreatePage({super.key});

  @override
  State<QRCreatePage> createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: QRCodeWid(
                data: _controller.text,
              )),
          Expanded(
              flex: 7,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: TextFormField(
                        controller: _controller,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onSaved: (newValue) => _controller.text = newValue!,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Oluştur"),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
