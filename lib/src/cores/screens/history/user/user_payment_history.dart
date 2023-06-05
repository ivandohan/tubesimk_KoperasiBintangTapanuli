import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/controllers/user_profile_controller.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/models/user_model.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_appbar.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_navbar.dart';

class UserPaymentHistory extends StatefulWidget {
  UserPaymentHistory({super.key, required this.args});

  var args;

  @override
  State<UserPaymentHistory> createState() => _UserPaymentHistoryState();
}

class _UserPaymentHistoryState extends State<UserPaymentHistory> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: DashboardAppBar(),
        drawer: DashboardNavbar(args: widget.args,),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Riwayat Pemesanan",
                style: txtTheme.headline2,
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("Orders")
                      .where("userId", isEqualTo: widget.args)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (snapshot.data!.docs[index].data()['isComplete'].toString() == "true")
                                ? Colors.black87.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(
                                snapshot.data!.docs[index].data()['date']
                                    .toString()),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(snapshot.data!.docs[index]
                                    .data()['destination'].toString()),
                                const SizedBox(height: 10,),
                                Text(snapshot.data!.docs[index]
                                    .data()['driverName'].toString()),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}