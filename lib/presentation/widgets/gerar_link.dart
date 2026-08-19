import 'package:app/provider/link_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GerarLink extends StatefulWidget {
  const GerarLink({
    super.key,
    required this.numeroController,
    required this.mensagemController,
    required this.linkProvider,
  });

  final TextEditingController numeroController;
  final TextEditingController mensagemController;
  final LinkProvider linkProvider;

  @override
  State<GerarLink> createState() => _GerarLinkState();
}

class _GerarLinkState extends State<GerarLink> {
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
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color(0xFF053549),
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
