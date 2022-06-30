import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en  cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate())
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            //Tarjetas Principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
      
            // Slider de péliculas
            MovieSlider( 
              movies: moviesProvider.popularMovies, //populares
              title: 'Populares', //Opcional
              onNextPage: () => moviesProvider.getPopularMovies(), 
            )
      
          ],
        ),
      )
    );
  }
}