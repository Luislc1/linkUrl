class WhatsAppService {
  Future<Object> gerarLink(String numero, String mensagem) async {
    final numeroLimpo = numero.replaceAll(RegExp(r'\D'), '');
    try {
      if (numeroLimpo.length != 11) {
        throw Exception('Número de telefone inválido');
      }
      if (mensagem.isEmpty) {
        throw Exception('Mensagem inválida');
      }
      final url = Uri.parse(
        "https://wa.me/${numeroLimpo}?text=${Uri.encodeComponent(mensagem)}",
      );
      print(url);
      throw url.toString();
    } catch (e) {
      return (e);
    }
  }

  Future<String> gerarQrcode(String numero, String mensagem) async {
    final link = await gerarLink(numero, mensagem);
    return link as String;
  }
}
