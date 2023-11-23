import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/tratamientos1.dart';
import 'package:flutter/material.dart';

class Tratamientos2 extends StatelessWidget {
  const Tratamientos2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true, // Alinea el título en el centro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tratamientos1()),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(38.0),
            child: Text(
              'Seleccione frecuencia de toma',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: FrecuenciaAppMenuItems.length,
              itemBuilder: (context, index) {
                final FrecuenciaMenuItem = FrecuenciaAppMenuItems[index];
                return _CustomListTile(FrecuenciaMenuItem: FrecuenciaMenuItem);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.FrecuenciaMenuItem,
  });

  final FrecuenciaMenuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(FrecuenciaMenuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(FrecuenciaMenuItem.title),
      onTap: () {
        Navigator.pushNamed(context, FrecuenciaMenuItem.link);
      },
    );
  }
}
