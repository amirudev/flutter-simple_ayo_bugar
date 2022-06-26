import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    Key? key,
    this.onGoToMoveList,
    this.onGoToAddPlayList,
    this.onGoToPlayLists,
  }) : super(key: key);

  final VoidCallback? onGoToMoveList;
  final VoidCallback? onGoToAddPlayList;
  final VoidCallback? onGoToPlayLists;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onGoToMoveList,
              child: const Text("Daftar Gerakan",),
            ),
            ElevatedButton(
              onPressed: onGoToAddPlayList,
              child: const Text("Tambah Playlist",),
            ),
            ElevatedButton(
              onPressed: onGoToPlayLists,
              child: const Text("Daftar Playlist",),
            ),
          ],
        ),
      ),
    );
  }
}