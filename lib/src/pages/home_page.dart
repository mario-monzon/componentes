import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.loadData()
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) => ListView( children: _listaItem( snapshot.data, context ) )
    );
  } // _lista

  List<Widget> _listaItem( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];
    data.forEach( ( opt ) {
      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon(  opt['icon']  ),
        trailing: Icon( Icons.arrow_forward_ios_rounded, color: Colors.lightGreen, ),
        onTap: (  ){
          Navigator.pushNamed(context, opt['ruta']);
          /* Metodo de Navegación */
          // final route = MaterialPageRoute(
          //     builder: ( context ) => AlertPage()
          // );
          // Navigator.push(context, route);
        }, //onTap
      );
      opciones..add(widgetTemp)
              ..add( Divider(color: Colors.black54,) );
    });
    return opciones;
  } // _listaItem
}
