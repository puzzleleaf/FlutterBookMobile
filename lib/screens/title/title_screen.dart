import 'package:about_book/models/data.dart';
import 'package:about_book/screens/contents/contents_screen.dart';
import 'package:about_book/screens/title/local_widgets/title_cover_widget.dart';
import 'package:about_book/utils/styles.dart';
import 'package:about_book/widgets/arrow_hint_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  final PageController pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemBuilder: (context, index) {
          var contents = bookData[index];
          var titleList = contents['title'].split(' ');
          return Stack(
            children: <Widget>[
              TitleCoverWidget(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                imagePath: contents['img'],
                idx: index,
                title: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: titleList[0],
                        style: titleTextStyle,
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: titleList[1],
                        style: titleTextStyle.copyWith(color: Colors.grey[700]),
                      ),
                      TextSpan(text: '\n\n'),
                      TextSpan(
                        text: contents['subTitle'],
                        style:
                            subTitleTextStyle.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ContentsScreen(
                        contents: contents,
                        idx: index,
                      ),
                    ),
                  );
                },
              ),
              ArrowHintWidget(
                screenHeight: screenHeight,
                left: index > 0,
                right: index < bookData.length - 1,
              ),
            ],
          );
        },
        itemCount: bookData.length,
      ),
    );
  }
}
