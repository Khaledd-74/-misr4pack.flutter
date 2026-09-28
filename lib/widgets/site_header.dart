import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../routes/app_routes.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppState.isArabic,
      builder: (context, isArabic, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 900;

            return Container(
              width: double.infinity,
              height: isMobile ? 76 : 82,
              color: const Color(0xFF173B2C),
              child: SafeArea(
                bottom: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1420,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 18 : 28,
                      ),
                      child: Row(
                        children: [
                          // =========================
                          // LOGO
                          // =========================
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.home,
                                (route) => false,
                              );
                            },
                            child: Image.asset(
                              'assets/images/misr-logo.png',
                              width: 92,
                              height: 72,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const Spacer(),

                          if (!isMobile) ...[
                            // =========================
                            // NAVIGATION
                            // =========================
                            Row(
                              children: [
                                _NavItem(
                                  title: isArabic
                                      ? 'الرئيسية'
                                      : 'Home',
                                  route: AppRoutes.home,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'عن الشركة'
                                      : 'About Us',
                                  route: AppRoutes.about,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'التكنولوجيا'
                                      : 'Technology',
                                  route: AppRoutes.technology,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'مراحل التصنيع'
                                      : 'Process',
                                  route: AppRoutes.process,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'الجودة'
                                      : 'Quality',
                                  route: AppRoutes.quality,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'المنتجات'
                                      : 'Products',
                                  route: AppRoutes.products,
                                ),
                                _NavItem(
                                  title: isArabic
                                      ? 'تواصل معنا'
                                      : 'Contact',
                                  route: AppRoutes.contact,
                                ),
                              ],
                            ),

                            const SizedBox(width: 24),

                            // =========================
                            // LANGUAGE
                            // =========================
                            _LanguageSwitcher(
                              isArabic: isArabic,
                            ),
                          ] else ...[
                            _MobileHeader(
                              isArabic: isArabic,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}


/* =========================================================
   NAV ITEM
========================================================= */

class _NavItem extends StatefulWidget {
  final String title;
  final String route;

  const _NavItem({
    required this.title,
    required this.route,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        ModalRoute.of(context)?.settings.name;

    final active = currentRoute == widget.route;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          if (!active) {
            Navigator.pushNamed(
              context,
              widget.route,
            );
          }
        },
        child: Container(
          height: 82,
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active || hovered
                    ? const Color(0xFFE2B94F)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: active
                  ? FontWeight.w800
                  : FontWeight.w600,
              color: active || hovered
                  ? Colors.white
                  : const Color(0xFFE0E8E3),
            ),
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   LANGUAGE SWITCHER
========================================================= */

class _LanguageSwitcher extends StatelessWidget {
  final bool isArabic;

  const _LanguageSwitcher({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            AppState.isArabic.value = false;
          },
          child: Text(
            'EN',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: !isArabic
                  ? const Color(0xFFE2B94F)
                  : Colors.white60,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Container(
          width: 1,
          height: 16,
          color: Colors.white24,
        ),

        const SizedBox(width: 12),

        GestureDetector(
          onTap: () {
            AppState.isArabic.value = true;
          },
          child: Text(
            'AR',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: isArabic
                  ? const Color(0xFFE2B94F)
                  : Colors.white60,
            ),
          ),
        ),
      ],
    );
  }
}


/* =========================================================
   MOBILE HEADER
========================================================= */

class _MobileHeader extends StatelessWidget {
  final bool isArabic;

  const _MobileHeader({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            AppState.isArabic.value = !isArabic;
          },
          child: Text(
            isArabic ? 'AR' : 'EN',
            style: const TextStyle(
              fontFamily: 'Inter',
              color: Color(0xFFE2B94F),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const SizedBox(width: 12),

        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor:
                  const Color(0xFF173B2C),
              shape:
                  const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (_) {
                return _MobileMenu(
                  isArabic: isArabic,
                );
              },
            );
          },
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}


/* =========================================================
   MOBILE MENU
========================================================= */

class _MobileMenu extends StatelessWidget {
  final bool isArabic;

  const _MobileMenu({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        isArabic ? 'الرئيسية' : 'Home',
        AppRoutes.home,
      ),
      (
        isArabic ? 'عن الشركة' : 'About Us',
        AppRoutes.about,
      ),
      (
        isArabic ? 'التكنولوجيا' : 'Technology',
        AppRoutes.technology,
      ),
      (
        isArabic ? 'مراحل التصنيع' : 'Process',
        AppRoutes.process,
      ),
      (
        isArabic ? 'الجودة' : 'Quality',
        AppRoutes.quality,
      ),
      (
        isArabic ? 'المنتجات' : 'Products',
        AppRoutes.products,
      ),
      (
        isArabic ? 'تواصل معنا' : 'Contact',
        AppRoutes.contact,
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius:
                    BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 15),

            for (final item in items)
              ListTile(
                title: Text(
                  item.$1,
                  style: TextStyle(
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(
                    context,
                    item.$2,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}