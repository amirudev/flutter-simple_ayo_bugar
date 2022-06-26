import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/data/available_moves.dart';
import 'package:simple_ayo_bugar/entities/move.dart';
import 'package:simple_ayo_bugar/entities/move_set.dart';
import 'package:simple_ayo_bugar/widgets/move_set_item.dart';

class MoveListPage extends StatelessWidget {

  const MoveListPage({
    Key? key,
    this.onMoveSelected,
    this.moveSets,
  }) : super(key: key);

  final ValueChanged<Move>? onMoveSelected;
  final List<MoveSet>? moveSets;

  @override
  Widget build(BuildContext context) {

    final moveSets = this.moveSets ?? Moves.allMoveSets;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Gerakan",),
      ),
      body: ListView.separated(
        itemBuilder: (_, index,) {
          final moveSet = moveSets[index];
          return MoveSetItem(
            moveSet: moveSet,
            onMoveSelected: onMoveSelected,
          );
        },
        separatorBuilder: (_, __,) => const SizedBox(
          height: 12.0,
        ),
        itemCount: moveSets.length,
      ),
    );
  }
}