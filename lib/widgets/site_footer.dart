import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  static const Color footerColor = Color(0xFF073F30);

  static const TextStyle bottomTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Color(0xFF91AAA0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: footerColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool mobile = constraints.maxWidth < 750;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1180,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      20,
                      mobile ? 38 : 34,
                      20,
                      mobile ? 35 : 30,
                    ),
                    child: mobile
                        ? const _MobileFooter()
                        : const _DesktopFooter(),
                  ),

                  // Divider
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white.withValues(
                      alpha: 0.16,
                    ),
                  ),

                  // Bottom
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: mobile ? 18 : 16,
                    ),
                    child: mobile
                        ? const Column(
                            children: [
                              Text(
                                '© 2026 MISR Company',
                                style: bottomTextStyle,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Crafted by Khaled Abdelazez',
                                style: bottomTextStyle,
                              ),
                            ],
                          )
                        : const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '© 2026 MISR Company',
                                style: bottomTextStyle,
                              ),
                              Text(
                                'Crafted by Khaled Abdelazez',
                                style: bottomTextStyle,
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


/* =========================================================
   DESKTOP FOOTER
========================================================= */

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // BRAND
          // =========================

          const SizedBox(
            width: 390,
            child: _Brand(),
          ),

          const Spacer(),

          // =========================
          // COMPANY
          // =========================

          SizedBox(
            width: 190,
            child: _FooterLinks(
              title: 'COMPANY',
              links: [
                _FooterLinkData(
                  title: 'About',
                  route: AppRoutes.about,
                ),
                _FooterLinkData(
                  title: 'Quality',
                  route: AppRoutes.quality,
                ),
                _FooterLinkData(
                  title: 'Contact Us',
                  route: AppRoutes.contact,
                ),
              ],
            ),
          ),

          const SizedBox(width: 65),

          // =========================
          // PRODUCTS
          // =========================

          SizedBox(
            width: 250,
            child: _FooterLinks(
              title: 'PRODUCTS',
              links: [
                _FooterLinkData(
                  title: 'Technology',
                  route: AppRoutes.technology,
                ),
                _FooterLinkData(
                  title: 'Product Range',
                  route: AppRoutes.products,
                ),
                _FooterLinkData(
                  title: 'Production Process',
                  route: AppRoutes.process,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/* =========================================================
   MOBILE FOOTER
========================================================= */

class _MobileFooter extends StatelessWidget {
  const _MobileFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Brand(),

        const SizedBox(height: 35),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FooterLinks(
                title: 'COMPANY',
                links: [
                  _FooterLinkData(
                    title: 'About',
                    route: AppRoutes.about,
                  ),
                  _FooterLinkData(
                    title: 'Quality',
                    route: AppRoutes.quality,
                  ),
                  _FooterLinkData(
                    title: 'Contact Us',
                    route: AppRoutes.contact,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 25),

            Expanded(
              child: _FooterLinks(
                title: 'PRODUCTS',
                links: [
                  _FooterLinkData(
                    title: 'Technology',
                    route: AppRoutes.technology,
                  ),
                  _FooterLinkData(
                    title: 'Product Range',
                    route: AppRoutes.products,
                  ),
                  _FooterLinkData(
                    title: 'Production Process',
                    route: AppRoutes.process,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


/* =========================================================
   BRAND
========================================================= */

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/misr-logo.png',
          width: 135,
          height: 100,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),

        const SizedBox(height: 5),

        const SizedBox(
          width: 330,
          child: Text(
            'FOR MANUFACTURING REQUIREMENTS, FILLING, AND PACKAGING.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              height: 1.65,
              fontWeight: FontWeight.w500,
              color: Color(0xFFB6C8C0),
              letterSpacing: 0.15,
            ),
          ),
        ),

        const SizedBox(height: 13),

        Row(
          children: [
            _SocialIcon(
              icon: Icons.facebook,
            ),

            const SizedBox(width: 18),

            _SocialIcon(
              icon: Icons.camera_alt_outlined,
            ),

            const SizedBox(width: 18),

            _SocialIcon(
              icon: Icons.business_center_outlined,
            ),
          ],
        ),
      ],
    );
  }
}


/* =========================================================
   FOOTER LINK DATA
========================================================= */

class _FooterLinkData {
  final String title;
  final String route;

  const _FooterLinkData({
    required this.title,
    required this.route,
  });
}


/* =========================================================
   FOOTER LINKS
========================================================= */

class _FooterLinks extends StatelessWidget {
  final String title;
  final List<_FooterLinkData> links;

  const _FooterLinks({
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: Color(0xFF7F9A8D),
          ),
        ),

        const SizedBox(height: 14),

        for (final link in links)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 9,
            ),
            child: _FooterLink(
              title: link.title,
              route: link.route,
            ),
          ),
      ],
    );
  }
}


/* =========================================================
   FOOTER LINK
========================================================= */

class _FooterLink extends StatefulWidget {
  final String title;
  final String route;

  const _FooterLink({
    required this.title,
    required this.route,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
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
          Navigator.pushNamed(
            context,
            widget.route,
          );
        },

        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: hovered
                ? Colors.white
                : const Color(0xFFD0DBD6),
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   SOCIAL ICON
========================================================= */

class _SocialIcon extends StatefulWidget {
  final IconData icon;

  const _SocialIcon({
    required this.icon,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
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
          // Social links will be connected later.
        },

        child: Icon(
          widget.icon,
          size: 18,
          color: hovered
              ? const Color(0xFFE2B94F)
              : Colors.white,
        ),
      ),
    );
  }
}