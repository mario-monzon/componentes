import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Alert Page' ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          onPressed: () => _showAlert(context),
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.arrow_back_rounded),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
  
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
      barrierDismissible: false,
      builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
            title: Text('Título'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido de la caja de Alerta'),
                FlutterLogo(size: 50.0,)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')
              ),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Ok')
              ),
            ],
          );
      }
    );
  }
}
