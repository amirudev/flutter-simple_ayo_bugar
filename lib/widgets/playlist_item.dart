import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/entities/playlist.dart';

class PlaylistItem extends StatelessWidget {

  const PlaylistItem({
    Key? key,
    required this.playList,
    this.onPlaylistSelected,
    this.onDeletePressed,
  }) : super(key: key);

  final MoveSetPlayList playList;
  final ValueChanged<MoveSetPlayList>? onPlaylistSelected;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.pink.withOpacity(0.5,),
      child: Padding(
        padding: const EdgeInsets.all(12.0,),
        child: Row(
          children: [
            Expanded(
              child: Text(
                playList.name,
              ),
            ),
            IconButton(
              onPressed: () => onPlaylistSelected?.call(playList,),
              icon: const Icon(Icons.visibility,),
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete,),
            ),
          ],
        ),
      ),
    );
  }
}