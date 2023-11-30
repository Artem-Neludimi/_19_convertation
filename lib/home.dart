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
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ConvertationItem(snapshot.data![index]);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db.convertationDao.insertConvertation(
            const Convertation(
              id: '1',
              name1: 'name1',
              name2: 'name2',
              value1: 1,
              value2: 2,
              formula: 3,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
