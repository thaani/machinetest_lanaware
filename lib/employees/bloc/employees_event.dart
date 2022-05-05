part of 'employees_bloc.dart';

class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class StoreEmployeesEvent extends EmployeesEvent {}

class EmployeeListingEvent extends EmployeesEvent {}
