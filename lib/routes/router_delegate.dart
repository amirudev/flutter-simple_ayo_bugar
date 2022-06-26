import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/entities/move.dart';
import 'package:simple_ayo_bugar/pages/add_playlist_page.dart';
import 'package:simple_ayo_bugar/pages/home_page.dart';
import 'package:simple_ayo_bugar/pages/move_detail_page.dart';
import 'package:simple_ayo_bugar/pages/move_list_page.dart';
import 'package:simple_ayo_bugar/pages/playlist_list_page.dart';
import 'package:simple_ayo_bugar/routes/page_config.dart';

class ABRouterDelegate
    extends RouterDelegate<ABPageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ABPageConfiguration> {

  ABRouterDelegate(): navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    return Navigator(
      key: navigatorKey,
      pages: [
        ..._pages,
      ],
      onPopPage: (route, popResult,) {
        final settings = route.settings;
        log(
          const JsonEncoder.withIndent('\t',).convert(
            {
              'settings': {
                'name': settings.name,
                'arguments': settings.arguments?.toString(),
              },
              'popResult': popResult?.toString(),
            },
          ),
          name: "Navigator.onPopPage",
        );
        if (settings.name == "/") {
          return false;
        }
        return route.didPop(popResult,);
      },
    );
  }

  @override
  Future<bool> popRoute() {
    log(
      currentConfiguration?.toString() ?? "-",
      name: "RouterDelegate.popRoute",
    );
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
    }
    return SynchronousFuture(true,);
  }

  @override
  Future<void> setNewRoutePath(ABPageConfiguration configuration) async {
    log(
      configuration.toString(),
      name: "RouterDelegate.setNewRoutePath",
    );
    return SynchronousFuture(null,);
  }

  @override
  ABPageConfiguration? get currentConfiguration => ABPageConfiguration();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  late final List<Page> _pages = [
    MaterialPage(
      key: const ValueKey("/home",),
      name: "/home",
      child: HomePage(
        onGoToAddPlayList: () {
          _pages.add(
            const MaterialPage(
              key: ValueKey("/add-playlist",),
              name: "/add-playlist",
              child: AddPlaylistPage(),
            ),
          );
          notifyListeners();
        },
        onGoToMoveList: () {
          _pages.add(
            MaterialPage(
              key: const ValueKey("/move-list",),
              name: "/move-list",
              child: MoveListPage(
                onMoveSelected: (move) {
                  _move = move;
                  _pages.add(
                    MaterialPage(
                      key: ValueKey("/move/${_move!.name}"),
                      name: "/move/${_move?.name}",
                      child: MoveDetailPage(
                        move: _move!,
                      ),
                    ),
                  );
                  notifyListeners();
                },
              ),
            ),
          );
          notifyListeners();
        },
        onGoToPlayLists: () {
          _pages.add(
            MaterialPage(
              key: const ValueKey("/playlists",),
              name: "/playlists",
              child: PlaylistListPage(
                onMoveSetsSelected: (moveSets) {
                  _pages.add(
                    MaterialPage(
                      key: const ValueKey("/move-list",),
                      name: "/move-list",
                      child: MoveListPage(
                        onMoveSelected: (move) {
                          _move = move;
                          _pages.add(
                            MaterialPage(
                              key: ValueKey("/move/${_move!.name}"),
                              name: "/move/${_move?.name}",
                              child: MoveDetailPage(
                                move: _move!,
                              ),
                            ),
                          );
                          notifyListeners();
                        },
                        moveSets: moveSets,
                      ),
                    ),
                  );
                  notifyListeners();
                },
              ),
            ),
          );
          notifyListeners();
        },
      ),
    ),
  ];

  Move? _move;
}