import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_test_app/Model/movieModel.dart';
import 'package:quadb_test_app/services/api_response.dart';
import 'package:quadb_test_app/services/api_services.dart';
import 'package:quadb_test_app/view/detail_view.dart';
import 'package:quadb_test_app/view_model/movie_view_model.dart';

import '../services/app_Urls.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<MovieViewModel>(
                  builder: (context, value, child) => TextFormField(
                    controller: searchController,
                    onChanged: (val) {
                      value.setSelectedMovieLoading(ApiResponse.completed(val));
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      hintText: 'Search the country',
                      hintStyle: const TextStyle(height: 2.7),
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
              ),
              if (searchController.text.isEmpty)
                Expanded(
                  child: FutureBuilder(
                    future: selectedMovieService.getMovieModelList(),
                    builder:
                        (context, AsyncSnapshot<List<MovieModel>> snapshot) =>
                            ListView.builder(
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
                                    summary: snapshot.data![index].show!.summary
                                        .toString(),
                                    image: snapshot.data![index].show?.image
                                                ?.original !=
                                            null
                                        ? snapshot
                                            .data![index].show?.image?.original
                                            .toString()
                                        : AppUrls.errorImageUrl,
                                    genres: snapshot.data![index].show!.genres!,
                                    officialSite: snapshot
                                        .data![index].show!.officialSite
                                        .toString(),
                                    premiered: 2020.toString()),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 130,

                                //color: Colors.blue,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(snapshot
                                                    .data![index]
                                                    .show
                                                    ?.image
                                                    ?.original !=
                                                null
                                            ? snapshot.data![index].show!.image!
                                                .original
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
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                )
              else
                Expanded(
                  child: FutureBuilder(
                    future: selectedMovieService.getMovieModelList(),
                    builder:
                        (context, AsyncSnapshot<List<MovieModel>> snapshot) =>
                            ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedMovieDetailView(
                                    name: snapshot.data![index].show!.name
                                        .toString(),
                                    summary: snapshot.data![index].show!.summary
                                        .toString(),
                                    image: snapshot.data![index].show?.image
                                                ?.original !=
                                            null
                                        ? snapshot
                                            .data![index].show?.image?.original
                                            .toString()
                                        : AppUrls.errorImageUrl,
                                    genres: snapshot.data![index].show!.genres!,
                                    officialSite: snapshot
                                        .data![index].show!.officialSite
                                        .toString(),
                                    premiered: 2020.toString()),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 130,

                                //color: Colors.blue,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(snapshot
                                                    .data![index]
                                                    .show
                                                    ?.image
                                                    ?.original !=
                                                null
                                            ? snapshot.data![index].show!.image!
                                                .original
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
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
