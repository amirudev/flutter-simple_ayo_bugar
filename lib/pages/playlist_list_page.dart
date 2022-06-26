import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ayo_bugar/data/playlist_repository.dart';
import 'package:simple_ayo_bugar/entities/move_set.dart';
import 'package:simple_ayo_bugar/entities/playlist.dart';
import 'package:simple_ayo_bugar/widgets/playlist_item.dart';

class PlaylistListPage extends StatelessWidget {

  const PlaylistListPage({
    Key? key,
    this.onMoveSetsSelected,
  }) : super(key: key);

  final ValueChanged<List<MoveSet>>? onMoveSetsSelected;

  @override
  Widget build(BuildContext context) {

    final repo = context.read<PlayListRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Playlist Gerakan"),
      ),
      body: ChangeNotifierProvider<_PlaylistListBloc>(
        create: (_) => _PlaylistListBloc(repo,),
        child: Builder(
          builder: (context,) {

            final bloc = context.read<_PlaylistListBloc>();
            return Selector<_PlaylistListBloc, List<MoveSetPlayList>>(
              selector: (_, bloc,) => bloc.playlists,
              builder: (context, playlists, __,) => ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                itemBuilder: (_, index,) {
                  final playlist = playlists[index];
                  return PlaylistItem(
                    playList: playlist,
                    onPlaylistSelected: (playlist) {
                      onMoveSetsSelected?.call(playlist.moveSets,);
                    },
                    onDeletePressed: () {
                      bloc.deletePlaylist(playlist,);
                    },
                  );
                },
                separatorBuilder: (_, __,) => const SizedBox(
                  height: 8.0,
                ),
                itemCount: playlists.length,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PlaylistListBloc extends ChangeNotifier {

  _PlaylistListBloc(this._playListRepository,) {
    _loadPlaylists();
  }

  final PlayListRepository _playListRepository;

  final _playlists = <MoveSetPlayList>[];
  List<MoveSetPlayList> get playlists => List.unmodifiable(_playlists,);

  Future<void> deletePlaylist(MoveSetPlayList playList,) async {
    await _playListRepository.deletePlayList(playList,);
    _loadPlaylists();
  }

  void _loadPlaylists() {
    _playListRepository.getAllPlayLists().then(
      (playlists,) {
        if (playlists != null) {
          _playlists.clear();
          _playlists.addAll(playlists,);
          notifyListeners();
        }
      },
    );
  }
}