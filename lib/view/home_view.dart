import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/search_view.dart';
import 'package:provider/provider.dart';

import '../services/app_Urls.dart';
import '../services/status.dart';
import '../view_model/movie_view_model.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MOVIEAPP",
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 10),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                minimumSize: WidgetStatePropertyAll(Size(180, 40)),
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.white54,
                    size: 25,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(fontSize: 17, color: Colors.white54),
                  )
                ],
              ),
              // color: Colors.white,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: movieViewModel.getMovieApi(),
        builder: (context, AsyncSnapshot<void> snapshot) =>
            Consumer<MovieViewModel>(
          builder: (context, value, child) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      value.movieList.message.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                );
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CarouselSlider.builder(
                        itemCount: value.movieList.data!.length,
                        itemBuilder: (context, index, realIndex) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedMovieDetailView(
                                    name: value
                                        .movieList.data![index].show!.name
                                        .toString(),
                                    summary: value
                                        .movieList.data![index].show!.summary
                                        .toString(),
                                    image: value.movieList.data![index].show
                                                ?.image?.original !=
                                            null
                                        ? value.movieList.data![index].show!
                                            .image!.original
                                            .toString()
                                        : AppUrls.errorImageUrl.toString(),
                                    genres: value
                                        .movieList.data![index].show!.genres!,
                                    officialSite: value.movieList.data![index]
                                        .show!.officialSite
                                        .toString(),
                                    premiered: value
                                        .movieList.data![index].show!.premiered
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      value.movieList.data![index].show?.image
                                                  ?.original !=
                                              null
                                          ? value.movieList.data![index].show!
                                              .image!.original
                                              .toString()
                                          : AppUrls.errorImageUrl.toString(),
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 300,
                          initialPage: 0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 700),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Movies List",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          itemCount: value.movieList.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SelectedMovieDetailView(
                                        name: value
                                            .movieList.data![index].show!.name
                                            .toString(),
                                        summary: value.movieList.data![index]
                                            .show!.summary
                                            .toString(),
                                        image: value.movieList.data![index].show
                                                    ?.image?.original !=
                                                null
                                            ? value.movieList.data![index].show!
                                                .image!.original
                                                .toString()
                                            : AppUrls.errorImageUrl.toString(),
                                        genres: value.movieList.data![index]
                                            .show!.genres!,
                                        officialSite: value.movieList
                                            .data![index].show!.officialSite
                                            .toString(),
                                        premiered: value.movieList.data![index]
                                            .show!.premiered
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 170,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          value.movieList.data![index].show
                                                      ?.image?.original !=
                                                  null
                                              ? value.movieList.data![index]
                                                  .show!.image!.original
                                                  .toString()
                                              : AppUrls.errorImageUrl
                                                  .toString(),
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              default:
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
