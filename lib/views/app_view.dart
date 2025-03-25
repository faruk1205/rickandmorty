import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell
  navigationShell; // ilk yazdığım navigationshell type ı idi ikinci yazdığım ismi
  const AppView({
    super.key,
    required this.navigationShell,
  }); //constructer a ekledik

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        //navigation bar vardı widgetla navigationbartheme yaptık sırf label text style ı için bi tık zor gelebilir
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            }
            return TextStyle(color: Theme.of(context).colorScheme.tertiary);
          }),
        ),

        child: NavigationBar(
          selectedIndex:
              navigationShell
                  .currentIndex, //navigationbar da kaçınci indeskteki sayfa açık
          indicatorColor: Colors.transparent,
          onDestinationSelected:
              navigationShell.goBranch, //index e go branchin indeksini yolladık
          destinations: [
            _menuItem(
              context,
              index: 0,
              currentIndex: navigationShell.currentIndex,
              label: 'karakterler',
              icon: Icons.face,
            ),
            _menuItem(
              context,
              index: 1,
              currentIndex: navigationShell.currentIndex,
              label: 'Favarilerim',
              icon: Icons.bookmark,
            ),
            _menuItem(
              context,
              index: 2,
              currentIndex: navigationShell.currentIndex,
              label: 'Konumlar',
              icon: Icons.location_on,
            ),
            _menuItem(
              context,
              index: 3,
              currentIndex: navigationShell.currentIndex,
              label: 'Bölümler',
              icon: Icons.menu,
            ),
          ],
        ),
      ), //alt kısımdaki navigasyon barı için
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color:
            currentIndex == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
      ), // önce thenme ya sonra color scheme ya ulaştık gibi düşünebilirsin kalıptan bahsediyorum if yapısından değil
      label: label,
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: Text(
        "Rick and Morty",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ], // bu bir liste alıyor sağ kısmındaki ikonları eklemek için ,sol kısım içinse leading kullanırdım
    );
  }
}
