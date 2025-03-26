import 'package:flutter/material.dart';

class CharacterCardview extends StatelessWidget {
  final String image;
  final String name;
  final String origin;
  final String status;
  final String type;

  const CharacterCardview({
    super.key,
    required this.image,
    required this.name,
    required this.origin,
    required this.status,
    required this.type,
  });

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
                  child: Image.network(image, height: 100),
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
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _infoWidget(type: 'Köken', value: origin),
                      const SizedBox(height: 4),
                      _infoWidget(type: 'Durum', value: '$status - $type'),
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
