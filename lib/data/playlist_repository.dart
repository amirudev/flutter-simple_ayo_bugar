import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ayo_bugar/entities/playlist.dart';

class PlayListRepository {

  Future<List<MoveSetPlayList>?> getAllPlayLists() async {
    final prefs = await _prefs;
    final keys = prefs.getKeys();
    return keys.map(
      (e) => MoveSetPlayList.fromMap(
        jsonDecode(prefs.getString(e,)!,),
      ),
    ).toList();
  }

  Future<MoveSetPlayList> createPlayList(MoveSetPlayList playList,) async {
    final prefs = await _prefs;
    await prefs.setString(
      playList.name,
      jsonEncode(playList.asMap,),
    );
    return playList;
  }

  Future<MoveSetPlayList?> updatePlayList(MoveSetPlayList playList,) async {
    final prefs = await _prefs;
    if (prefs.containsKey(playList.name,)) {
      await prefs.setString(
        playList.name,
        jsonEncode(playList.asMap,),
      );
      return playList;
    }
    return null;
  }

  Future<void> deletePlayList(MoveSetPlayList playList,) async {
    final prefs = await _prefs;
    await prefs.remove(playList.name,);
  }

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();
}