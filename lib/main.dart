import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileSwitcherPage(),
    );
  }
}

class ProfileSwitcherPage extends StatefulWidget {
  const ProfileSwitcherPage({super.key});
  @override
  State<ProfileSwitcherPage> createState() => _ProfileSwitcherPageState();
}

class _ProfileSwitcherPageState extends State<ProfileSwitcherPage> {
  String currentPatient = "João";

  void switchProfile() {
    setState(() {
      currentPatient = currentPatient == "João" ? "Maria" : "João";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caregiver Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current Profile:', style: TextStyle(fontSize: 18)),
            Text(
              currentPatient, // O teste vai procurar por este texto
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              key: const Key('switchButton'), // Chave para o teste encontrar o botão
              onPressed: switchProfile,
              icon: const Icon(Icons.switch_account),
              label: const Text('Switch Patient'),
            ),
          ],
        ),
      ),
    );
  }
}