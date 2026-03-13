import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/custom_conts/app_image_conts/app_image_conts.dart';
import '../../../../utils/custom_conts/app_text_const/app_text_const.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import '../provider/feed_provider.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<FeedProvider>();
    final feedListImages = provider.listFeedImages;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: galleryExplorer, fontSize: 20),
      ),

      body: Builder(
        builder: (_) {

          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator( backgroundColor: Colors.blueAccent,));
          }

          if (provider.error.isNotEmpty) {
            return Center(child: Text(provider.error));
          }

          return ListView.builder(
           // reverse: true,
            shrinkWrap: true,
            itemCount: feedListImages.length,
            itemBuilder: (context, index) {

              final image = feedListImages[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [

                      Image.network(
                        image.downloadUrl,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(defaultIcon);
                        },
                      ),

                      ListTile(
                        title: CustomText(
                          text: 'AUTHOR',
                          fontSize: 14,
                        ),

                        subtitle: CustomText(
                          text: image.author,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}