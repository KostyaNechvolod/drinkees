import 'package:flutter/material.dart';
import 'package:drinkees/src/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drinkees/src/models/models.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coctails'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  final CoctailBloc _coctailBloc = CoctailBloc();
  final _scrollThreshold = 200.0;

  _MyHomePageState() {
    _scrollController.addListener(_onScroll);
    _coctailBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _coctailBloc,
      builder: (BuildContext context, CoctailState state) {
        if (state.isInitializing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.isError) {
          return Center(
            child: Text('failed to fetch Coctails'),
          );
        }
        if (state.coctails.isEmpty) {
          return Center(
            child: Text('no Coctails'),
          );
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index >= state.coctails.length
                ? _bottomLoader()
                : _CoctailWidget(state.coctails[index]);
          },
          itemCount: state.hasReachedMax
              ? state.coctails.length
              : state.coctails.length + 1,
          controller: _scrollController,
        );
      },
    );
  }

  @override
  void dispose() {
    _coctailBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _coctailBloc.dispatch(Fetch());
    }
  }

  Widget _CoctailWidget(Coctail coctail) => ListTile(
        leading: SizedBox(
          width: 50.0,
          height: 50.0,
          child: Image.network(
            coctail.strDrinkThumb,
            fit: BoxFit.contain,
          ),
        ),
        title: Text('${coctail.strDrink}'),
        isThreeLine: true,
        subtitle: Text(coctail.idDrink),
        dense: true,
      );

  Widget _bottomLoader() => Container(
        alignment: Alignment.center,
        child: Center(
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
        ),
      );
}
