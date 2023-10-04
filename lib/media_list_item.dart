// class Media extends StatelessWidget {
//   final Media media;
//   MediaListItem(this.media);

//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       child: new Column(
//         children: <Widget>[
//           new FadeInImage.assetNetwork(
//             placeholder: "assets/img1.png",
//             image: media.getPosterUrl(),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dmi_practica08_200070/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(
                  placeholder: "assets/img1.png",
                  image: media.getbackDropUrl(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                  fadeInDuration: Duration(milliseconds: 100),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 43, 43, 43).withOpacity(0.5),
                    ),
                    constraints: BoxConstraints.expand(height: 55.0),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 30.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          media.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
