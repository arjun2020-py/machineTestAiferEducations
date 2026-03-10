import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/custom_conts/app_image_conts/app_image_conts.dart';
import '../../../../utils/custom_conts/app_text_const/app_text_const.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import '../cubit/feed_cubit.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedCubit(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomText(text: galleryExplorer, fontSize: 20),
        ),
        body: BlocBuilder<FeedCubit, FeedState>(
          builder: (context, state) {
            var cubit = context.read<FeedCubit>();
            return cubit.listFeedImages.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.listFeedImages.length,
                    itemBuilder: (context, index) {
                      var feedListImages = cubit.listFeedImages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.network(
                                feedListImages.downloadUrl,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(defaultIcon);
                                },
                              ),
                              ListTile(
                                title: CustomText(text: 'AUTHOR', fontSize: 14),
                                subtitle: CustomText(
                                  text: feedListImages.author,
                                ),
                              
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
