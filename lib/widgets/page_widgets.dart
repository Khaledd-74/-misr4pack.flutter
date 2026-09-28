import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../state/app_state.dart';

const green = Color(0xFF006B52);
const darkGreen = Color(0xFF073B2B);
const gold = Color(0xFFC9A24A);

class PageShell extends StatelessWidget {
  final Widget child;
  const PageShell({super.key, required this.child});
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
    valueListenable: AppState.isArabic,
    builder: (_, ar, __) => Directionality(textDirection: ar ? TextDirection.rtl : TextDirection.ltr, child: child),
  );
}

class SectionTitle extends StatelessWidget {
  final String eyebrowEn, eyebrowAr, titleEn, titleAr;
  final String? textEn, textAr;
  const SectionTitle({super.key, required this.eyebrowEn, required this.eyebrowAr, required this.titleEn, required this.titleAr, this.textEn, this.textAr});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(AppState.tr(eyebrowEn, eyebrowAr), style: const TextStyle(color: green, fontWeight: FontWeight.w900, letterSpacing: 1.4, fontSize: 12)),
    const SizedBox(height: 10),
    Text(AppState.tr(titleEn, titleAr), style: TextStyle(color: darkGreen, fontSize: MediaQuery.sizeOf(context).width < 600 ? 30 : 44, fontWeight: FontWeight.w900, height: 1.08)),
    if (textEn != null) ...[const SizedBox(height: 14), Text(AppState.tr(textEn!, textAr!), style: const TextStyle(color: Color(0xFF52635D), height: 1.8, fontSize: 16))],
  ]);
}

class InfoCard extends StatelessWidget {
  final String number, titleEn, titleAr, textEn, textAr;
  final String? icon;
  const InfoCard({super.key, required this.number, required this.titleEn, required this.titleAr, required this.textEn, required this.textAr, this.icon});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(26),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0xFFE1EAE5)), boxShadow: const [BoxShadow(color: Color(0x10000000), blurRadius: 25, offset: Offset(0, 10))]),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        if (icon != null) SvgPicture.asset(icon!, width: 42, height: 42),
        if (icon != null) const Spacer(),
        Text(number, style: const TextStyle(color: Color(0xFFB5C3BD), fontWeight: FontWeight.w900, fontSize: 13)),
      ]),
      const SizedBox(height: 20),
      Text(AppState.tr(titleEn, titleAr), style: const TextStyle(color: darkGreen, fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      Text(AppState.tr(textEn, textAr), style: const TextStyle(color: Color(0xFF63736D), height: 1.7, fontSize: 14)),
    ]),
  );
}

class ActionButton extends StatelessWidget {
  final String textEn, textAr;
  final VoidCallback onPressed;
  final bool outlined;
  const ActionButton({super.key, required this.textEn, required this.textAr, required this.onPressed, this.outlined = false});
  @override
  Widget build(BuildContext context) => outlined ? OutlinedButton(onPressed: onPressed, style: OutlinedButton.styleFrom(foregroundColor: green, side: const BorderSide(color: green), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18)), child: Text(AppState.tr(textEn, textAr), style: const TextStyle(fontWeight: FontWeight.w800))) : ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(backgroundColor: gold, foregroundColor: darkGreen, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18)), child: Text(AppState.tr(textEn, textAr), style: const TextStyle(fontWeight: FontWeight.w900)));
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveGrid({super.key, required this.children});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final n = w >= 1100 ? 3 : w >= 700 ? 2 : 1;
    return GridView.count(crossAxisCount: n, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 18, mainAxisSpacing: 18, childAspectRatio: n == 1 ? 1.45 : 1.12, children: children);
  }
}
