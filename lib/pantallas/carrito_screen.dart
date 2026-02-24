import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD0FF),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'MySelfCar',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Cursive',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              
              // 1. RECTÁNGULO MORADO OSCURO CON EFECTO NEÓN
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[900], // Morado oscuro
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purpleAccent, width: 2), // Borde neón
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(150), // Brillo neón externo
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "CARRITO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 2. CONTENEDOR DEL PRODUCTO (Con Neón Morado Bajito)
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // Borde de color morado bajito
                  border: Border.all(color: Colors.purple[300]!, width: 2),
                  // Efecto Neón morado bajito
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(90), // Sombra brillante suave
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        // Lado Izquierdo: Imagen en contenedor interno
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                image: NetworkImage("https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/filtro.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Lado Derecho: Descripción con viñetas de estrella
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0, left: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Filtro de Aceite",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                _itemEstrella("Alta durabilidad"),
                                _itemEstrella("Flujo universal"),
                                _itemEstrella("Precio: \$450 MXN"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Botón "X" en la esquina inferior derecha (dentro del Stack)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.redAccent, size: 28),
                        onPressed: () {
                          // Lógica para quitar artículo
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Artículo eliminado"), backgroundColor: Colors.red),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // 3. BOTÓN DE COMPRAR (Estilo Neón combinando con la paleta)
              Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withAlpha(100),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[800], // Combina con el banner superior
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.purpleAccent, width: 1.5), // Borde suave neón
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Procesando tu compra..."), backgroundColor: Colors.green),
                    );
                  },
                  child: const Text(
                    "COMPRAR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      // NAVBAR IGUAL AL DE BASE (Marcando el índice 1 como activo)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFDCD0FF), 
        selectedItemColor: Colors.purple[800], 
        unselectedItemColor: Colors.black54, 
        currentIndex: 1, // "Carrito" seleccionado
        onTap: (index) {
          if (index == 0) {
            // Regresa al Home si toca "Casa"
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Casa'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        ],
      ),
    );
  }

  // Widget pequeño para reutilizar las viñetas de estrella
  Widget _itemEstrella(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 16),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              texto,
              style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}