import 'package:flutter/material.dart';
import 'package:login_app/presentation/widgets/text_input.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: CustomPaint(
              size: size,
              painter: ShapesPainter(),
            ),
          ),

          // Contenido principal
          Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ), 
                      ),
                      const SizedBox(height: 60),
                      TextInput(hintText: 'Correo'),
                      TextInput(
                        hintText: 'Contraseña',
                        type: TextType.password,
                      ),

                      // Botón ingresar
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Spacer(),

                      // Registro
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("¿No tienes cuenta? "),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Crea una aquí",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Pintor de formas geométricas de fondo
class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ignore: deprecated_member_use
    final paint = Paint()..color = Colors.white.withOpacity(0.08);
    final double spacing = 40;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height / 2; y += spacing) {
        final type = ((x + y) ~/ spacing) % 4;

        switch (type) {
          case 0:
            canvas.drawRect(
                Rect.fromLTWH(x, y, 20, 20), paint); // cuadrado
            break;
          case 1:
            canvas.drawCircle(Offset(x + 10, y + 10), 10, paint); // círculo
            break;
          case 2:
            final path = Path()
              ..moveTo(x, y + 20)
              ..lineTo(x + 10, y)
              ..lineTo(x + 20, y + 20)
              ..close();
            canvas.drawPath(path, paint); // triángulo
            break;
          case 3:
            final path = Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(x, y, 20, 10), const Radius.circular(5)));
            canvas.drawPath(path, paint); // píldora
            break;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

