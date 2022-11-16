import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/model/budget.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage>{
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _pilihan;
  DateTime __tanggal = DateTime.now();
  List<String> __tipe = ["Pengeluaran", "Pemasukan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Budget'),
        ),
        drawer: const drawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Beli Crepes",
                        labelText: "Judul ",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(Icons.title),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _judul = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: 15000",
                        labelText: "Nominal ",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(Icons.attach_money),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      keyboardType: TextInputType.number,
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = value! as int;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Nominal harus berupa angka!';
                        }
                        _nominal = int.parse(value);
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    // Input Jenis
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: DropdownButton(
                        value: _pilihan,
                        hint: const Text("Pilih Jenis"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: __tipe
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _pilihan = value ?? "";
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text("Pilih tanggal"),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2099),
                        ).then((date) {
                          //tambahkan setState dan panggil variabel _dateTime.
                          setState(() {
                            __tanggal = date!;
                          });
                        });
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      __tanggal.toString().split(' ')[0],
                      style: const TextStyle(
                        fontSize: 16.0,
                        // color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Budget.addBudget(
                            judul: _judul,
                            nominal: _nominal,
                            jenis: _pilihan,
                            date: __tanggal);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyFormPage()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}