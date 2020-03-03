// 1. Import the classes
//2. List Of Employees
//3. Stream Controller
        // a. Sink means data is going to stream controller
        // b. Stream means data is coming out of Stram Controller
        //c.  Stram Controller is Just Like a Pipe
//4. Stream Controller
// 5. Stream Sink Getter
//6. Constructor -add Data -Listen To Changes
//7. Core Functions
//8. Dispose == Calling Up The Stream And Freeup The Resource

import 'dart:async';
import 'Employee.dart';
//Dependent on Pojo Class


class EmployeeBloc
{
  List<Employee> _employeeList =  [

    Employee(1,"First Employee",5000.0),
    Employee(2,"Second Employee",7000.0),
    Employee(3,"Third Employee",5800.0),
    Employee(4,"Fourth Employee",9400.0),
    Employee(5,"Fifth Employee",2700.0),
  ];

  // 4. Stream Controller Class
  final _employeeListStreamController = StreamController<List<Employee>>();

// For Increment Class
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();

// For Decrement
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();


  // 5. Getters

  //Stream For Getting the Data from Stream Controller
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  //Sink to add data
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  //Sink For Increment and Decrement

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;


  EmployeeBloc()
  {
    _employeeListStreamController.add(_employeeList);

    // Now Listen To Changes In Data

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);


  }


  _incrementSalary(Employee employee)
  {
    double salary = employee.salary;
    double incrementedSalary = salary* 20/100;

    _employeeList[employee.id -1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee)
  {
    double salary = employee.salary;
    double decrementedSalary = salary* 20/100;

    _employeeList[employee.id -1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }


  void dispose()
  {
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }




}