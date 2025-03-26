import 'package:flutter/material.dart';
import 'package:rickandmorty/views/widgets/character_cardview.dart';

class CharactersViews extends StatelessWidget {
  const CharactersViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              _searchInputWidget(context),
              const CharacterCardview(
                image:
                    'https://rickandmortyapi.com/api/character/avatar/337.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth - (C137)',
                status: 'Yaşıyor',
                type: 'insan',
              ),
              const CharacterCardview(
                image:
                    'https://rickandmortyapi.com/api/character/avatar/337.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth - (C137)',
                status: 'Yaşıyor',
                type: 'insan',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakterlerde ara',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(
            Icons.search,
          ), //prefixicon değilde sadece prefix dediğim vakit yazmak için field a basınca gözüküyordu
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
