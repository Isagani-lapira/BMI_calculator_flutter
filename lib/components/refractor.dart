import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    icon: Icons.male,
                    label: 'Male',
                  )),
                  Expanded(
                      child: ReusableCard(
                    icon: Icons.female,
                    label: 'Female',
                  )),
                ],
              ),
            ),
            Expanded(child: ReusableCard()),
            Expanded(child: ReusableCard()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    backgroundColor: const Color(0xFFEB1555),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  IconData? icon;
  String? label;
  ReusableCard({super.key, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color(0xFF1D1E33),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 55.0,
            color: Colors.white,
          ),
          const SizedBox(height: 5.0),
          Text(label ?? '')
        ],
      ),
    );
  }
}
