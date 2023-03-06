import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController namaController;
  String gender = "none";
  bool isAi = false;
  bool isAslab = false;
  bool isActive = false;
  bool inResultPage = false;

  @override
  Widget build(BuildContext context) {
    return inResultPage
        ? buildResultPage(context)
        : Scaffold(
            appBar: AppBar(
              title: Text("Formulir"),
            ),
            body: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                buildHeader(context),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Nama",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      hintText: "Nama Panjang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Radio(
                        value: "Laki - Laki",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value ?? "none";
                          });
                        },
                      ),
                      title: Text("Laki - Laki"),
                    ),
                    ListTile(
                      leading: Radio(
                        value: "Perempuan",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value ?? "none";
                          });
                        },
                      ),
                      title: Text("Perempuan"),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Anggota Organisasi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        value: isAi,
                        onChanged: (value) {
                          setState(() {
                            isAi = !isAi;
                          });
                        },
                      ),
                      title: Text("Anggota AI"),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: isAslab,
                        onChanged: (value) {
                          setState(() {
                            isAslab = !isAslab;
                          });
                        },
                      ),
                      title: Text("Anggota Aslab"),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text(
                    "Mahasiswa Aktif",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Switch(
                    value: isActive,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      children: [
        Text("Edit Profil"),
        Expanded(
          child: SizedBox(),
        ),
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              namaController.clear();
              gender = "none";
              isAi = false;
              isAslab = false;
              isActive = false;
            });
          },
          icon: Icon(Icons.cancel_outlined),
          label: Text("Reset"),
        ),
        SizedBox(
          width: 8.0,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide(
              width: 2,
              color: Colors.lightBlueAccent,
            ),
          ),
          onPressed: () {},
          child: Text("Cancel"),
        ),
        SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
          onPressed: () {
            setState(() {
              inResultPage = true;
            });
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }

  Widget buildResultPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Profil"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text("Nama : ${namaController.text}"),
          SizedBox(
            width: 12.0,
          ),
          Text("Jenis Kelamin : ${gender}"),
          SizedBox(
            width: 12.0,
          ),
          Text("Anggota AI : ${isAi}"),
          SizedBox(
            width: 12.0,
          ),
          Text("Anggota Aslab : ${isAslab}"),
          SizedBox(
            width: 12.0,
          ),
          Text("Mahasiswa Aktif : ${isActive}"),
          SizedBox(
            width: 12.0,
          ),
          OutlinedButton(
            onPressed: () {
              setState(() {
                inResultPage = false;
              });
            },
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }
}
