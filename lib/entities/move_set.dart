import 'move.dart';

class MoveSet {

  const MoveSet({required this.move, this.repetition,});

  factory MoveSet.fromMap(Map<String, dynamic> data,) {
    return MoveSet(
      move: Move.fromMap(data['move'],),
      repetition: data['repetition'],
    );
  }

  Map<String, dynamic> get asMap => {
    'move': move.asMap,
    'repetition': repetition,
  };

  final Move move;
  final int? repetition;
}