import 'package:_19_convertation/convertation_item.dart';
import 'package:flutter/material.dart';

import 'db/database.dart';
import 'main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertation'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: db.convertationDao.watchAllConvertations(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 0),
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 8),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final convertation = snapshot.data![index];
                  return ConvertationItem(
                    key: ValueKey(convertation.id),
                    convertation,
                  );
                },
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const _Floating(),
    );
  }
}

class _Floating extends StatelessWidget {
  const _Floating();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          builder: (context) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0).copyWith(right: 80),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Celsius',
                          name2: 'Fahrenheit',
                          value1: 0,
                          value2: 0,
                          formula: 0,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    title: const Text('Celsius-Fahrenheit'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Kilometer',
                          name2: 'Mile',
                          value1: 0,
                          value2: 0,
                          formula: 1,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Kilometer-Mile'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Kilogram',
                          name2: 'Pound',
                          value1: 0,
                          value2: 0,
                          formula: 2,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Kilogram-Pound'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Liter',
                          name2: 'Gallon',
                          value1: 0,
                          value2: 0,
                          formula: 3,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Liter-Gallon'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Meter',
                          name2: 'Yard',
                          value1: 0,
                          value2: 0,
                          formula: 4,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Meter-Yard'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Square meter',
                          name2: 'Square yard',
                          value1: 0,
                          value2: 0,
                          formula: 5,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Square meter-Square yard'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Cubic meter',
                          name2: 'Cubic yard',
                          value1: 0,
                          value2: 0,
                          formula: 6,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Cubic meter-Cubic yard'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Square meter',
                          name2: 'Square foot',
                          value1: 0,
                          value2: 0,
                          formula: 7,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Square meter-Square foot'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Joules',
                          name2: 'Calories',
                          value1: 0,
                          value2: 0,
                          formula: 8,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Joules-Calories'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  ListTile(
                    onTap: () {
                      db.convertationDao.insertConvertation(
                        Convertation(
                          id: UniqueKey().toString(),
                          name1: 'Meters per second',
                          name2: 'Miles per hour',
                          value1: 0,
                          value2: 0,
                          formula: 9,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    title: const Text('Meters per second - Miles per hour'),
                    trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
