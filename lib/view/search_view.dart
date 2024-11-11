import 'package:flutter/material.dart';
import 'package:movie_app/Model/movieModel.dart';
import 'package:movie_app/services/api_response.dart';
import 'package:movie_app/view/detail_view.dart';
import 'package:provider/provider.dart';
import '../services/api_services.dart';
import '../services/app_Urls.dart';
import '../view_model/movie_view_model.dart';
import '../widgets/bottom_navigation_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  ApiServices selectedMovieService = ApiServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<MovieViewModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ));
            },
            hoverColor: Colors.white10,
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (val) {
                    searchProvider.setSelectedMovieLoading(
                        ApiResponse.completed(val.toString()));
                  },
                  cursorHeight: 40,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.white54,
                      ),
                    ),
                    hoverColor: Colors.yellow.shade700,
                    contentPadding: const EdgeInsets.symmetric(vertical: 2),
                    hintText: 'Search the country',
                    hintStyle:
                        const TextStyle(height: 2.7, color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white38)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.red)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              searchController.text.isEmpty
                  ? FutureBuilder(
                      future: selectedMovieService.getMovieModelList(),
                      builder:
                          (context, AsyncSnapshot<List<MovieModel>> snapshot) {
                        if (!snapshot.hasData) {
                          return Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectedMovieDetailView(
                                            name: snapshot.data![index].show!.name
                                                .toString(),
                                            summary: snapshot
                                                .data![index].show!.summary
                                                .toString(),
                                            image:
                                                snapshot.data![index].show!.image !=
                                                        null
                                                    ? snapshot.data![index]
                                                        .show!.image!.original
                                                        .toString()
                                                    : AppUrls.errorImageUrl,
                                            genres: snapshot
                                                .data![index].show!.genres,
                                            officialSite: snapshot
                                                .data![index].show!.officialSite
                                                .toString(),
                                            premiered: 2020.toString()),
                                      ),
                                    );
                                  },
                                  hoverColor: Colors.white10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 130,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                          .data![index]
                                                          .show!
                                                          .image !=
                                                      null
                                                  ? snapshot.data![index].show!
                                                      .image!.original
                                                      .toString()
                                                  : AppUrls.errorImageUrl),
                                              fit: BoxFit.fill,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(snapshot
                                                .data![index].show!.name
                                                .toString()),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  : Expanded(
                      child: FutureBuilder(
                        future: selectedMovieService
                            .getSelectedMovie(searchController.text.toString()),
                        builder:
                            (context, AsyncSnapshot<List<dynamic>> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.red,
                            ));
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String searchedMovie = snapshot.data![index]
                                        ['show']['name']
                                    .toString();
                                if (searchedMovie.toLowerCase().contains(
                                    searchController.text.toString())) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SelectedMovieDetailView(
                                              name: snapshot.data![index]['show']['name']
                                                  .toString(),
                                              summary: snapshot.data![index]['show']['summary']
                                                  .toString(),
                                              image: snapshot.data![index]['show']['image'] != null
                                                  ? snapshot.data![index]['show']
                                                          ['image']['original']
                                                      .toString()
                                                  : AppUrls.errorImageUrl,
                                              genres: snapshot.data![index]
                                                  ['show']['genres'],
                                              officialSite: snapshot.data![index]
                                                      ['show']['officialSite']
                                                  .toString(),
                                              premiered: 2020.toString()),
                                        ),
                                      );
                                    },
                                    hoverColor: Colors.white10,
                                    child: Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 130,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                                      .data![
                                                                  index]['show']
                                                              ['image'] !=
                                                          null
                                                      ? snapshot.data![index]
                                                              ['show']['image']
                                                              ['original']
                                                          .toString()
                                                      : AppUrls.errorImageUrl),
                                                  fit: BoxFit.fill,
                                                )),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(snapshot
                                                    .data![index]['show']
                                                        ['name']
                                                    .toString()),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            );
                          }
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
