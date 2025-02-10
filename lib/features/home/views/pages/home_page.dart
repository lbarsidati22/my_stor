import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/features/home/cubit/home_cubit.dart';
import 'package:my_stor/features/home/cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              buildWhen: (previous, current) =>
                  current is BannersLoaded ||
                  current is BannersLeading ||
                  current is BannersError,
              builder: (context, state) {
                if (state is BannersLeading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BannersError) {
                  return Center(
                    child: Text(state.message ?? ''),
                  );
                } else if (state is BannersLoaded) {
                  final banners = state.data;
                  return FlutterCarousel.builder(
                    itemCount: banners?.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(end: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: banners?[itemIndex].image ??
                                AppConstants.imageNull,
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    },
                    options: FlutterCarouselOptions(
                      enlargeCenterPage: true,
                      //  aspectRatio: 2.4,
                      // autoPlay: true,
                      height: size.height * 0.2,
                      showIndicator: false,
                      slideIndicator: CircularWaveSlideIndicator(),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
