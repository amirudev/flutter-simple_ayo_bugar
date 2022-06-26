import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ayo_bugar/data/available_moves.dart';
import 'package:simple_ayo_bugar/data/playlist_repository.dart';
import 'package:simple_ayo_bugar/entities/move_set.dart';
import 'package:simple_ayo_bugar/entities/playlist.dart';
import 'package:simple_ayo_bugar/widgets/move_set_item.dart';

class AddPlaylistPage extends StatelessWidget {

  const AddPlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final repo = context.read<PlayListRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Playlist",),
      ),
      body: ChangeNotifierProvider<_AddPlaylistBloc>(
        create: (_) => _AddPlaylistBloc(repo,),
        child: Builder(
          builder: (context,) {

            final bloc = context.read<_AddPlaylistBloc>();

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: TextField(
                      controller: bloc.nameController,
                      decoration: const InputDecoration(
                        labelText: "Judul Playlist",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => FocusScope.of(context,).unfocus(),
                      maxLines: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Gerakan Saya",),
                      const SizedBox(height: 12.0,),
                      Expanded(
                        child: Selector<_AddPlaylistBloc, List<MoveSet>>(
                          selector: (_, bloc,) => bloc.selectedMoveSets,
                          builder: (context, moveSets, _,) {

                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              itemBuilder: (_, index,) {
                                final moveSet = moveSets[index];
                                return MoveSetItem(
                                  moveSet: moveSet,
                                  onMoveSetSelected: bloc.removeMoveSet,
                                  icon: const Icon(Icons.remove,),
                                );
                              },
                              separatorBuilder: (_, __,) => const SizedBox(height: 12.0,),
                              itemCount: moveSets.length,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Divider(
                    height: 20.0,
                    thickness: 2.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Gerakan Tersedia",),
                      const SizedBox(height: 12.0,),
                      Expanded(
                        child: Builder(
                          builder: (_,) {
                            const moveSets = Moves.allMoveSets;
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              itemBuilder: (_, index,) {
                                final moveSet = moveSets[index];
                                return MoveSetItem(
                                  moveSet: moveSet,
                                  onMoveSetSelected: bloc.addMoveSet,
                                  icon: const Icon(Icons.add,),
                                );
                              },
                              separatorBuilder: (_, __,) => const SizedBox(height: 12.0,),
                              itemCount: moveSets.length,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context,).unfocus();
                        bloc.save().then(
                          (_) {
                            Navigator.of(context,).pop();
                          },
                        );
                      },
                      child: const Text("Simpan Playlist",),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AddPlaylistBloc extends ChangeNotifier {

  _AddPlaylistBloc(this.playListRepository);

  final PlayListRepository playListRepository;

  late final nameController = TextEditingController(
    text: "Playlist 1",
  );

  final _selectedMoveSets = <MoveSet>[];
  List<MoveSet> get selectedMoveSets => List.unmodifiable(_selectedMoveSets,);

  void addMoveSet(MoveSet moveSet,) {
    _selectedMoveSets.add(moveSet,);
    notifyListeners();
  }

  void removeMoveSet(MoveSet moveSet,) {
    _selectedMoveSets.remove(moveSet,);
    notifyListeners();
  }

  Future<void> save() async {
    final name = nameController.text;
    if (name.isEmpty) {
      return;
    }
    final newPlayList = MoveSetPlayList(
      name: name,
      moveSets: _selectedMoveSets,
    );
    await playListRepository.createPlayList(newPlayList,);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}