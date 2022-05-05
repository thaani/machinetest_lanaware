part of 'employees_bloc.dart';

class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesInitial extends EmployeesState {}

// class StoreEmployeesSuccessState extends EmployeesState {
//   StoreEmployeesSuccessState({required this.data});

//   // List<Product> data;
//   List<Employee> data;
// }

class EmployeeListingState extends EmployeesState {
  const EmployeeListingState({required this.data});

  // List<Product> data;
  final List<Employee> data;
}

// class EmployeeListingState extends EmployeesState {}
