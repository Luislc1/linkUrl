class WhatsAppService {
  Future<Object> gerarLink(String numero, String mensagem) async {
    try {
      if (numero.length != 11) {
        return Exception('Número de telefone inválido');
      }
      if (mensagem.isEmpty) {
        return Exception('Mensagem inválida');
      }
      final url = Uri.parse(
        "https://wa.me/${numero}?text=${Uri.encodeComponent(mensagem)}",
      );
      return url.toString();
    } catch (e) {
      return (e);
    }
  }

  Future<void> gerarQrcode(String numero, String mensagem) async {
    final link = await gerarLink(numero, mensagem);
  }
}
