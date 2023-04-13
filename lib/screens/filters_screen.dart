import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  const FiltersScreen(this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("filters"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
              onChanged: (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
              title: const Text("Gluten Free"),
              subtitle: const Text("Only include gluten-free meals"),
              value: _glutenFree,
            ),
            SwitchListTile(
              onChanged: (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
              title: const Text("Lactose Free"),
              subtitle: const Text("Only include lactose-free meals"),
              value: _lactoseFree,
            ),
            SwitchListTile(
              onChanged: (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
              title: const Text("Vegan"),
              subtitle: const Text("Only include vegan meals"),
              value: _vegan,
            ),
            SwitchListTile(
              onChanged: (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
              title: const Text("Vegetarian"),
              subtitle: const Text("Only include vegetarian meals"),
              value: _vegetarian,
            ),
          ],
        ))
      ]),
    );
  }
}
