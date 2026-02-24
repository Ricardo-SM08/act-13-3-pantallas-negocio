import 'package:flutter/material.dart';

class DetallesProductoScreen extends StatelessWidget {
  final Map<String, String> producto;
  final bool esAuto;

  const DetallesProductoScreen({
    super.key,
    required this.producto,
    required this.esAuto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD0FF),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          producto['titulo']!,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withAlpha(26),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(producto['url']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple.withAlpha(51)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Especificación Principal:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.purple[800]),
                    ),
                    const SizedBox(height: 5),
                    Text(producto['spec']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    const Divider(height: 30, thickness: 1),
                    const Text(
                      "Descripción del producto:",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      producto['desc']!,
                      style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: Icon(esAuto ? Icons.phone_in_talk : Icons.shopping_cart_checkout, size: 28),
                  label: Text(
                    esAuto ? "Contactar al Vendedor" : "Comprar Ahora",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(esAuto ? "Iniciando contacto..." : "Agregando al carrito..."),
                        backgroundColor: Colors.purple,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}