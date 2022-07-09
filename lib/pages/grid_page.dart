import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:wiet_corp/bloc/image_bloc.dart';
import 'package:wiet_corp/models/cat.dart';
import 'package:wiet_corp/utilities/app_colors.dart';
import 'package:wiet_corp/utilities/constants.dart';
import 'package:wiet_corp/utilities/routes.dart';
import 'package:wiet_corp/widgets/custom_app_bar.dart';
import 'package:wiet_corp/widgets/custom_drawer.dart';
import 'package:wiet_corp/widgets/error_page.dart';
import 'package:wiet_corp/widgets/loading_page.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late final ImageBloc _imageBloc;

  @override
  void initState() {
    super.initState();

    _imageBloc = ImageBloc();

    getCatImages();
  }

  @override
  Widget build(BuildContext context) {
    // This is for iPhoneX and advanced versions.
    statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(doesGoBack: false),
      body: BlocBuilder(
        bloc: _imageBloc,
        builder: ((context, state) {
          if (state is ImageLoading) {
            return LoadingPage(
              body: Container(
                color: AppColors.transparent,
              ),
            );
          } else if (state is ImageLoaded) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: state.catList.length,
                itemBuilder: (context, index) {
                  return _buildGrid(state.catList[index]);
                },
              ),
            );
          } else if (state is ImageError) {
            return ErrorPage(
              body: Container(
                color: AppColors.red,
              ),
              errorTitle: "Something went wrong...",
            );
          }

          //  If state is ImageInitial
          return Container();
        }),
      ),
    );
  }

  Widget _buildGrid(Cat cat) {
    return GestureDetector(
      onTap: () {
        if (!cat.hasError) {
          Navigator.pushNamed(context, INFORMATION_PAGE, arguments: cat);
        }
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Hero(
          tag: cat.id,
          child: FadeInImage.memoryNetwork(
            image: cat.url!,
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            imageErrorBuilder: (context, url, error) {
              cat.hasError = true;

              return ErrorPage(
                body: Container(
                  color: AppColors.red,
                ),
                errorTitle: "Picture not found..",
              );
            },
          ),
        ),
      ),
    );
  }

  void getCatImages() {
    _imageBloc.add(GetImages());
  }
}
