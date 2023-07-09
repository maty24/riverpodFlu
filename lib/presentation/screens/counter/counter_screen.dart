import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

import '../../providers/theme_provider.dart';

//se le pone consumer widget porque es un widget que consume un provider
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  //le pasamos el ref para que pueda leer el provider
  Widget build(BuildContext context, WidgetRef ref) {
    //estoy leyendo el provider
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
              icon: Icon(isDarkmode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                ref
                    .watch(themeNotifierProvider.notifier)
                    //el update es para cambiar el estado
                    .toggleDarkmode();
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            'Valor: $clickCounter',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add),
        ));
  }
}
