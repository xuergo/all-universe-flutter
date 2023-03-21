import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/pages/home/widgets/podcast_item.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List<PodcastModel> list;
  const Recommend({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DiyTitle(
            title1: '忽左忽右',
            title2: '的观众也爱听',
            margin: EdgeInsets.only(top: 40.h, bottom: 15.h),
          ),
          ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  PodcastItem(data: list[index], type: 'time'),
                  list.length - 1 == index
                      ? SizedBox()
                      : SizedBox(height: 20.h),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
