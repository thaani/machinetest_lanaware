import 'package:employeedirectory/employees/models/employees_model.dart';
import 'package:employeedirectory/employees/view/widgets/employee_detail_widget.dart';
import 'package:flutter/material.dart';

class EmployeeTileWidget extends StatefulWidget {
  EmployeeTileWidget({Key? key, required this.data}) : super(key: key);
  Employee data;

  @override
  State<EmployeeTileWidget> createState() => _EmployeeTileWidgetState();
}

class _EmployeeTileWidgetState extends State<EmployeeTileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                EmployeeDetailWidget(singleEmployee: widget.data),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: Image.network(widget.data.profileImage.toString()),
          ),
          title: Expanded(
            child: Text(
              widget.data.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    widget.data.address.city,
                  ),
                  Text(widget.data.address.street),
                ],
              ),
              Row(
                children: [
                  Text(widget.data.address.suite),
                  Text(widget.data.address.zipcode),
                ],
              )
            ]),
          )),
        ),
      ),
    );
  }
}
