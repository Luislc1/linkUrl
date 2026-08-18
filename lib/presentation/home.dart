import 'package:app/presentation/widgets/app_bar.dart';
import 'package:app/presentation/widgets/form.dart';
import 'package:app/presentation/widgets/gerar_link.dart';
import 'package:app/presentation/widgets/gerar_qrcode.dart';
import 'package:app/service/api_whatsapp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FormHome(
                numeroController: numeroController,
                mensagemController: mensagemController,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GerarLink(
                    whatsappService: WhatsAppService(),
                    numeroController: numeroController,
                    mensagemController: mensagemController,
                  ),
                  SizedBox(width: 10),
                  GerarQrcode(
                    whatsappService: WhatsAppService(),
                    numeroController: numeroController,
                    mensagemController: mensagemController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
