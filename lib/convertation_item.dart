import 'package:_19_convertation/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'db/database.dart';

class ConvertationItem extends StatelessWidget {
  const ConvertationItem(this.convertation, {super.key});

  final Convertation convertation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(convertation),
      child: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: context.read<ItemCubit>().controller1,
                    onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(state.convertation.name1),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: context.read<ItemCubit>().controller2,
                    focusNode: context.read<ItemCubit>().node2,
                    onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(state.convertation.name2),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    db.convertationDao.deleteConvertationById(state.convertation.id);
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(Convertation convertation) : super(ItemState(convertation)) {
    controller1.text = convertation.value1.toString();
    _countSecondController();

    controller1.addListener(_countSecondController);
    controller2.addListener(_countFirstController);
  }
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  final node2 = FocusNode();

  void _countSecondController() {
    if (node2.hasFocus) return;
    final value1 = double.tryParse(controller1.text);
    if (value1 != null) {
      final value2 = value1 * 9 / 5 + 32;
      controller2.text = value2.toString();
    }
  }

  void _countFirstController() {
    if (!node2.hasFocus) return;
    final value2 = double.tryParse(controller2.text);
    if (value2 != null) {
      final value1 = (value2 - 32) * 5 / 9;
      controller1.text = value1.toString();
    }
  }
}

class ItemState {
  const ItemState(this.convertation);
  final Convertation convertation;
}

final formulaList = [];
