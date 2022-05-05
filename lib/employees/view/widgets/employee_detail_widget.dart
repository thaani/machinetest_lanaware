import 'package:flutter/material.dart';

import '../../models/employees_model.dart';

class EmployeeDetailWidget extends StatelessWidget {
  EmployeeDetailWidget({Key? key, required this.singleEmployee})
      : super(key: key);
  Employee singleEmployee;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(singleEmployee.profileImage),
          ),
          ListTile(
            title: Column(children: [
              Expanded(
                child: Text(
                  singleEmployee.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  singleEmployee.email,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  singleEmployee.phone,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  singleEmployee.website,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Column(children: [
                  Text(
                    singleEmployee.address.city,
                  ),
                  Text(singleEmployee.address.street),
                  Text(singleEmployee.address.zipcode),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
