import 'dart:developer';

import 'package:employeedirectory/counter/counter.dart';
import 'package:employeedirectory/employees/view/employees_page.dart';
import 'package:flutter/material.dart';
import '/router/router_constants.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case RouteConstants.employeeDetailPageRouter:
        return MaterialPageRoute<MaterialPageRoute>(
            builder: (_) => EmployeesPage());
      default:
        return MaterialPageRoute<MaterialPageRoute>(
            builder: (_) => CounterPage());
    }
  }
}
