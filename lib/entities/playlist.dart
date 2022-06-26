import 'move_set.dart';

class MoveSetPlayList {

  const MoveSetPlayList({
    required this.name, required this.moveSets,
  });

  factory MoveSetPlayList.fromMap(Map<String, dynamic> data,) {
    final List moveSetsData = data['moveSets'];
    return MoveSetPlayList(
      name: data['name'],
      moveSets: moveSetsData.whereType<Map<String, dynamic>>().map(
        (e) => MoveSet.fromMap(e,),
      ).toList(),
    );
  }

  Map<String, dynamic> get asMap => {
    'name': name,
    'moveSets': moveSets.map((e) => e.asMap,).toList(),
  };

  final String name;
  final List<MoveSet> moveSets;
}