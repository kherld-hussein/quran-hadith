import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SurahInformation extends StatelessWidget {
  final int? surahNumber;
  final String? arabicName;
  final String? englishName;
  final String? englishNameTranslation;
  final int? ayahs;
  final String? revelationType;

  const SurahInformation(
      {Key? key,
        this.surahNumber,
        this.arabicName,
        this.englishName,
        this.englishNameTranslation,
        this.ayahs,
        this.revelationType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("About this surah", style: theme.textTheme.headline2?.copyWith(fontSize: 20)),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(englishName!, style: theme.textTheme.bodyText1),
              AutoSizeText(
                arabicName!,
                textDirection: TextDirection.rtl,
                style: theme.textTheme.bodyText1!.copyWith(fontFamily: 'Amiri'),
              ),
            ],
          ),
          AutoSizeText("Ayahs: $ayahs"),
          AutoSizeText("Surah Number: $surahNumber"),
          AutoSizeText("Chapter: $revelationType"),
          // AutoSizeText("Meaning: ${widget.englishNameTranslation}"),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
