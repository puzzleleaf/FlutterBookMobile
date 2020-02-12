import 'package:about_book/utils/styles.dart';
import 'package:about_book/utils/util.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

class ContentsScreen extends StatelessWidget {
  final contents;
  final int idx;

  ContentsScreen({this.idx, this.contents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxlsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.black,
              expandedHeight: 300.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Hero(
                    tag: idx,
                    child: Image.network(
                      contents['img'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(
                  contents['title'],
                  style: contentsTitleTextStyle.copyWith(
                    color: Color(
                      Util.hexToColor(contents['contentsColor']),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                contents['header'],
                style: contentsHeaderTextStyle.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropCapText(
                contents['contents'],
                dropCapStyle: dropCapTextStyle.copyWith(
                    color: Color(Util.hexToColor(contents['contentsColor']))),
                dropCapPadding: const EdgeInsets.only(
                  right: 10.0,
                ),
                style: contentsTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
