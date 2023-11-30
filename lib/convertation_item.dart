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
            height: 60,
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
      final value2 = formulaList[state.convertation.formula].$1(value1);
      controller2.text = value2.toStringAsFixed(1);
    }
  }

  void _countFirstController() {
    if (!node2.hasFocus) return;
    final value2 = double.tryParse(controller2.text);
    if (value2 != null) {
      final value1 = formulaList[state.convertation.formula].$2(value2);
      controller1.text = value1.toStringAsFixed(1);
    }
  }
}

class ItemState {
  const ItemState(this.convertation);
  final Convertation convertation;
}

const List<(double Function(double), double Function(double))> formulaList = [
  (_celsiusToFahrenheit, _fahrenheitToCelsius),
  (_kilometersToMiles, _milesToKilometers),
  (_kilogramsToPounds, _poundsToKilograms),
  (_litersToGallons, _gallonsToLiters),
  (_metersToYards, _yardsToMeters),
  (_squareMetersToSquareYards, _squareYardsToSquareMeters),
  (_cubicMetersToCubicYards, _cubicYardsToCubicMeters),
  (_squareMetersToSquareFoot, _squareFootToSquareMeters),
  (_joulesToCalories, _caloriesToJoules),
  (_metersPerSecondToMilesPerHour, _milesPerHourToMetersPerSecond),
];

double _celsiusToFahrenheit(double value1) {
  return value1 * 9 / 5 + 32;
}

double _fahrenheitToCelsius(double value2) {
  return (value2 - 32) * 5 / 9;
}

double _kilometersToMiles(double value1) {
  return value1 * 0.621371;
}

double _milesToKilometers(double value2) {
  return value2 / 0.621371;
}

double _kilogramsToPounds(double value1) {
  return value1 * 2.20462;
}

double _poundsToKilograms(double value2) {
  return value2 / 2.20462;
}

double _litersToGallons(double value1) {
  return value1 * 0.264172;
}

double _gallonsToLiters(double value2) {
  return value2 / 0.264172;
}

double _metersToYards(double value1) {
  return value1 * 1.09361;
}

double _yardsToMeters(double value2) {
  return value2 / 1.09361;
}

double _squareMetersToSquareYards(double value1) {
  return value1 * 1.19599;
}

double _squareYardsToSquareMeters(double value2) {
  return value2 / 1.19599;
}

double _cubicMetersToCubicYards(double value1) {
  return value1 * 1.30795;
}

double _cubicYardsToCubicMeters(double value2) {
  return value2 / 1.30795;
}

double _squareMetersToSquareFoot(double value1) {
  return value1 * 10.7639;
}

double _squareFootToSquareMeters(double value2) {
  return value2 / 10.7639;
}

double _joulesToCalories(double value1) {
  return value1 * 0.238846;
}

double _caloriesToJoules(double value2) {
  return value2 / 0.238846;
}

double _metersPerSecondToMilesPerHour(double value1) {
  return value1 * 2.23694;
}

double _milesPerHourToMetersPerSecond(double value2) {
  return value2 / 2.23694;
}
