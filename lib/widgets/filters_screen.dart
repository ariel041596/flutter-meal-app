import 'package:flutter/material.dart';
import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(
    this.currentFilter,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilter['gluten'];
    _isVegan = widget.currentFilter['vegan'];
    _isVegetarian = widget.currentFilter['vegetarian'];
    _isLactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitch(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        subtitle,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
                'lactose': _isLactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
        // title: Text('${selectedMeal.title}'), --->> or use this syntax
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitch(
                    'Gluten Free',
                    'Only includes gluten free meals',
                    _isGlutenFree,
                    (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitch(
                    'Vegan',
                    'Only includes vegan meals',
                    _isVegan,
                    (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                  _buildSwitch(
                    'Vegetarian',
                    'Only includes vegetarian meals',
                    _isVegetarian,
                    (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitch(
                    'Lactose Free',
                    'Only includes Lactose free meals',
                    _isLactoseFree,
                    (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
