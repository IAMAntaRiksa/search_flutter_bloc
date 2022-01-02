import 'package:flutter/material.dart';

class WidgetState {
  static Widget empatyState(BuildContext context) {
    return ClipRRect(
      child: Center(
        child: Image.asset(
          'assets/images/empaty.png',
          height: 500,
          width: 500,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  static Widget errorLoading(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'))
      ],
    );
  }

  static Widget loading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
