import 'package:app/service/link_service.dart';
import 'package:flutter/material.dart';

class LinkProvider extends ChangeNotifier {
  final LinkService _linkService;

  LinkProvider({required this._linkService});

  String? erro;
  String? link;

  void gerarLinkProvider(String numero, String mensagem) {
    try {
      erro = null;
      link = _linkService.gerarLinkService(numero, mensagem);
      notifyListeners();
    } catch (e) {
      erro = e.toString();
    }
  }
}
