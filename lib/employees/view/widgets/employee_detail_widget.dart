import 'package:flutter/material.dart';

import '../../models/employees_model.dart';

class EmployeeDetailWidget extends StatelessWidget {
  EmployeeDetailWidget({Key? key, required this.singleEmployee})
      : super(key: key);
  Employee singleEmployee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Center(
        child: Container(
            child: Center(
          child: ListView(
            children: [
              Expanded(child: Image.network(singleEmployee.profileImage)),
              Expanded(
                  child: Text(
                singleEmployee.name.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Divider(),
              Expanded(
                child: Text(
                  singleEmployee.email.toString(),
                ),
              ),
              Divider(),
              Expanded(child: Text(singleEmployee.phone.toString())),
              Divider(),
              Expanded(child: Text(singleEmployee.website.toString())),
              Divider(),
              Expanded(child: Text(singleEmployee.address.city.toString())),
              Divider(),
              Expanded(child: Text(singleEmployee.address.street.toString())),
              Divider(),
              Expanded(child: Text(singleEmployee.address.zipcode.toString())),
            ],
          ),
        )),
      ),
    );
  }
}
