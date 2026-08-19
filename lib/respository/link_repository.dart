class LinkRepository {
  String gerarLink(String numero, String mensagem) {
    return 'https://wa.me/$numero?text=${Uri.encodeComponent(mensagem)}';
  }

  String gerarQrcode(String numero, String mensagem) {
    return gerarLink(numero, mensagem);
  }
}
