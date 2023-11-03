import 'package:flutter/material.dart';

class PremiumBannerWidget extends StatelessWidget {
  const PremiumBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _BannerBody(),
        _PriceWidget(),
      ],
    );
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      child: Container(
        padding: EdgeInsets.all(24),
        color: Color(0xff071D55),
        child: Text("1\$", style: TextStyle(color: Color(0xff9EB031))),
      ),
    );
  }
}

class _BannerBody extends StatelessWidget {
  const _BannerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff9EB031),
      height: 116,
      width: double.infinity,
      child: const _BannerText(),
    );
  }
}

class _BannerText extends StatelessWidget {
  const _BannerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 2,
          child: Image.asset("assets/images/premium.png"),
        ),
        const Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Go Pro (No Adds)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff0D2972)),
              ),
              Text(
                "No fuss, no ads, for only \$1 a month",
                style: TextStyle(fontSize: 12, color: Color(0xff0D2972)),
              ),
            ],
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
