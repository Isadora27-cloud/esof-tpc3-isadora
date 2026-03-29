import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Acceptance Test: Switch patient profile", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // 1. Verificamos se o perfil inicial é o João
    expect(find.text('João'), findsOneWidget);
    print("LOG: Perfil inicial 'João' detectado.");

    // 2. Encontramos o botão de troca e clicamos
    final switchBtn = find.byKey(const Key('switchButton'));
    await tester.tap(switchBtn);
    
    // 3. Aguardamos a animação da interface terminar
    await tester.pumpAndSettle();

    // 4. Verificamos se agora o texto exibido é 'Maria'
    expect(find.text('Maria'), findsOneWidget);
    expect(find.text('João'), findsNothing);
    print("LOG: Sucesso! Perfil alterado para 'Maria'.");
  });
}