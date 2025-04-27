import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // Gradiente com cores
          gradient: LinearGradient(
            colors: [
              Color(0xFF0073BC),
              Color(0xFF002D62),
            ], // Azul mais claro para azul escuro
          ),
        ),
        child: Stack(
          children: [
            // Conteúdo central em uma coluna
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(size: 100),
                  const SizedBox(height: 20), // Espaço entre o logo e o texto
                  Text(
                    'Floxi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Texto de copyright no canto inferior esquerdo
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                '© 2025 Prisma Technologies by Márcio Silva',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
