import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppState.isArabic,
      builder: (context, isArabic, _) {
        return Directionality(
          textDirection:
              isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: const Color(0xFF073B2B),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SiteHeader(),

                  HomeHero(
                    isArabic: isArabic,
                  ),

                  const SiteFooter(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================================
// HOME HERO
// ============================================================

class HomeHero extends StatelessWidget {
  final bool isArabic;

  const HomeHero({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth <= 760;

        final heroHeight =
            MediaQuery.of(context).size.height * 0.82;

        return SizedBox(
          width: double.infinity,
          height: heroHeight.clamp(
            mobile ? 560.0 : 600.0,
            820.0,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ==================================================
              // BACKGROUND
              // ==================================================

              Image.asset(
                mobile
                    ? 'assets/images/hero-mobile.webp'
                    : 'assets/images/hero-bg.webp',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),

              // ==================================================
              // OVERLAY
              // ==================================================

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.04),
                      Colors.black.withValues(alpha: 0.02),
                      const Color(0xFF0E4532)
                          .withValues(alpha: 0.18),
                    ],
                  ),
                ),
              ),

              // ==================================================
              // CONTENT
              // ==================================================

              if (mobile)
                _MobileHero(
                  isArabic: isArabic,
                )
              else
                _DesktopHero(
                  isArabic: isArabic,
                ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================================
// DESKTOP HERO
// ============================================================

class _DesktopHero extends StatelessWidget {
  final bool isArabic;

  const _DesktopHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final text = isArabic
        ? 'الجيل القادم من عبوات المبيدات الزراعية'
        : 'The Next Generation of Agricultural Pesticide Packaging';

    final subtitle = isArabic
        ? 'هوية راسخة وحماية مؤكدة'
        : 'A Strong Identity Uncompromised Protection';

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 68,
          left: 5,
          right: 5,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1320,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================================================
              // BUTTONS
              // ==================================================

              SizedBox(
                width: 140,
                child: Column(
                  children: [
                    _HeroButton(
                      text: isArabic
                          ? 'اطلب عرض سعر'
                          : 'Request a Quote',
                      primary: true,
                    ),

                    const SizedBox(height: 10),

                    _HeroButton(
                      text: isArabic
                          ? 'استكشف المنتجات'
                          : 'Explore Products',
                      primary: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 18),

              // ==================================================
              // GOLD DIVIDER
              // ==================================================

              Container(
                width: 4,
                height: 108,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2B94F),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),

              const SizedBox(width: 16),

              // ==================================================
              // TEXT
              // ==================================================

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        textAlign: isArabic
                            ? TextAlign.right
                            : TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              isArabic ? 'Cairo' : 'Inter',
                          fontSize:
                              MediaQuery.of(context).size.width >
                                      1400
                                  ? 29
                                  : 25,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                          letterSpacing:
                              isArabic ? 0 : -0.6,
                          shadows: const [
                            Shadow(
                              offset: Offset(0, 3),
                              blurRadius: 12,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        subtitle,
                        textAlign: isArabic
                            ? TextAlign.right
                            : TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              isArabic ? 'Cairo' : 'Inter',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          shadows: const [
                            Shadow(
                              offset: Offset(0, 2),
                              blurRadius: 8,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MOBILE HERO
// ============================================================

class _MobileHero extends StatelessWidget {
  final bool isArabic;

  const _MobileHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        40,
        20,
        35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ====================================================
          // TEXT
          // ====================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 130,
                color: const Color(0xFFE2B94F),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      isArabic
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic
                          ? 'الجيل القادم من عبوات المبيدات الزراعية'
                          : 'The Next Generation of Agricultural Pesticide Packaging',
                      textAlign: isArabic
                          ? TextAlign.right
                          : TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            isArabic ? 'Cairo' : 'Inter',
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      isArabic
                          ? 'هوية راسخة وحماية مؤكدة'
                          : 'A Strong Identity Uncompromised Protection',
                      textAlign: isArabic
                          ? TextAlign.right
                          : TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            isArabic ? 'Cairo' : 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Spacer(),

          // ====================================================
          // BUTTONS
          // ====================================================

          _HeroButton(
            text: isArabic
                ? 'اطلب عرض سعر'
                : 'Request a Quote',
            primary: true,
          ),

          const SizedBox(height: 10),

          _HeroButton(
            text: isArabic
                ? 'استكشف المنتجات'
                : 'Explore Products',
            primary: false,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HERO BUTTON
// ============================================================

class _HeroButton extends StatefulWidget {
  final String text;
  final bool primary;

  const _HeroButton({
    required this.text,
    required this.primary,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },

      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,

        width: 140,
        height: 42,

        decoration: BoxDecoration(
          color: widget.primary
              ? (hovering
                  ? const Color(0xFFF0C960)
                  : const Color(0xFFE2B94F))
              : (hovering
                  ? Colors.white
                  : Colors.transparent),

          borderRadius: BorderRadius.circular(10),

          border: Border.all(
            color: widget.primary
                ? const Color(0xFFE2B94F)
                : Colors.white,
            width: 1.2,
          ),

          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.18,
                    ),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),

        child: Material(
          color: Colors.transparent,

          child: InkWell(
            borderRadius: BorderRadius.circular(10),

            onTap: () {
              if (widget.primary) {
                Navigator.pushNamed(
                  context,
                  '/contact',
                );
              } else {
                Navigator.pushNamed(
                  context,
                  '/products',
                );
              }
            },

            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.primary
                      ? const Color(0xFF1F4532)
                      : (hovering
                          ? const Color(0xFF1F4532)
                          : Colors.white),

                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}