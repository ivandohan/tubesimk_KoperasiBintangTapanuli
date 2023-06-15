import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/constants/sizes.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/dashboard_screen.dart';
import 'package:tubesimk_koperasibintangtapanuli/src/cores/screens/dashboard/widgets/dashboard_appbar.dart';

class CustomerCareScreen extends StatefulWidget {
  CustomerCareScreen({super.key});

  @override
  State<CustomerCareScreen> createState() => _CustomerCareScreenState();
}

class _CustomerCareScreenState extends State<CustomerCareScreen> {

  var statusList = [
    "Keluhan",
    "Pertanyaan dan pesan",
  ];

  String selectedStatus =  (Get.arguments == null) ? "Pertanyaan dan pesan" : Get.arguments;

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Hubungi Kami",
                  style: txtTheme.headline4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Sampaikan pesan dan keluhan anda melalui form ini. Anda akan mendapatkan notifikasi untuk balasan pesan Anda.",
                  style: txtTheme.bodyText2,
                ),
                const SizedBox(height: 20,),
                Text(
                  "Jenis Pesan",
                  style: txtTheme.headline6,
                ),
                const SizedBox(height: 5,),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                  ),
                  validator: (value) => value == null ? "Select a country" : null,
                  value: selectedStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                  items: statusList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10,),
                Text(
                  "Form",
                  style: txtTheme.headline6,
                ),
                const SizedBox(height: 5,),
                TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.textsms),
                      labelText: "Nama anda",
                      hintText: "Masukkan nama anda..."
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      isDense: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.textsms),
                        labelText: "Pesan anda",
                        hintText: "Masukkan isi pesan anda..."
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                if(selectedStatus == "Keluhan")
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          const SizedBox(width: 10,),
                          Text("Sertakan Bukti (Opsional)"),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        showModalConfirm(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.send_outlined),
                          const SizedBox(width: 10,),
                          Text("Kirim Sekarang"),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showModalConfirm(context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 250,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Terima kasih",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 25,),
                Text(
                  "Pesan kamu sudah kami terima. Notifikasi akan muncul saat kamu menerima balasan.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => DashboardScreen()),
                    child: Text(
                      "Kembali"
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}
