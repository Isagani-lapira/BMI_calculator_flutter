import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CardsReuse(
                        icon: Icons.male,
                        label: 'Male',
                      ),
                    ),
                    Expanded(
                      child: CardsReuse(icon: Icons.female, label: 'Female'),
                    ),
                  ],
                ),
              ),
              const Expanded(child: CardsReuse()),
              const Expanded(
                child: Row(
                  children: [
                    Expanded(child: CardsReuse()),
                    Expanded(child: CardsReuse()),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    backgroundColor: const Color(0xFFEB1555),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Calculate',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
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

class CardsReuse extends StatelessWidget {
  final IconData? icon; 
  final String? label;
  const CardsReuse({super.key, this.icon, this.label}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 55.0,
            color: Colors.white,
          ),
          Text(label ?? '')
        ],
      ),
    );
  }
}
