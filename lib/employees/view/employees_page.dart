import 'package:employeedirectory/counter/counter.dart';
import 'package:employeedirectory/employees/bloc/employees_bloc.dart';
import 'package:employeedirectory/employees/view/widgets/appbar_widget.dart';
import 'package:employeedirectory/employees/view/widgets/employee_detail_widget.dart';
import 'package:employeedirectory/router/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/employees_bloc.dart';

class EmployeesPage extends StatelessWidget {
  EmployeesPage({Key? key}) : super(key: key);
  EmployeesBloc _employeesBloc = EmployeesBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppbarWidget(),
      ),
      body: BlocProvider<EmployeesBloc>(
        create: (context) => _employeesBloc..add(EmployeeListingEvent()),
        child: BlocBuilder<EmployeesBloc, EmployeesState>(
          builder: (context, state) {
            print(state);
            if (state is EmployeeListingState) {
              return Container(
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                EmployeeDetailWidget(
                                    singleEmployee: state.data[index]),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Image.network(
                              state.data[index].profileImage.toString()),
                        ),
                        title: Expanded(
                          child: Text(
                            state.data[index].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Expanded(
                            child: Column(children: [
                          Text(
                            state.data[index].address.city,
                          ),
                          Text(state.data[index].address.street),
                          Text(state.data[index].address.zipcode),
                        ])),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
