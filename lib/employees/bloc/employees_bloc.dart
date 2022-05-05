import 'package:bloc/bloc.dart';
import 'package:employeedirectory/employees/models/employees_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
      if (event is EmployeesEvent) {
        final CollectionReference employees =
            await FirebaseFirestore.instance.collection('EmployeeCollection');
        final response = await http.get(Uri.parse(
            'https://run.mocky.io/v3/d2f09150-6abe-485d-ad5e-477d480c7a71'));
        print(response);
        final dynamic jsonResponse = await jsonDecode(response.body);
        // print(jsonResponse);
        for (var element in jsonResponse) {
          final val = await employees.add(element);
        }
      }

      if (event is EmployeeListingEvent) {
        final CollectionReference emoloyeeData =
            await FirebaseFirestore.instance.collection('EmployeeCollection');
        final data = await emoloyeeData.get();
        print(data);
        try {
          await Future.forEach(
            data.docs,
            (QueryDocumentSnapshot<Object?> element) {
              empList.add(
                Employee.fromJson(element.data() as Map<String, dynamic>),
              );
            },
          );
        } catch (error) {
          print("catch in driverWithinRangeStream, Error:$error");
        }

        emit(EmployeeListingState(data: empList));
      }
    });
  }
}
