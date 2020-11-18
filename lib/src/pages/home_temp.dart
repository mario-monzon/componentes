
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'Nueve'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  // Lista de Widgets de tamaño dinámico.
  //Añade un ListTile seguido de un Divider como separacin entre items de la lista
  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();
    for( String opt in opciones ){
      final tempWidget = ListTile(
        title: Text(opt),
        subtitle: Text('SubTítulo'),
      );

      lista..add( tempWidget )
           ..add( Divider(
             height: 5.0,
             color: Colors.black54,
           ));
    }
    return lista;
  } // _crearItems


  List<Widget> _crearItemsCorta(){

    // var widgets = opciones.map( ( item ){
    return opciones.map( ( item ){
      return Column(
        children: [
          ListTile(
            title: Text( item + ' !!' ),
            subtitle: Text('SubTítulo !!'),
            trailing: Icon(
              Icons.call,
              color: Colors.lightGreen,
            ),
            leading: Icon(
              Icons.account_circle,
              color: Colors.blueAccent,
            ),
            onTap: (){},
          ),
          Divider(
            height: 1.0,
            color: Colors.black54,
          )
        ],
      );
    }).toList();

    // return widgets;

  } // _crearItemsCorta

}

