import 'package:bloc/bloc.dart';
import 'package:employeedirectory/employees/models/employees_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  List<Employee> empList = [];
  EmployeesBloc() : super(EmployeesInitial()) {
    on<EmployeesEvent>((event, emit) async {
      final CollectionReference employees =
          await FirebaseFirestore.instance.collection('Employees');
      if (event is EmployeeListingEvent) {
        final data = await employees.get();
        await Future.forEach(
          data.docs,
          (QueryDocumentSnapshot<Object?> element) {
            empList.add(
              Employee.fromJson(element.data() as Map<String, dynamic>),
            );
          },
        );
        emit(EmployeeListingState(data: empList));
      }

      final response = await http.get(Uri.parse(
          'https://run.mocky.io/v3/d2f09150-6abe-485d-ad5e-477d480c7a71'));
      print(response);
      final dynamic jsonResponse = await jsonDecode(response.body);
      print(jsonResponse);
      for (var element in jsonResponse) {
        final val = await employees.add(element);
      }
    });
  }
}
