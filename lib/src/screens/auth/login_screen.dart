import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alerts_app/src/providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                  controller: provider.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo electrónico',
                  ),
                  style: const TextStyle(height: 0.5)
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: provider.passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Clave',
                ),
                style: const TextStyle(height: 0.5)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: const Size(0, 60)), //El ancho de deja en 0 porque el "expanded" lo define.
                      onPressed: () async {
                        await provider.login(email: provider.emailController.text, password: provider.passwordController.text);
                      },
                      child: const Text("Iniciar Sesión", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home,
                  ),
                  onPressed: (){
                    
                  },
                ),
                TextButton(
                  onPressed: (){
                    
                  },
                  child: Text("¿No tienes cuenta? Registrate!", style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}