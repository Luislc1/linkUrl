import 'package:app/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GerarQrcode extends StatefulWidget {
  const GerarQrcode({
    super.key,
    required this.numeroController,
    required this.mensagemController,
    required this.linkProvider,
  });

  final TextEditingController numeroController;
  final TextEditingController mensagemController;
  final LinkProvider linkProvider;

  @override
  State<StatefulWidget> createState() => _GerarQrcodeState();
}

class _GerarQrcodeState extends State<GerarQrcode> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.numeroController.text.isEmpty ||
            widget.mensagemController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
              content: Text(
                'Preencha todos os campos',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          return;
        }

        widget.linkProvider.gerarLinkProvider(
          widget.numeroController.text,
          widget.mensagemController.text,
        );

        if (!mounted) return;

        if (widget.linkProvider.erro != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
              content: Text(
                widget.linkProvider.erro!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          return;
        }

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('QR Code'),
            content: SizedBox(
              width: 200,
              height: 200,
              child: QrImageView(data: widget.linkProvider.link!, size: 200),
            ),
          ),
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
