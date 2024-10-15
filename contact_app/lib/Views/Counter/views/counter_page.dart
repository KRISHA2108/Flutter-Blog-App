import 'package:contact_app/Views/Counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterProvider>().reset();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Text((context.watch<CounterProvider>().i).toString()),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: const Icon(Icons.add)),
                FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrement();
                    },
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().x2();
                    },
                    child: const Text('x2')),
                FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().x3();
                    },
                    child: const Text('x3')),
                FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().x4();
                    },
                    child: const Text('x4')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
