import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/phone_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
          listKegiatan: [],
          listKeterangan: [],
          listTglMulai: [],
          listTglSelesai: []),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.listKegiatan,
      required this.listKeterangan,
      required this.listTglMulai,
      required this.listTglSelesai});

  final List listKegiatan;
  final List listKeterangan;
  final List listTglMulai;
  final List listTglSelesai;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: listKegiatan.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 15.0, left: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Stack(children: [
                            Center(
                              child: Icon(
                                Icons.circle,
                                size: 50,
                                color: Colors.purple[700],
                              ),
                            ),
                            Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listKegiatan[index],
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              listKeterangan[index],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                              ),
                              child: const Text(
                                'Work',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              listTglMulai[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              listTglSelesai[index],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TodosAddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
