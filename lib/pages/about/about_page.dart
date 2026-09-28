import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppState.isArabic,
      builder: (context, isArabic, _) {
        return Directionality(
          textDirection:
              isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: const Color(0xFFF2F7F4),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SiteHeader(),

                  _AboutHero(
                    isArabic: isArabic,
                  ),

                  _AboutCompany(
                    isArabic: isArabic,
                  ),

                  _AboutFeatures(
                    isArabic: isArabic,
                  ),

                  _MissionSection(
                    isArabic: isArabic,
                  ),

                  _StrengthSection(
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
// ABOUT HERO
// ============================================================

class _AboutHero extends StatelessWidget {
  final bool isArabic;

  const _AboutHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 90,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF274F3A),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment: isArabic
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              _SectionLabel(
                text: isArabic
                    ? 'عن شركة مصر'
                    : 'ABOUT MISR COMPANY',
                light: true,
                isArabic: isArabic,
              ),

              const SizedBox(height: 18),

              Text(
                isArabic
                    ? 'نبني حلول تغليف تضيف قيمة حقيقية'
                    : 'Packaging solutions built to add real value.',
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: isArabic ? 'Cairo' : 'Inter',
                  fontSize: MediaQuery.of(context).size.width > 800
                      ? 48
                      : 34,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                  letterSpacing: isArabic ? 0 : -1.2,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                isArabic
                    ? 'حلول تعبئة وتغليف بلاستيكية عالية الجودة تجمع بين الابتكار والتكنولوجيا والجودة.'
                    : 'High-quality plastic packaging solutions combining innovation, technology, and strict quality standards.',
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.86),
                  fontFamily: isArabic ? 'Cairo' : 'Inter',
                  fontSize: 18,
                  height: 1.8,
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
// ABOUT COMPANY
// ============================================================

class _AboutCompany extends StatelessWidget {
  final bool isArabic;

  const _AboutCompany({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final paragraphOne = isArabic
        ? 'تُعد شركة مصر من الشركات الموثوقة في تصنيع حلول التغليف البلاستيكية عالية الجودة، حيث نتجاوز مفهوم التغليف التقليدي من خلال الجمع بين التصميمات المبتكرة وتقنيات الإنتاج المتطورة والمعايير الصارمة للجودة، لنقدم حلولًا تضيف قيمة حقيقية إلى منتجات عملائنا.'
        : 'MISR Company is a trusted manufacturer of high-quality plastic packaging solutions. We go beyond traditional packaging by combining innovative designs, advanced production technologies, and strict quality standards to deliver packaging that adds real value to our customers’ products.';

    final paragraphTwo = isArabic
        ? 'ونقدم حلولًا مصممة خصيصًا لتلبية متطلبات القطاعات الصناعية المتخصصة، ومن أبرزها قطاع الكيماويات الزراعية، بما توفره من متانة عالية ومقاومة للمواد الكيميائية وكفاءة اقتصادية، بما يعزز حضور العلامة التجارية ويدعم قدرتها على المنافسة في السوق.'
        : 'Our solutions are tailored to demanding industries including agricultural chemicals, offering durability, chemical resistance, and cost-efficient performance that enhances brand presence and market competitiveness.';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: const Color(0xFF1F4532),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: isArabic
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                _SectionLabel(
                  text: isArabic
                      ? 'عن شركة مصر'
                      : 'ABOUT MISR COMPANY',
                  light: true,
                  isArabic: isArabic,
                ),

                const SizedBox(height: 25),

                Text(
                  paragraphOne,
                  textAlign: isArabic
                      ? TextAlign.right
                      : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 18,
                    height: isArabic ? 2 : 1.9,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  paragraphTwo,
                  textAlign: isArabic
                      ? TextAlign.right
                      : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(
                      alpha: 0.86,
                    ),
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 18,
                    height: isArabic ? 2 : 1.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FEATURES
// ============================================================

class _AboutFeatures extends StatelessWidget {
  final bool isArabic;

  const _AboutFeatures({
    required this.isArabic,
  });

  static const List<Map<String, String>> features = [
    {
      'number': '01',
      'icon': 'assets/icons/factory.svg',
      'enTitle': 'Local Leadership',
      'arTitle': 'الريادة المحلية',
      'enText':
          'Specialized manufacturing capability built around advanced IML and barrier packaging solutions.',
      'arText':
          'قدرات تصنيع متخصصة تعتمد على تقنيات IML المتقدمة وحلول التغليف بالحواجز.',
    },
    {
      'number': '02',
      'icon': 'assets/icons/shield.svg',
      'enTitle': 'Barrier Packaging',
      'arTitle': 'التغليف بالحواجز',
      'enText':
          'PA / EVOH technologies are used to improve resistance to chemical permeation in demanding applications.',
      'arText':
          'تُستخدم تقنيات PA / EVOH لتحسين مقاومة نفاذ المواد الكيميائية في التطبيقات التي تتطلب أداءً عاليًا.',
    },
    {
      'number': '03',
      'icon': 'assets/icons/anti-counterfeit.svg',
      'enTitle': 'Anti-Counterfeit',
      'arTitle': 'مكافحة التزوير',
      'enText':
          'Integrated labeling makes the label difficult to remove or replace, helping protect product identity.',
      'arText':
          'تجعل الملصقات المدمجة إزالة أو استبدال الملصق أمرًا صعبًا، مما يساعد على حماية هوية المنتج.',
    },
    {
      'number': '04',
      'icon': 'assets/icons/expert-support.svg',
      'enTitle': 'Expert Support',
      'arTitle': 'دعم فني متخصص',
      'enText':
          'Technical support helps select packaging according to the product and the active compound being packaged.',
      'arText':
          'يساعد الدعم الفني في اختيار العبوة المناسبة وفقًا لطبيعة المنتج والمادة الفعالة التي يتم تعبئتها.',
    },
    {
      'number': '05',
      'icon': 'assets/icons/iml-performance.svg',
      'enTitle': 'IML Performance',
      'arTitle': 'أداء IML',
      'enText':
          'Integrated labels resist water, humidity, friction and solvents while keeping data and codes readable.',
      'arText':
          'تقاوم الملصقات المدمجة الماء والرطوبة والاحتكاك والمذيبات مع الحفاظ على وضوح البيانات والأكواد.',
    },
    {
      'number': '06',
      'icon': 'assets/icons/manufacturing-discipline.svg',
      'enTitle': 'Manufacturing Discipline',
      'arTitle': 'انضباط التصنيع',
      'enText':
          'Specialized manufacturing processes built around precision, consistency, and strict quality standards.',
      'arText':
          'عمليات تصنيع متخصصة تعتمد على الدقة والثبات والالتزام بمعايير الجودة الصارمة.',
    },
    {
      'number': '07',
      'icon': 'assets/icons/manufacturing-expertise.svg',
      'enTitle': 'Manufacturing Expertise',
      'arTitle': 'الريادة والخبرة في التصنيع',
      'enText':
          'Trusted expertise in manufacturing high-quality plastic packaging solutions with a focus on reliability and consistent performance.',
      'arText':
          'خبرة موثوقة في تصنيع حلول التغليف البلاستيكية عالية الجودة مع التركيز على الاعتمادية وثبات الأداء.',
    },
    {
      'number': '08',
      'icon': 'assets/icons/product-protection.svg',
      'enTitle': 'Specialized Industry Focus',
      'arTitle': 'حلول صناعية متخصصة',
      'enText':
          'Tailored packaging solutions designed to meet the requirements of agricultural pesticides and veterinary medicine sectors.',
      'arText':
          'حلول تعبئة وتغليف متخصصة مصممة لتلبية متطلبات قطاع المبيدات الزراعية والأدوية البيطرية.',
    },
    {
      'number': '09',
      'icon': 'assets/icons/real-product-value.svg',
      'enTitle': 'Real Product Value',
      'arTitle': 'إضافة قيمة حقيقية',
      'enText':
          'Strict quality standards help deliver packaging that strengthens product value and supports our customers’ market presence.',
      'arText':
          'الالتزام بمعايير جودة صارمة لتقديم عبوات تعزز قيمة المنتجات وتدعم حضور عملائنا في السوق.',
    },
    {
      'number': '10',
      'icon': 'assets/icons/innovative-packaging.svg',
      'enTitle': 'Innovative Packaging Solutions',
      'arTitle': 'حلول تغليف وتعبئة مبتكرة',
      'enText':
          'Innovative packaging solutions provide high resistance to chemical interaction while maintaining efficient performance and cost effectiveness.',
      'arText':
          'حلول تغليف مبتكرة توفر مقاومة عالية للمواد الكيميائية والتفاعلات، مع الحفاظ على كفاءة الأداء والجدوى الاقتصادية.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int columns = 3;

              if (constraints.maxWidth <= 1000) {
                columns = 2;
              }

              if (constraints.maxWidth <= 650) {
                columns = 1;
              }

              final width =
                  (constraints.maxWidth -
                          ((columns - 1) * 18)) /
                      columns;

              return Wrap(
                spacing: 18,
                runSpacing: 18,
                children: features.map((feature) {
                  return SizedBox(
                    width: width,
                    child: _FeatureCard(
                      feature: feature,
                      isArabic: isArabic,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ============================================================
// FEATURE CARD
// ============================================================

class _FeatureCard extends StatefulWidget {
  final Map<String, String> feature;
  final bool isArabic;

  const _FeatureCard({
    required this.feature,
    required this.isArabic,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final feature = widget.feature;
    final isArabic = widget.isArabic;

    return MouseRegion(
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
        duration: const Duration(milliseconds: 300),
        transform: hovering
            ? (Matrix4.identity()
              ..translate(0.0, -6.0)
              ..scale(1.01))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
        constraints: const BoxConstraints(
          minHeight: 310,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: hovering
                ? const Color(0xFF8FD1BD)
                : const Color(0xFFDCE8DF),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: hovering ? 0.12 : 0.06,
              ),
              blurRadius: hovering ? 30 : 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isArabic
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  _iconPath(feature['icon']!),
                  width: 52,
                  height: 52,
                  errorBuilder: (_, __, ___) {
                    return const SizedBox(
                      width: 52,
                      height: 52,
                    );
                  },
                ),

                Text(
                  feature['number']!,
                  style: const TextStyle(
                    color: Color(0xFFE2B94F),
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              isArabic
                  ? feature['arTitle']!
                  : feature['enTitle']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF1F2D26),
                fontFamily: isArabic ? 'Cairo' : 'Inter',
                fontSize: isArabic ? 21 : 20,
                fontWeight: FontWeight.w800,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 14),

            Text(
              isArabic
                  ? feature['arText']!
                  : feature['enText']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF6B7D73),
                fontFamily: isArabic ? 'Cairo' : 'Inter',
                fontSize: isArabic ? 16 : 15.5,
                height: isArabic ? 1.9 : 1.75,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _iconPath(String path) {
    return path;
  }
}

// ============================================================
// MISSION
// ============================================================

class _MissionSection extends StatelessWidget {
  final bool isArabic;

  const _MissionSection({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: const Color(0xFF1F4532),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.12,
                  ),
                  blurRadius: 40,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: isArabic
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                _SectionLabel(
                  text: isArabic
                      ? 'مهمتنا'
                      : 'OUR MISSION',
                  light: true,
                  isArabic: isArabic,
                ),

                const SizedBox(height: 24),

                Text(
                  isArabic
                      ? 'شريك موثوق للنمو على المدى الطويل.'
                      : 'A reliable partner for long-term growth.',
                  textAlign: isArabic
                      ? TextAlign.right
                      : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: MediaQuery.of(context).size.width > 700
                        ? 38
                        : 29,
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  isArabic
                      ? 'أن نكون شريكًا موثوقًا على المدى الطويل، نلتزم بتقديم جودة ثابتة، وخبرة فنية متخصصة، وحلول تعبئة وتغليف متطورة تساهم في دعم نمو عملائنا وتعزيز نجاحهم.'
                      : 'To be a reliable long-term partner, delivering consistent quality, technical expertise, and packaging solutions that support our customers’ growth and success.',
                  textAlign: isArabic
                      ? TextAlign.right
                      : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(
                      alpha: 0.84,
                    ),
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 18,
                    height: isArabic ? 2 : 1.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STRENGTH
// ============================================================

class _StrengthSection extends StatelessWidget {
  final bool isArabic;

  const _StrengthSection({
    required this.isArabic,
  });

  static const List<Map<String, String>> strengths = [
    {
      'number': '01',
      'en': 'Advanced manufacturing technologies',
      'ar': 'تقنيات تصنيع متقدمة',
    },
    {
      'number': '02',
      'en': 'Customized packaging solutions',
      'ar': 'حلول تعبئة وتغليف مخصصة',
    },
    {
      'number': '03',
      'en': 'Consistent quality & cost efficiency',
      'ar': 'جودة ثابتة وكفاءة اقتصادية',
    },
    {
      'number': '04',
      'en': 'Professional technical support',
      'ar': 'دعم فني متخصص',
    },
    {
      'number': '05',
      'en': 'Reliable supply & long-term partnership',
      'ar': 'توريد موثوق وشراكة طويلة الأمد',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        20,
        90,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment: isArabic
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              _SectionLabel(
                text: isArabic
                    ? 'نقاط قوتنا'
                    : 'OUR STRENGTH',
                light: false,
                isArabic: isArabic,
              ),

              const SizedBox(height: 28),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile =
                      constraints.maxWidth <= 700;

                  return Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    children: strengths.map((strength) {
                      final width = isMobile
                          ? constraints.maxWidth
                          : (constraints.maxWidth - 18) / 2;

                      return SizedBox(
                        width: width,
                        child: _StrengthCard(
                          strength: strength,
                          isArabic: isArabic,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// STRENGTH CARD
// ============================================================

class _StrengthCard extends StatefulWidget {
  final Map<String, String> strength;
  final bool isArabic;

  const _StrengthCard({
    required this.strength,
    required this.isArabic,
  });

  @override
  State<_StrengthCard> createState() => _StrengthCardState();
}

class _StrengthCardState extends State<_StrengthCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final isArabic = widget.isArabic;

    return MouseRegion(
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
        duration: const Duration(milliseconds: 280),
        transform: hovering
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 26,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hovering
                ? const Color(0xFFBFD9CF)
                : const Color(0xFFDCE8DF),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: hovering ? 0.09 : 0.045,
              ),
              blurRadius: hovering ? 25 : 15,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF6F1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  widget.strength['number']!,
                  style: const TextStyle(
                    color: Color(0xFF356C4D),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Text(
                isArabic
                    ? widget.strength['ar']!
                    : widget.strength['en']!,
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF1F2D26),
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: isArabic ? 17 : 17,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SECTION LABEL
// ============================================================

class _SectionLabel extends StatelessWidget {
  final String text;
  final bool light;
  final bool isArabic;

  const _SectionLabel({
    required this.text,
    required this.light,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = light
        ? const Color(0xFF8FD1BD)
        : const Color(0xFF356C4D);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isArabic
          ? [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 26,
                height: 2,
                color: textColor,
              ),
            ]
          : [
              Container(
                width: 26,
                height: 2,
                color: textColor,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.4,
                ),
              ),
            ],
    );
  }
}