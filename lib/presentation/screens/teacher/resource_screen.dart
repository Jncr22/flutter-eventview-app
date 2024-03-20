import 'package:flutter/material.dart';
import 'package:eventview_application_1/presentation/widgets/gradien_bacground.dart';
import 'package:eventview_application_1/presentation/widgets/logo_widget.dart';

class ResourceView extends StatelessWidget {
  const ResourceView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el color del AppBar
    final appBarColor = Theme.of(context).appBarTheme.backgroundColor;

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: LogoView(),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RECURSOS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 16),
              const Text(
                'Apartados por ti',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              // Primera tarjeta
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre del Espacio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Cantidad:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          // Tarjeta para la fecha
                          Card(
                            color: appBarColor, // Mismo color que el AppBar
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '0000',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Fecha:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          // Tarjeta para la fecha
                          Card(
                            color: appBarColor, // Mismo color que el AppBar
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '00/00/0000',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors
                                        .white), // Texto blanco para contraste
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Hora:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          // Tarjeta para la hora
                          Card(
                            color: appBarColor, // Mismo color que el AppBar
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '00:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors
                                        .white), // Texto blanco para contraste
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Texto "Ocupados"
              const Text(
                'Ocupados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Segunda tarjeta
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre del Espacio',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Fecha:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          // Tarjeta para la fecha
                          Card(
                            color: appBarColor, // Mismo color que el AppBar
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '00/00/0000',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors
                                        .white), // Texto blanco para contraste
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Hora:',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          // Tarjeta para la hora
                          Card(
                            color: appBarColor, // Mismo color que el AppBar
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '00:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors
                                        .white), // Texto blanco para contraste
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
