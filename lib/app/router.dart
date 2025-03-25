//go router paketini terminalden ekledik bu dosyayı biz oluşturduk
//go routerı kullanma amcı appbar ve navigation barı sayfa geçişlerinde sabit kalmasını sağlamak

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/characters_views.dart';
import 'package:rickandmorty/views/favourites_view.dart';
import 'package:rickandmorty/views/locations_view.dart';
import 'package:rickandmorty/views/sections_views.dart';

final _routerKey =
    GlobalKey<
      NavigatorState
    >(); //global key tanımlamasının nedeni gereksiz state yenilenmesinin önüne geçmek

class AppRoutes {
  AppRoutes._(); // nesne oluşmasını engellemek için

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) => AppView(
            navigationShell: navigationShell,
          ), //navigation shell navigationbarın hangi sayfasında olduğumuzu tutuyor
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => const CharactersViews(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => const FavouritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsViews(),
            ),
          ],
        ),
      ],
    ),
  ],
);
