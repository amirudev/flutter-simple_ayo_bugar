import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/widgets/home_page_menu_item.dart';

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
        title: const Text(
          "Halaman Utama",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: HomePageMenuItem(
                title: 'Daftar Gerakan',
                description:
                    'Slog sweep over cow corner back line ball four take a walk goal sports sports trust our processes.',
                imagePath: 'assets/images/crunch_kick.png',
              ),
              onTap: onGoToMoveList,
            ),
            GestureDetector(
              child: HomePageMenuItem(
                title: 'Tambah Playlist',
                description:
                    'Sin bin nothing but net strike 3 youre out, field game of two halves field goaltender lineout goalie.',
                imagePath: 'assets/images/hollow_hold.png',
              ),
              onTap: onGoToAddPlayList,
            ),
            GestureDetector(
              child: HomePageMenuItem(
                title: 'Daftar Playlist',
                description:
                    'Penalty drop goal red card nothing but net alleyoop red card hockey win lose or draw ball four..',
                imagePath: 'assets/images/knee_up.png',
              ),
              onTap: onGoToPlayLists,
            ),
          ],
        ),
      ),
    );
  }
}
