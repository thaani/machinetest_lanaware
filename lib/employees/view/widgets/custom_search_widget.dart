import 'package:employeedirectory/employees/bloc/employees_bloc.dart';
import 'package:employeedirectory/employees/view/employees_page.dart';
import 'package:employeedirectory/employees/view/widgets/employee_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch extends SearchDelegate<dynamic> {
  EmployeesBloc blocInsta = EmployeesBloc();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<EmployeesBloc>(
      create: (context) => blocInsta..add(EmployeeListingEvent()),
      child:
          BlocBuilder<EmployeesBloc, EmployeesState>(builder: (context, state) {
        if (state is EmployeeListingState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (state.data[index].name.startsWith(query) ||
                    state.data[index].email.startsWith(query)) {
                  return EmployeeDetailWidget(
                    singleEmployee: state.data[index],
                  );
                } else {
                  return Container();
                }
              },
              itemCount: state.data.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
