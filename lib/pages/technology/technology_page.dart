import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class TechnologyPage extends StatelessWidget {
  const TechnologyPage({super.key});

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

                  _TechnologyHero(
                    isArabic: isArabic,
                  ),

                  _CoexSection(
                    isArabic: isArabic,
                  ),

                  _ImlDefinition(
                    isArabic: isArabic,
                  ),

                  _AdvantagesSection(
                    isArabic: isArabic,
                  ),

                  _ImlProcessSection(
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
// HERO
// ============================================================

class _TechnologyHero extends StatelessWidget {
  final bool isArabic;

  const _TechnologyHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
      ),
      color: const Color(0xFF1F4532),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final mobile = constraints.maxWidth < 800;

              final content = Column(
                crossAxisAlignment: isArabic
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  _TechEyebrow(
                    text: isArabic
                        ? 'تقنيات التغليف المتقدمة'
                        : 'ADVANCED PACKAGING TECHNOLOGY',
                    light: true,
                    isArabic: isArabic,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isArabic
                        ? 'تقنية Co-Ex رباعية الطبقات وملصق IML مدمج'
                        : '4-Layer Co-Ex Technology Integrated IML',
                    textAlign: isArabic
                        ? TextAlign.right
                        : TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily:
                          isArabic ? 'Cairo' : 'Inter',
                      fontSize: mobile ? 34 : 48,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      letterSpacing: isArabic ? 0 : -1,
                    ),
                  ),
                ],
              );

              final image = ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/coex-layers-1.webp',
                  width: double.infinity,
                  height: mobile ? 260 : 390,
                  fit: BoxFit.cover,
                ),
              );

              if (mobile) {
                return Column(
                  children: [
                    content,
                    const SizedBox(height: 35),
                    image,
                  ],
                );
              }

              return Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: content,
                  ),
                  const SizedBox(width: 45),
                  Expanded(
                    flex: 5,
                    child: image,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ============================================================
// COEX
// ============================================================

class _CoexSection extends StatelessWidget {
  final bool isArabic;

  const _CoexSection({
    required this.isArabic,
  });

  static const layers = [
    {
      'number': '01',
      'enTitle': 'Barrier Layer',
      'arTitle': 'طبقة الحاجز',
      'material': 'EVOH / PA',
      'enText':
          'The barrier layer introduces dedicated barrier properties within the multilayer structure.',
      'arText':
          'تضيف طبقة الحاجز خصائص حاجزة متخصصة إلى الهيكل متعدد الطبقات.',
    },
    {
      'number': '02',
      'enTitle': 'Tie Layer',
      'arTitle': 'طبقة الربط',
      'material': 'Tie / Adhesive',
      'enText':
          'The tie layer connects the relevant materials within the multilayer structure, helping maintain the integrity of the combined layers.',
      'arText':
          'تعمل طبقة الربط على وصل المواد المختلفة داخل الهيكل متعدد الطبقات، بما يساعد على الحفاظ على تكامل الطبقات المدمجة.',
    },
    {
      'number': '03',
      'enTitle': 'Structural Layer',
      'arTitle': 'الطبقة الهيكلية',
      'material': 'HDPE / Structure',
      'enText':
          'The structural substrate contributes to the physical structure of the container and works together with the other layers as part of the complete package.',
      'arText':
          'تساهم الطبقة الهيكلية في البنية الفيزيائية للعبوة وتعمل مع باقي الطبقات كجزء من هيكل العبوة الكامل.',
    },
    {
      'number': '04',
      'enTitle': 'Outer Layer',
      'arTitle': 'الطبقة الخارجية',
      'material': 'HDPE',
      'enText':
          "HDPE is identified as the outer layer in the supplied 4-layer COEX structure, forming part of the container's external material system.",
      'arText':
          'تم تحديد HDPE باعتباره الطبقة الخارجية في هيكل Co-Ex رباعي الطبقات المقدم، ليشكل جزءًا من النظام المادي الخارجي للعبوة.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
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
              _TechEyebrow(
                text: isArabic
                    ? 'تقنية Co-Ex رباعية الطبقات'
                    : '4-LAYER COEX TECHNOLOGY',
                isArabic: isArabic,
              ),

              const SizedBox(height: 18),

              Text(
                isArabic
                    ? 'أربع طبقات. أربعة أدوار. هيكل Co-Ex متكامل واحد.'
                    : 'Four layers. Four roles. One integrated structure.',
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF1F2D26),
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                isArabic
                    ? 'تعرض المواصفات التقنية المقدمة من MISR هيكل Co-Ex متعدد الطبقات مكوّنًا من أربع طبقات، يجمع بين وظائف الحاجز والربط والهيكل والطبقة الخارجية.'
                    : "MISR's supplied technology specification presents a 4-layer Co-Ex multilayer packaging structure combining barrier, bonding, structural and outer-layer functions.",
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF6B7D73),
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 17,
                  height: 1.85,
                ),
              ),

              const SizedBox(height: 35),

              // Layer order
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFDCE8DF),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: isArabic
                      ? [
                          Text(
                            'الخارج',
                            style: _orderStyle(),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color(0xFFE2B94F),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'الداخل',
                            style: _orderStyle(),
                          ),
                          const SizedBox(width: 18),
                          Text(
                            'ترتيب الطبقات',
                            style: TextStyle(
                              color:
                                  const Color(0xFF356C4D),
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            'LAYER ORDER',
                            style: TextStyle(
                              color:
                                  const Color(0xFF356C4D),
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight:
                                  FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(width: 18),
                          Text(
                            'Inside',
                            style: _orderStyle(),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: Color(0xFFE2B94F),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Outside',
                            style: _orderStyle(),
                          ),
                        ],
                ),
              ),

              const SizedBox(height: 25),

              LayoutBuilder(
                builder: (context, constraints) {
                  final twoColumns =
                      constraints.maxWidth > 800;

                  final width = twoColumns
                      ? (constraints.maxWidth - 18) / 2
                      : constraints.maxWidth;

                  return Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    children: layers.map((layer) {
                      return SizedBox(
                        width: width,
                        child: _LayerCard(
                          layer: layer,
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

  TextStyle _orderStyle() {
    return const TextStyle(
      color: Color(0xFF1F2D26),
      fontSize: 14,
      fontWeight: FontWeight.w800,
    );
  }
}

// ============================================================
// LAYER CARD
// ============================================================

class _LayerCard extends StatefulWidget {
  final Map<String, String> layer;
  final bool isArabic;

  const _LayerCard({
    required this.layer,
    required this.isArabic,
  });

  @override
  State<_LayerCard> createState() => _LayerCardState();
}

class _LayerCardState extends State<_LayerCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final layer = widget.layer;
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
        duration: const Duration(milliseconds: 250),
        transform: hovering
            ? (Matrix4.identity()..translate(0.0, -5.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 44,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF7F3),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      layer['number']!,
                      style: const TextStyle(
                        color: Color(0xFF006B52),
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),

                Text(
                  layer['material']!,
                  style: const TextStyle(
                    color: Color(0xFFE2B94F),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              isArabic
                  ? layer['arTitle']!
                  : layer['enTitle']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF1F2D26),
                fontFamily:
                    isArabic ? 'Cairo' : 'Inter',
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              isArabic
                  ? layer['arText']!
                  : layer['enText']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF596861),
                fontFamily:
                    isArabic ? 'Cairo' : 'Inter',
                fontSize: 15.5,
                height: isArabic ? 1.9 : 1.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// IML DEFINITION
// ============================================================

class _ImlDefinition extends StatelessWidget {
  final bool isArabic;

  const _ImlDefinition({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1F4532),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final mobile =
                  constraints.maxWidth < 800;

              final text = Column(
                crossAxisAlignment: isArabic
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  _TechEyebrow(
                    text: isArabic
                        ? 'تقنية IML'
                        : 'IN-MOLD LABELING',
                    light: true,
                    isArabic: isArabic,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isArabic
                        ? 'ملصق مدمج داخل عملية تصنيع العبوة.'
                        : 'Integrated labeling during package manufacturing.',
                    textAlign: isArabic
                        ? TextAlign.right
                        : TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily:
                          isArabic ? 'Cairo' : 'Inter',
                      fontSize: mobile ? 29 : 38,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    isArabic
                        ? 'تتيح تقنية IML دمج الملصق أثناء تصنيع العبوة، لتصبح الرسومات والبيانات جزءًا من العبوة نفسها.'
                        : 'IML integrates the label during package manufacturing, making graphics and product information part of the package itself.',
                    textAlign: isArabic
                        ? TextAlign.right
                        : TextAlign.left,
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: 0.86,
                      ),
                      fontFamily:
                          isArabic ? 'Cairo' : 'Inter',
                      fontSize: 17,
                      height: 1.9,
                    ),
                  ),
                ],
              );

              final image = ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/iml-process1.webp',
                  width: double.infinity,
                  height: mobile ? 250 : 360,
                  fit: BoxFit.cover,
                ),
              );

              if (mobile) {
                return Column(
                  children: [
                    text,
                    const SizedBox(height: 35),
                    image,
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: text,
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: image,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ADVANTAGES
// ============================================================

class _AdvantagesSection extends StatelessWidget {
  final bool isArabic;

  const _AdvantagesSection({
    required this.isArabic,
  });

  static const advantages = [
    {
      'number': '01',
      'enTitle': 'Water & Humidity Resistance',
      'arTitle': 'مقاومة الماء والرطوبة',
      'enText':
          'Helps maintain label appearance and readability in demanding conditions.',
      'arText':
          'يساعد على الحفاظ على مظهر الملصق ووضوحه في الظروف المختلفة.',
    },
    {
      'number': '02',
      'enTitle': 'Chemical Resistance',
      'arTitle': 'مقاومة المواد الكيميائية',
      'enText':
          'Supports label durability when exposed to demanding chemicals and solvents.',
      'arText':
          'يدعم متانة الملصق عند التعرض للمواد الكيميائية والمذيبات.',
    },
    {
      'number': '03',
      'enTitle': 'Integrated Label',
      'arTitle': 'ملصق مدمج',
      'enText':
          'The label becomes integrated with the package during manufacturing.',
      'arText':
          'يصبح الملصق مدمجًا مع العبوة أثناء عملية التصنيع.',
    },
    {
      'number': '04',
      'enTitle': 'Anti-Counterfeit Support',
      'arTitle': 'دعم مكافحة التزوير',
      'enText':
          'Integrated labeling makes removal and replacement more difficult.',
      'arText':
          'الملصق المدمج يجعل الإزالة والاستبدال أكثر صعوبة.',
    },
    {
      'number': '05',
      'enTitle': 'Friction Resistance',
      'arTitle': 'مقاومة الاحتكاك',
      'enText':
          'Maintains package information during handling and transportation.',
      'arText':
          'يحافظ على بيانات العبوة أثناء التداول والنقل.',
    },
    {
      'number': '06',
      'enTitle': 'Solvent Resistance',
      'arTitle': 'مقاومة المذيبات',
      'enText':
          'Supports durability in applications where solvents may be present.',
      'arText':
          'يدعم المتانة في التطبيقات التي قد تتعرض للمذيبات.',
    },
    {
      'number': '07',
      'enTitle': 'Transportation and Storage Durability',
      'arTitle': 'تحمل ظروف النقل والتخزين',
      'enText':
          'Maintains package appearance and information during handling and storage.',
      'arText':
          'يحافظ على مظهر العبوة وبياناتها خلال التداول والتخزين.',
    },
    {
      'number': '08',
      'enTitle': 'High Code Accuracy',
      'arTitle': 'دقة عالية للأكواد',
      'enText':
          'Maintains data and warnings during transportation and handling.',
      'arText':
          'يحافظ على البيانات والتحذيرات أثناء النقل والتداول.',
    },
    {
      'number': '09',
      'enTitle': 'Excellent Stability on Round Packages',
      'arTitle': 'ثبات ممتاز على العبوات المستديرة',
      'enText':
          'Prevents wrinkles, bubbles and edge peeling.',
      'arText':
          'يمنع التجاعيد والفقاعات وتقشر الحواف.',
    },
    {
      'number': '10',
      'enTitle': 'High Print Quality',
      'arTitle': 'جودة طباعة عالية',
      'enText':
          'Supports graphics, images, fine details, Barcode and QR Code.',
      'arText':
          'يدعم الرسومات والصور والتفاصيل الدقيقة والـ Barcode وQR Code.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
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
              _TechEyebrow(
                text: isArabic
                    ? 'مزايا IML'
                    : 'IML ADVANTAGES',
                isArabic: isArabic,
              ),

              const SizedBox(height: 25),

              Text(
                isArabic
                    ? 'مزايا عملية وتقنية للعبوة'
                    : 'Practical and technical advantages.',
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF1F2D26),
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 35),

              LayoutBuilder(
                builder: (context, constraints) {
                  final twoColumns =
                      constraints.maxWidth > 800;

                  final width = twoColumns
                      ? (constraints.maxWidth - 18) / 2
                      : constraints.maxWidth;

                  return Wrap(
                    spacing: 18,
                    runSpacing: 18,
                    children:
                        advantages.map((advantage) {
                      return SizedBox(
                        width: width,
                        child: _AdvantageCard(
                          advantage: advantage,
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
// ADVANTAGE CARD
// ============================================================

class _AdvantageCard extends StatefulWidget {
  final Map<String, String> advantage;
  final bool isArabic;

  const _AdvantageCard({
    required this.advantage,
    required this.isArabic,
  });

  @override
  State<_AdvantageCard> createState() =>
      _AdvantageCardState();
}

class _AdvantageCardState extends State<_AdvantageCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.advantage;
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
        duration: const Duration(milliseconds: 240),
        transform: hovering
            ? (Matrix4.identity()..translate(0.0, -5.0))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(28),
        constraints: const BoxConstraints(
          minHeight: 180,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: hovering
                ? const Color(0xFFBFD9CF)
                : const Color(0xFFDCE8DF),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: hovering ? 0.085 : 0.045,
              ),
              blurRadius: hovering ? 28 : 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isArabic
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFEDF7F3),
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Text(
                data['number']!,
                style: const TextStyle(
                  color: Color(0xFF006B52),
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              isArabic
                  ? data['arTitle']!
                  : data['enTitle']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF1F2D26),
                fontFamily:
                    isArabic ? 'Cairo' : 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.w800,
                height: 1.45,
              ),
            ),

            const SizedBox(height: 9),

            Text(
              isArabic
                  ? data['arText']!
                  : data['enText']!,
              textAlign: isArabic
                  ? TextAlign.right
                  : TextAlign.left,
              style: TextStyle(
                color: const Color(0xFF596861),
                fontFamily:
                    isArabic ? 'Cairo' : 'Inter',
                fontSize: 14.5,
                height: isArabic ? 1.85 : 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// IML PROCESS
// ============================================================

class _ImlProcessSection extends StatelessWidget {
  final bool isArabic;

  const _ImlProcessSection({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFEAF2EE),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 80,
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
              _TechEyebrow(
                text: isArabic
                    ? 'عملية تصنيع IML'
                    : 'IML MANUFACTURING PROCESS',
                isArabic: isArabic,
              ),

              const SizedBox(height: 18),

              Text(
                isArabic
                    ? 'دمج الملصق أثناء تصنيع العبوة.'
                    : 'Integrated labeling during package manufacturing.',
                textAlign: isArabic
                    ? TextAlign.right
                    : TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF1F2D26),
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 35),

              LayoutBuilder(
                builder: (context, constraints) {
                  final mobile =
                      constraints.maxWidth < 800;

                  final first = _TechImageBox(
                    title: '01 — COEX',
                    image:
                        'assets/images/iml-machine.webp',
                  );

                  final second = _TechImageBox(
                    title: '02 — IML',
                    image:
                        'assets/images/iml-process.webp',
                  );

                  if (mobile) {
                    return Column(
                      children: [
                        first,
                        const SizedBox(height: 20),
                        second,
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Expanded(child: first),
                      const SizedBox(width: 20),
                      Expanded(child: second),
                    ],
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
// TECHNOLOGY IMAGE BOX
// ============================================================

class _TechImageBox extends StatefulWidget {
  final String title;
  final String image;

  const _TechImageBox({
    required this.title,
    required this.image,
  });

  @override
  State<_TechImageBox> createState() =>
      _TechImageBoxState();
}

class _TechImageBoxState extends State<_TechImageBox> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
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
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: hovering
                ? const Color(0xFF8FD1BD)
                : const Color(0xFFDCE8DF),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: hovering ? 0.10 : 0.05,
              ),
              blurRadius: hovering ? 30 : 18,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF356C4D),
                fontSize: 13,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                widget.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// EYEBROW
// ============================================================

class _TechEyebrow extends StatelessWidget {
  final String text;
  final bool light;
  final bool isArabic;

  const _TechEyebrow({
    required this.text,
    required this.isArabic,
    this.light = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = light
        ? const Color(0xFF8FD1BD)
        : const Color(0xFF356C4D);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isArabic
          ? [
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 26,
                height: 2,
                color: color,
              ),
            ]
          : [
              Container(
                width: 26,
                height: 2,
                color: color,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
    );
  }
}