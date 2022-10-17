import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:number_trivia/core/services/ad_helper.dart';

/// {@template banner_ad}
/// Displays a banner ad from Google Mobile Ads.
/// {@endtemplate}
class MyBannerAd extends StatefulWidget {
  /// {@macro banner_ad}
  const MyBannerAd({
    super.key,
  });

  @override
  State<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends State<MyBannerAd> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (
          Ad ad,
        ) {
          setState(
            () {
              _ad = ad as BannerAd;
            },
          );
        },
        onAdFailedToLoad: (
          Ad ad,
          LoadAdError error,
        ) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          log(
            'Ad load failed (code=${error.code} message=${error.message})',
          );
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _ad?.dispose();

    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    if (_ad == null) {
      return Container();
    }
    return Container(
      width: _ad!.size.width.toDouble(),
      height: 72,
      alignment: Alignment.center,
      child: AdWidget(
        ad: _ad!,
      ),
    );
  }
}
