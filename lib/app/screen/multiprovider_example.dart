import 'package:flutter/material.dart';
import 'package:learn_provider/app/provider/example_provider.dart';
import 'package:provider/provider.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multiprovider"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Example2Provider>(
            builder: (context, value, child) {
              return Slider(
                thumbColor: Colors.grey,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                min: 0.0,
                max: 1.0,
                divisions: 2,
                value: value.value,
                onChanged: (val) {
                  value.setvalue(val);
                },
              );
            },
          ),
          Consumer<Example2Provider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: const Center(
                        child: Text("Container 2"),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
