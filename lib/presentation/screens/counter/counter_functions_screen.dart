import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clicksCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter Functions')),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clicksCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clicksCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                (clicksCounter == 1) ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(icon: Icons.refresh_outlined, onPressed: () {
              setState(() {
                clicksCounter = 0;
              });
            }),
            const SizedBox(height: 10),
            CustomButton(icon: Icons.plus_one_outlined, onPressed: () {
              setState(() {
                clicksCounter++;
              });
            }),
            const SizedBox(height: 10),
            CustomButton(icon: Icons.exposure_minus_1_outlined, onPressed: () {
              if(clicksCounter == 0) return;
              setState(() {
                clicksCounter--;
              });
            }),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
 final IconData icon;
 final VoidCallback? onPressed;
 

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
