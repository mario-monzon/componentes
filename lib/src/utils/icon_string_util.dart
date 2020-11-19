import 'package:flutter/material.dart';

final _icons = <String, IconData>{

  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'agriculture'   : Icons.agriculture,
  'input'         : Icons.input,
  'view_carousel' : Icons.view_carousel,
  'list'          : Icons.list

};

Icon getIcon ( String nombreIcono ) => Icon( _icons[nombreIcono], color: Colors.blueAccent, );

