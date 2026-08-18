import 'package:app/model/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelUrl', (){
    test('Deve atribuir e ler o número corretamente', (){
     
     //Arange - prepara o objeto
      final url = Url();
      url.numero = '64990909090';

      //Ator - Executa o método
      expect(url.numero, '64990909090');

      //Assert - Valida o resultado
      expect(url.numero, equals('64990909090'));
    });

    test('Deve atribuir e ler a mensagem corretamente', (){
      final url = Url();
      url.mensagem = 'Olá, eu sou o Luis';

      //Ator - Executa o método
      expect(url.mensagem, 'Olá, eu sou o Luis');

      //Assert - Valida o resultado
      expect(url.mensagem, equals('Olá, eu sou o Luis'));
    });
  });
}
