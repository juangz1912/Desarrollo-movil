import 'package:flutter/material.dart';
import 'package:flutter_application_5/controllers/PokemonController.dart';
import 'package:flutter_application_5/models/Pokemon.dart';

class ListViewPokemons extends StatefulWidget {
  const ListViewPokemons({
    super.key,
  });

  @override
  State<ListViewPokemons> createState() => _ListViewPokemonsState();
}

class _ListViewPokemonsState extends State<ListViewPokemons> {
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;
  final PokemonController _controller = PokemonController();
  List<Pokemon> _pokemons = [];
  int _offset = 0;
  Size? size;

  @override
  void initState() {
    super.initState();
    getPokemons();
    _scrollController.addListener(() {
      double max = _scrollController.position.maxScrollExtent;
      double currentPosition = _scrollController.position.pixels;
      if (currentPosition + 300 >= max) {
        if (_loading == true) {
          return;
        } else {
          getPokemons();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: createStack());
  }

  createStack() {
    return Stack(
      children: [createListView(), if (_loading) createLoading()],
    );
  }


  createLoading() {
    double width = size != null ? (size!.width / 2) - 25 : 50;
    return Positioned(
      left: width,
      bottom: 30,
      child: Container(
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const CircularProgressIndicator(
            color: Color.fromARGB(255, 32, 67, 205),
          )),
    );
  }

  ListView createListView() {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        return ListTile(
          dense: true,
          title: Text(_pokemons[index].name),
          subtitle: Text(_pokemons[index].url),
        );
      },
      itemCount: _pokemons.length,
    );
  }

  Future<List<Pokemon>> getPokemons() async {
    _loading = true;
    setState(() {});
    List<Pokemon> pokemos = await _controller.getPokemons(offset: _offset);
    _pokemons.addAll(pokemos);
    _offset += 20;
    _loading = false;
    setState(() {});

    double max = _scrollController.position.maxScrollExtent;
    double currentPosition = _scrollController.position.pixels;
    if (currentPosition + 100 <= max) {
      return pokemos;
    }
    _scrollController.animateTo(
      currentPosition + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
    return pokemos;
  }
}