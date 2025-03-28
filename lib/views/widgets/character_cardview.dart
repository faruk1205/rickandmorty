import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';

class CharacterCardview extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterCardview({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        // sağ üsteki arşivle/fav butonu için row falan kullansam cardımın yapısını bozabilirdim bozmamak için stack kullandım sayesinde üst üste bileşenler koyabiliyorum.nasıl yaptık? containerı column ile kapladık daha sonra bunu stack ile değiştirdik
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                ClipRRect(
                  //resmin köşelerini ovalleştirmek için cliprrect kullanıyorum(widgetladık)
                  borderRadius: BorderRadius.circular(
                    6,
                  ), //cliprrect ten sonra ovalleştirmek için asıl işlem budur
                  child: Image.network(characterModel.image, height: 100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        characterModel.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _infoWidget(
                        type: 'Köken',
                        value: characterModel.origin.name,
                      ),
                      const SizedBox(height: 4),
                      _infoWidget(
                        type: 'Durum',
                        value:
                            '${characterModel.status} - ${characterModel.species}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
        ],
      ),
    );
  }

  Column _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),

        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
