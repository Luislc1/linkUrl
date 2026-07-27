import 'package:app/service/api_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GerarQrcode extends StatefulWidget {
  const GerarQrcode({
    super.key,
    required this.numeroController,
    required this.mensagemController,
  });

  final TextEditingController numeroController;
  final TextEditingController mensagemController;
  @override
  State<StatefulWidget> createState() => _GerarQrcodeState();
}

class _GerarQrcodeState extends State<GerarQrcode> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final qrcode = await WhatsAppService().gerarQrcode(
          widget.numeroController.text,
          widget.mensagemController.text,
        );

        if (qrcode is String) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('QR Code'),
              content: SizedBox(
                width: 200,
                height: 200,
                child: QrImageView(
                  data: qrcode,
                  size: 20,
                ),
              ),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.qr_code, color: Colors.white),
          SizedBox(width: 5),
          Text(
            'QR Code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
