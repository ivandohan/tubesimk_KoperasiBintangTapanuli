class PaymentModel {
  final String? id;
  final String userId;
  final String paymentMethod;
  final String deadline;
  final String cost;
  final String destination;
  final String stationDestination;
  final String carNum;
  final String driverName;
  final String service;
  final bool isComplete;
  final String paidOn;
  final String va;
  final String firstStation;
  final String phone;
  final String date;

  PaymentModel({
    this.id,
    required this.va,
    required this.userId,
    required this.phone,
    required this.paymentMethod,
    required this.deadline,
    required this.cost,
    required this.destination,
    required this.stationDestination,
    required this.firstStation,
    required this.carNum,
    required this.driverName,
    required this.service,
    required this.isComplete,
    required this.paidOn,
    required this.date
  });

  toJson() {
    return {
      "carNumber": carNum,
      "driverName": driverName,
      "cost": cost,
      "deadline": deadline,
      "isComplete": isComplete,
      "method": paymentMethod,
      "paidOn": paidOn,
      "va": va,
      "date": date,
      "destination": destination,
      "stationDestination": stationDestination,
      "firstStation": firstStation,
      "service": service,
      "userId": userId,
      "userPhone": phone,
    };
  }
}
