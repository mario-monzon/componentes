import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Avatar Page' ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://nacitex.com/wp-content/uploads/noavatar-man-300x300.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('MM'),
              backgroundColor: Colors.amber,
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0, 10.0)
                )
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
              height: 350.0,
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage('https://2.bp.blogspot.com/-nApx_SMi8Jg/Um0KDg0NDjI/AAAAAAAADQo/ddLPJRIBPJI/s1600/nikola-tesla.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}