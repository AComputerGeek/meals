// @author: Amir Armion
// @version: V.01

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(this._setScreen, {super.key});

  final void Function(String identifier) _setScreen;

  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              _setScreen('meals');
            },
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 22,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              _setScreen('filters');
            },
            leading: Icon(
              Icons.filter_alt,
              size: 25,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 22,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
