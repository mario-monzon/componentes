import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name  = '';
  String _email = '';
  String _password = '';
  String _date = '';

  List<String> _brands = ['Toyota', 'Opel', 'Nissan', 'Honda', 'Renault', 'Ford', 'Fiat', 'Audi', 'Volkswagen', 'Skoda'];
  String _optSelected = 'Toyota';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Counter ${_name.length}'),
        hintText: 'Hint Text',
        labelText: 'Label Text',
        helperText: 'Helper Text',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (value){
        setState(() => _name = value);
      },

    );
  } // _createInput



  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Email',
          labelText: 'Label Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon( Icons.email )
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },

    );
  } // _createEmail

  Widget _createPassword() {
    return TextField(
      enableInteractiveSelection: false,
      obscureText: true, // Ocultar el texto
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.remove_red_eye),
          icon: Icon( Icons.lock )
      ),
      onChanged: (value){
        setState(() {
          _password = value;
        });
      },

    );
  } // _createPassword


  Widget _createDate( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.date_range),
          icon: Icon( Icons.calendar_today )
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  } // _createDate

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
        context: context,
        locale: Locale('es', 'ES'),
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025)
    );

    if ( picked != null ) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }

  } // _selectDate


  List<DropdownMenuItem<String>> getOptionsDropdown() {

    List<DropdownMenuItem<String>> list = new List();
    
    _brands.forEach( (brand) {
      list.add( DropdownMenuItem(
          child: Text(brand),
          value: brand
      ));

    });

    return list;
  }

  Widget _createDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 20.0),
        Expanded(
          child: DropdownButton(
            value: _optSelected,
            items: getOptionsDropdown(),
            onChanged: (opt){
              setState(() {
                _optSelected = opt;
              });
            },
          ),
        ),
      ],
    );

  } // _createDropdown

  Widget _createPerson() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      subtitle: Text('Email: $_email'),
    );
  }

  _metodo(){

  }

}
