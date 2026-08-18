import 'package:app/service/api_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GerarLink extends StatefulWidget {
  const GerarLink({
    super.key,
    required this.numeroController,
    required this.mensagemController,
    required this.whatsappService,
  });

  final TextEditingController numeroController;
  final TextEditingController mensagemController;
  final WhatsAppService whatsappService;

  @override
  State<GerarLink> createState() => _GerarLinkState();
}

class _GerarLinkState extends State<GerarLink> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final link = await widget.whatsappService.gerarLink(
          widget.numeroController.text,
          widget.mensagemController.text,
        );

        print(link);
        if (!mounted || link is Exception) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
              content: Text(
                textAlign: TextAlign.center,
                link.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                textAlign: TextAlign.center,
                'Link gerado com sucesso',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
        Clipboard.setData(ClipboardData(text: link as String));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.copy, color: Colors.white),
          SizedBox(width: 5),
          Text(
            'Gerar Link',
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
