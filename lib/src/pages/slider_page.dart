import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 100.0;
  bool _checkboxValue = false;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImg()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {

    return Slider(
      activeColor: Colors.green,
      label: _sliderValue.toString(),
      // divisions: 100,
      value: _sliderValue,
      min: 10.0,
      max: 200.0,
      onChanged: ( _checkboxValue ) ? null : ( value ){
        print( value );
        setState(() {
          _sliderValue = value;
        });
      });
  }

  Widget _createImg() {

    return Image(
      width: _sliderValue * 2,
      fit: BoxFit.contain,
      image: AssetImage('assets/img/world_map.png'),
    );
  }

  Widget _createCheckbox() {

    // return Checkbox(
    //   activeColor: Colors.green,
    //   value: _checkboxValue,
    //   onChanged: ( value ){
    //     setState(() {
    //       _checkboxValue = value;
    //     });
    //   });
    
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      subtitle: Text('Este checkbox bloquea el Slider'),
      activeColor: Colors.green,
      value: _checkboxValue, 
      onChanged: ( _switchValue ) ? null : (value){
        setState(() {
          _checkboxValue = value;
        });
      });
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear CheckBox'),
      subtitle: Text('Este Switch bloquea y desbloquea el CheckBox'),
      value: _switchValue,
      onChanged: (value){
        setState(() {
          _switchValue = value;
        });
      }
    );
  } // _createSwitch

}
