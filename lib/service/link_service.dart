import 'package:app/respository/link_repository.dart';

class LinkService {
  final LinkRepository _linkRepository;

  LinkService({required this._linkRepository});

  String gerarLinkService(String numero, String mensagem) {
    final numeroLimpo = numero.replaceAll(RegExp(r'\D'), '');

    if (numeroLimpo.length != 11) {
      throw Exception('Número de telefone inválido');
    }
    if (mensagem.isEmpty) throw Exception('Mensagem inválida');
    return _linkRepository.gerarLink(numero, mensagem);
  }

}
