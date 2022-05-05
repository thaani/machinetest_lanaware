import 'package:employeedirectory/employees/bloc/employees_bloc.dart';
import 'package:employeedirectory/employees/view/employees_page.dart';
import 'package:employeedirectory/employees/view/widgets/employee_detail_widget.dart';
import 'package:employeedirectory/employees/view/widgets/employee_tile_widget.dart';
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
        print(state);
        if (state is EmployeeListingState) {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              print(query);
              if (state.data[index].name
                  .startsWith(RegExp(query, caseSensitive: false))) {
                return EmployeeTileWidget(data: state.data[index]);
              }

              return Container();
            },
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
