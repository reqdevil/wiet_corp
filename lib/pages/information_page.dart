import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wiet_corp/models/cat.dart';
import 'package:wiet_corp/utilities/app_colors.dart';
import 'package:wiet_corp/widgets/custom_app_bar.dart';
import 'package:wiet_corp/widgets/custom_drawer.dart';
import 'package:wiet_corp/widgets/error_page.dart';

class InformationPage extends StatelessWidget {
  final Cat cat;

  const InformationPage({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: const CustomAppBar(doesGoBack: true),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.mainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: cat.id,
                child: FadeInImage.memoryNetwork(
                  image: cat.url!,
                  fit: BoxFit.fill,
                  placeholder: kTransparentImage,
                  imageErrorBuilder: (context, url, error) {
                    return ErrorPage(
                      body: Container(
                        color: AppColors.red,
                      ),
                      errorTitle: "Picture not found..",
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              cat.breeds != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Cat Breed",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                cat.breeds!.name!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: AppColors.mainColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      "There is not enough information about the cat.",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
