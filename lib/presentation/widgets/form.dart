import 'package:flutter/material.dart';

class FormHome extends StatefulWidget {
  const FormHome({
    super.key,
    required this.numeroController,
    required this.mensagemController,
  });

  final TextEditingController numeroController;
  final TextEditingController mensagemController;

  @override
  State<FormHome> createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Número de telefone',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              child: TextFormField(
                controller: widget.numeroController,
                validator: (value) =>
                    widget.numeroController.text.length != 11 ? 'Número de telefone inválido' : null,
                keyboardType: TextInputType.number,
                maxLength: 11,
                decoration: InputDecoration(
                  hintText: '(64) 99090-9090',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  counterText: '',
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Mensagem',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              child: TextFormField(
                controller: widget.mensagemController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Mensagem',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
