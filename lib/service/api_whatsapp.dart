class WhatsAppService {
  Future<Object> gerarLink(String numero, String mensagem) async {
    try {
      if (numero.length != 15) {
        throw Exception('Número de telefone inválido');
      }
      if (mensagem.isEmpty) {
        throw Exception('Mensagem inválida');
      }
      final url = Uri.parse(
        "https://wa.me/${numero}?text=${Uri.encodeComponent(mensagem)}",
      );
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
