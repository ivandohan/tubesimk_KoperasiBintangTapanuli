class PaymentModel {
  final String userId;
  final String userName;
  final String paymentMethod;
  final String deadline;
  final String cost;
  final String destination;
  final String stationDestination;
  final String hour;
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
    required this.userId,
    required this.va,
    required this.userName,
    required this.phone,
    required this.paymentMethod,
    required this.deadline,
    required this.hour,
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
      "userId": userId,
      "carNumber": carNum,
      "driverName": driverName,
      "userName": userName,
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
      "userPhone": phone,
      "hour": hour,
    };
  }
}
