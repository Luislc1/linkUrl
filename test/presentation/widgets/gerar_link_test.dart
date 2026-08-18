import 'package:app/presentation/widgets/gerar_link.dart';
import 'package:app/service/api_whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWhatsAppService extends Mock implements WhatsAppService {}

void main() {
  late TextEditingController numeroController;
  late TextEditingController mensagemController;
  late MockWhatsAppService mockWhatsAppService;

  setUp(() {
    numeroController = TextEditingController();
    mensagemController = TextEditingController();
    mockWhatsAppService = MockWhatsAppService();
  });
  tearDown(() {
    numeroController.dispose();
    mensagemController.dispose();
  });

  Widget buildWidget() {
    return MaterialApp(
      home: Scaffold(
        body: GerarLink(
          numeroController: numeroController,
          mensagemController: mensagemController,
          whatsappService: mockWhatsAppService,
        ),
      ),
    );
  }

  testWidgets('Apresenta snackbar VERDE se o link for gerado com sucesso', (tester,) async {
    
    //Mock sem when  →  retorna null  →  TypeError em runtime
    //Mock com when  →  retorna o que você definiu  →  teste controla o comportamento
    when(() => mockWhatsAppService.gerarLink(any(), any())).thenAnswer((_) async => 'https://linkurl.com/123456');
    // Arrange
    await tester.pumpWidget(buildWidget());
    

    // Act
    await tester.tap(find.byType(ElevatedButton));
    // Processa exatamente 1 frame
    // Usa quando: quer checar um estado intermediário (ex: loading aparecendo)

    // Wait for the snackbar to settle
    await tester.pumpAndSettle();
    // Fica processando frames até a UI parar de mudar
    // Usa quando: tem animação, Future, SnackBar chegando

    // Assert
    expect(find.text('Link gerado com sucesso'), findsOneWidget);
    // Espera que a snackbar apareça
    // Chama o TearDown para limpar memória
  });
}
