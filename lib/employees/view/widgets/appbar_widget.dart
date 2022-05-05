import 'package:employeedirectory/employees/view/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text('Employees directory'),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              showSearch<dynamic>(
                context: context,
                delegate: CustomSearch(),
              );
            },
          ),
        ),
      ],
    );
  }
}
