import 'package:flutter/material.dart';
import 'package:learn_provider/app/provider/counter_provider.dart';
import 'package:learn_provider/app/screen/favouriteScreen/favourite_screen.dart';
import 'package:learn_provider/app/screen/multiprovider_example.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  /* 
 void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        countProvider.countDercreament();
      },
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Provider Statmanagement"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CountProvider>(
            builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  countProvider.countIncrement();
                },
                icon: const Icon(Icons.add),
                label: const Text("Increament"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  countProvider.countDecrement();
                },
                icon: const Icon(Icons.close),
                label: const Text("Decreament"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Example2()));
            },
            icon: const Icon(Icons.arrow_right),
            label: const Text("Multiprovider"),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteScreen()));
            },
            icon: const Icon(Icons.arrow_right),
            label: const Text("Favourite App"),
          ),
        ],
      ),
    );
  }
}
