import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final double price;
  final int stock;
  final String manufacturer;

  const MenuItem( {
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon,
    required this.price, 
    required this.stock, 
    required this.manufacturer
    });
}

const appMenuItems = <MenuItem>[

    MenuItem( //Se crea una lista de objetos de tipo MenuItem que sirve para crear el menu de la app
    title: 'Ibuprofeno', 
    subtitle: 'Ibucalm 50mg/g - Gel',
    price: 10.99,  // Agregando el precio
    stock: 100,    // Agregando la cantidad en stock
    manufacturer: 'Bayern',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.local_pharmacy,
    
    ),

    MenuItem(
    title: 'Paracetamol', 
    subtitle: '500mg', 
    price: 15.99,  // Agregando el precio
    stock: 50,    // Agregando la cantidad en stock
    manufacturer: 'Pfizer',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Omeprazol cinfa', 
    subtitle: '40mg', 
    price: 9.99,  // Agregando el precio
    stock: 28,    // Agregando la cantidad en stock
    manufacturer: 'Cinfa',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Sulpirida', 
    subtitle: '50mg', 
    price: 23.50,  // Agregando el precio
    stock: 30,    // Agregando la cantidad en stock
    manufacturer: 'KernPharma',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    
    MenuItem(
    title: 'Trankimazin', 
    subtitle: '0.50mg', 
    price: 30.45,  // Agregando el precio
    stock: 30,    // Agregando la cantidad en stock
    manufacturer: 'Viatris',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

MenuItem(
    title: 'Feliben', 
    subtitle: '0.35mg', 
    price: 69.99,  // Agregando el precio
    stock: 10,    // Agregando la cantidad en stock
    manufacturer: 'Gebro Pharma',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Arcoxia', 
    subtitle: '60mg', 
    price: 15.99,  // Agregando el precio
    stock: 28,    // Agregando la cantidad en stock
    manufacturer: 'Organon',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

    MenuItem(
    title: 'Fosfocina', 
    subtitle: '500mg', 
    price: 19.99,  // Agregando el precio
    stock: 24,    // Agregando la cantidad en stock
    manufacturer: 'ERN',  // Agregando el fabricante
    link: '/tratamientos2', 
    icon: Icons.medication
    ),

];


class FrecuenciaMenuItem {
  final String title;
  final String link;
  final IconData icon;


  const FrecuenciaMenuItem({
    required this.title,
    required this.link,
    required this.icon,
  });
}

const FrecuenciaAppMenuItems = <FrecuenciaMenuItem>[
  FrecuenciaMenuItem(
    title: '1 vez al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: '2 veces al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: '3 veces al dia',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: 'Prefiero no ser alertado de la toma',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
  FrecuenciaMenuItem(
    title: 'Personalizar alarma',
    link: '/tratamientos3',
    icon: Icons.medication,
  ),
];



class TratamientoMenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;
  final double price;
  final int stock;
  final String manufacturer;

  const TratamientoMenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
    required this.price,
    required this.stock,
    required this.manufacturer,
  });
}

const tratamientoMenuItems = <TratamientoMenuItem>[
  TratamientoMenuItem(
    title: 'Ibuprofeno',
    subtitle: 'Ibucalm 50mg/g - Gel',
    price: 10.99,
    stock: 100,
    manufacturer: 'Bayern',
    link: '/tratamientos2',
    icon: Icons.local_pharmacy,
  ),
  TratamientoMenuItem(
    title: 'Paracetamol',
    subtitle: '500mg',
    price: 15.99,
    stock: 50,
    manufacturer: 'Pfizer',
    link: '/tratamientos2',
    icon: Icons.medication,
  ),
  TratamientoMenuItem(
    title: 'Omeprazol cinfa',
    subtitle: '40mg',
    price: 9.99,
    stock: 28,
    manufacturer: 'Cinfa',
    link: '/tratamientos2',
    icon: Icons.medication,
  ),
  TratamientoMenuItem(
    title: 'Sulpirida',
    subtitle: '50mg',
    price: 23.50,
    stock: 30,
    manufacturer: 'KernPharma',
    link: '/tratamientos2',
    icon: Icons.medication,
  ),
];
