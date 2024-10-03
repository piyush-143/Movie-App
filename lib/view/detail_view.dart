import 'dart:io';

import 'package:flutter/material.dart';

import '../services/app_Urls.dart';

class SelectedMovieDetailView extends StatefulWidget {
  String name, premiered, summary, officialSite;
  String? image;
  List<String> genres;
  SelectedMovieDetailView(
      {super.key,
      required this.name,
      required this.summary,
      required this.image,
      required this.genres,
      required this.officialSite,
      required this.premiered});

  @override
  State<SelectedMovieDetailView> createState() =>
      _SelectedMovieDetailViewState();
}

class _SelectedMovieDetailViewState extends State<SelectedMovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: 290,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image == null
                            ? AppUrls.errorImageUrl
                            : widget.image.toString()),
                        fit: BoxFit.fill),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.white,
                    ))
              ]),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Text(
                  widget.name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      widget.premiered.toString(),
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      widget.genres.toString(),
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white38),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Text(
                  widget.summary.toString(),
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
