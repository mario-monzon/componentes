import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {

  // Detecta cuando el scroll llega a su fin
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loading10();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _loading10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      ),
    );
  }

  Widget _createList(){

    return RefreshIndicator(
      onRefresh: _getPage1,
      child: ListView.builder(
        controller:  _scrollController,
        itemCount: _listNumbers.length,
          itemBuilder: (BuildContext context, int index){

            final imagen = _listNumbers[index];

            return FadeInImage(
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
            );
          }
      ),
    );
    
  } // _createList

  void _loading10(){
    for(int i = 1; i < 10; i++ ){
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {

    });
  } // _loading10

  Widget _createLoading(){

    return ( _isLoading ) ? circularProgressInd() : Container();

  }

  Future<Null> _getPage1() async {
    
    final duration = new Duration( seconds: 2);
    new Timer(duration, (){
      _listNumbers.clear();
      _lastItem++;
      _loading10();
    });

    return Future.delayed(duration);
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState( () { } );

    final _duration = new Duration(seconds: 2);
    return new Timer( _duration, respHTTP);
  } // _fetchData

  void respHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _loading10();
  } // respHTTP

  Widget circularProgressInd(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator()
          ],
        ),
        SizedBox(height: 15.0,)
      ],
    );
  }

}
