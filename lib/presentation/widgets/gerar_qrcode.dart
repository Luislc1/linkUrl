import 'package:app/service/api_whatsapp.dart';
import 'package:flutter/material.dart';

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
        await WhatsAppService().gerarQrcode(
          widget.numeroController.text,
          widget.mensagemController.text,
        );
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
