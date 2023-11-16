import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/feature/home/provider/home_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(homeProvider, (_, __) {});
    return Scaffold(
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, index) => Item(index: index),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: List.generate(
      //       2000,
      //       (index) => Item(title: index.toString()),
      //     ),
      //   ),
      // ),
    );
  }
}

class Item extends ConsumerStatefulWidget {
  final int index;
  const Item({
    super.key,
    required this.index,
  });

  @override
  ConsumerState<Item> createState() => _ItemState();
}

class _ItemState extends ConsumerState<Item> {
  late final notifier = ref.read(homeProvider.notifier);
  @override
  Widget build(BuildContext context) {
    final selectedItems =
        ref.watch(homeProvider.select((state) => state.selectedItems));
    return CheckboxListTile(
      value: selectedItems.contains(widget.index),
      title: Text(widget.index.toString()),
      onChanged: (value) {
        value == true
            ? notifier.addItem(widget.index)
            : notifier.removeItem(widget.index);
      },
    );
  }
}
