import 'package:flutter/material.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class QualityPage extends StatelessWidget {
  const QualityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppState.isArabic,
      builder: (context, isArabic, _) {
        return Directionality(
          textDirection:
              isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SiteHeader(),
                  QualityHero(isArabic: isArabic),
                  QualityIntroduction(isArabic: isArabic),
                  FeaturedTests(isArabic: isArabic),
                  QualityTesting(isArabic: isArabic),
                  QualityFramework(isArabic: isArabic),
                  SafetySection(isArabic: isArabic),
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

class QualityHero extends StatelessWidget {
  final bool isArabic;

  const QualityHero({
    super.key,
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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFBFCFB),
            Color(0xFFF4F8F5),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Eyebrow(
                text: isArabic
                    ? 'الجودة والمطابقة'
                    : 'Quality & Compliance',
                isArabic: isArabic,
              ),

              const SizedBox(height: 22),

              Text(
                isArabic
                    ? 'الجودة جزء أساسي من كل مرحلة في عملية تصنيع العبوة.'
                    : 'Quality built into every stage of the packaging process.',
                style: const TextStyle(
                  color: Color(0xFF12372D),
                  fontSize: 39,
                  height: 1.22,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                isArabic
                    ? 'تطبق شركة مصر نظامًا منظمًا لمراقبة الجودة يشمل الخامات، والمظهر الخارجي والداخلي للعبوة، والبنية متعددة الطبقات، واختبارات التسرب، وأداء الحواجز، والخواص الفيزيائية، والتحقق النهائي من مطابقة المنتج.'
                    : 'MISR Company applies a structured quality-control approach covering raw materials, container appearance, multilayer structure, leakage performance, barrier properties, physical strength and final product verification.',
                style: const TextStyle(
                  color: Color(0xFF66736D),
                  fontSize: 17,
                  height: 1.9,
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
// QUALITY INTRODUCTION
// ============================================================

class QualityIntroduction extends StatelessWidget {
  final bool isArabic;

  const QualityIntroduction({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return _Section(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final mobile = constraints.maxWidth < 800;

          final content = [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Eyebrow(
                    text: isArabic
                        ? 'منهجنا في الجودة'
                        : 'Our Quality Approach',
                    isArabic: isArabic,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isArabic
                        ? 'ثبات الجودة والحماية والأداء الموثوق.'
                        : 'Consistency, protection and reliable performance.',
                    style: const TextStyle(
                      color: Color(0xFF12372D),
                      fontSize: 30,
                      height: 1.3,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    isArabic
                        ? 'تمتد مراقبة الجودة من فحص الخامات وظروف التشغيل إلى الاختبارات التفصيلية للعبوة النهائية. والهدف هو ضمان أداء موثوق للعبوة أثناء التداول والتخزين والاستخدام.'
                        : 'Quality control extends from material inspection and process conditions to detailed testing of the finished container. The objective is to ensure that each packaging solution performs reliably throughout handling, storage and use.',
                    style: const TextStyle(
                      color: Color(0xFF66736D),
                      fontSize: 15,
                      height: 1.85,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 45, height: 30),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xFF12372D),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .08),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic
                          ? 'تركيز الجودة'
                          : 'Quality Focus',
                      style: const TextStyle(
                        color: Color(0xFFD8B77A),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      isArabic
                          ? 'من الخامة إلى المنتج النهائي.'
                          : 'From raw material to finished product.',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.35,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      isArabic
                          ? 'تعمل الفحوص والاختبارات والتوثيق وإمكانية التتبع معًا للحفاظ على ثبات أداء التصنيع.'
                          : 'Inspection, testing, documentation and traceability work together to maintain consistent manufacturing performance.',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: .75),
                        fontSize: 14,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];

          if (mobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                content[0],
                const SizedBox(height: 30),
                content[2],
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: content,
          );
        },
      ),
    );
  }
}

// ============================================================
// FEATURED TESTS
// ============================================================

class FeaturedTests extends StatelessWidget {
  final bool isArabic;

  const FeaturedTests({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final tests = [
      {
        'number': '01',
        'eyebrow': isArabic ? 'المتانة' : 'Strength',
        'title': isArabic ? 'اختبار الضغط' : 'Compression Test',
        'text': isArabic
            ? 'يقيّم قدرة العبوة على مقاومة الضغط وأحمال الرص.'
            : "Evaluates the container's resistance to compression and stacking loads.",
      },
      {
        'number': '02',
        'eyebrow': isArabic ? 'مقاومة الصدمات' : 'Impact',
        'title': isArabic ? 'جهاز اختبار السقوط' : 'Drop Test Rig',
        'text': isArabic
            ? 'يتحقق من أداء العبوة بعد التعرض لظروف سقوط وصدمات محكومة.'
            : 'Checks container performance after controlled impact and drop conditions.',
      },
      {
        'number': '03',
        'eyebrow': isArabic ? 'سلامة العبوة' : 'Integrity',
        'title': isArabic ? 'اختبار التسريب' : 'Leak Test',
        'text': isArabic
            ? 'يتحقق من سلامة العبوة ويساعد على اكتشاف أي تسرب غير مرغوب.'
            : 'Verifies container integrity and helps identify unwanted leakage.',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F8F5),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 90,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Eyebrow(
                text: isArabic
                    ? 'اختبارات أساسية'
                    : 'Featured Tests',
                isArabic: isArabic,
              ),

              const SizedBox(height: 15),

              Text(
                isArabic
                    ? 'اختبارات عملية للتحقق من أداء العبوة في الاستخدام الفعلي.'
                    : 'Practical testing for real packaging performance.',
                style: const TextStyle(
                  color: Color(0xFF12372D),
                  fontSize: 30,
                  height: 1.3,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                isArabic
                    ? 'توفر اختبارات الضغط والسقوط والتسريب فحوصًا عملية للتحقق من المتانة ومقاومة الصدمات وسلامة العبوة.'
                    : 'Compression, drop and leak testing provide practical checks for structural strength, impact resistance and container integrity.',
                style: const TextStyle(
                  color: Color(0xFF66736D),
                  fontSize: 15,
                  height: 1.8,
                ),
              ),

              const SizedBox(height: 35),

              LayoutBuilder(
                builder: (context, constraints) {
                  final mobile = constraints.maxWidth < 800;

                  if (mobile) {
                    return Column(
                      children: [
                        for (int i = 0; i < tests.length; i++) ...[
                          _FeaturedTestCard(
                            data: tests[i],
                          ),
                          if (i != tests.length - 1)
                            const SizedBox(height: 18),
                        ],
                      ],
                    );
                  }

                  return Row(
                    children: [
                      for (int i = 0; i < tests.length; i++)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: i == tests.length - 1 ? 0 : 9,
                              left: i == 0 ? 0 : 9,
                            ),
                            child: _FeaturedTestCard(
                              data: tests[i],
                            ),
                          ),
                        ),
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

class _FeaturedTestCard extends StatelessWidget {
  final Map<String, String> data;

  const _FeaturedTestCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 260),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFDCE8DF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .035),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF164D3C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              data['number']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            data['eyebrow']!,
            style: const TextStyle(
              color: Color(0xFF145C4A),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            data['title']!,
            style: const TextStyle(
              color: Color(0xFF12372D),
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            data['text']!,
            style: const TextStyle(
              color: Color(0xFF66736D),
              fontSize: 14,
              height: 1.75,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUALITY TESTING - 15 TESTS
// ============================================================

class QualityTesting extends StatelessWidget {
  final bool isArabic;

  const QualityTesting({
    super.key,
    required this.isArabic,
  });

  List<Map<String, String>> get tests => [
        {
          'number': '01',
          'enTitle': 'Outer Surface',
          'arTitle': 'السطح الخارجي',
          'enText':
              'The outer surface should be smooth and free from lines, dust or visible defects.',
          'arText':
              'يجب أن يكون السطح الخارجي أملس وخاليًا من الخطوط والأتربة والعيوب الظاهرة.',
        },
        {
          'number': '02',
          'enTitle': 'External Appearance',
          'arTitle': 'المظهر الخارجي',
          'enText':
              'Color uniformity, surface cleanliness, welding points and neck-edge quality are checked.',
          'arText':
              'يتم فحص تجانس اللون ونظافة السطح وجودة نقاط اللحام وحافة العنق.',
        },
        {
          'number': '03',
          'enTitle': 'Internal Appearance',
          'arTitle': 'المظهر الداخلي',
          'enText':
              'The inner surface should remain smooth with balanced PE material distribution.',
          'arText':
              'يجب أن يكون السطح الداخلي أملس مع توزيع متوازن لمادة PE.',
        },
        {
          'number': '04',
          'enTitle': 'Compliance Tests',
          'arTitle': 'اختبارات المطابقة',
          'enText':
              'General checks are performed to verify that the container conforms to the applicable specifications.',
          'arText':
              'يتم إجراء فحوص عامة للتحقق من مطابقة العبوة للمواصفات والمتطلبات المعمول بها.',
        },
        {
          'number': '05',
          'enTitle': 'Drop Test',
          'arTitle': 'اختبار السقوط',
          'enText':
              'The supplied material specifies a 3-meter drop test without cracking or damage to the container.',
          'arText':
              'تحدد المادة المصدرية اختبار سقوط من ارتفاع 3 أمتار دون حدوث تشقق أو تلف في العبوة.',
        },
        {
          'number': '06',
          'enTitle': 'PA Layer Test',
          'arTitle': 'اختبار طبقة PA',
          'enText':
              'The PA barrier layer is evaluated for thickness, weight and chemical interaction.',
          'arText':
              'يتم التحقق من طبقة PA من حيث السمك والوزن والتفاعل الكيميائي.',
        },
        {
          'number': '07',
          'enTitle': 'Underwater Pressure Test',
          'arTitle': 'اختبار الضغط تحت الماء',
          'enText':
              'The container is checked under pressure to ensure that no air bubbles appear.',
          'arText':
              'يتم فحص العبوة تحت الضغط للتأكد من عدم ظهور فقاعات هواء.',
        },
        {
          'number': '08',
          'enTitle': 'Leakage Test',
          'arTitle': 'اختبار التسرب',
          'enText':
              'Leakage performance can be checked using air or colored water to identify unwanted leakage.',
          'arText':
              'يتم اختبار التسرب باستخدام الهواء أو الماء الملون للكشف عن أي تسرب غير مرغوب.',
        },
        {
          'number': '09',
          'enTitle': 'Air Leakage',
          'arTitle': 'تسرب الهواء',
          'enText':
              'The container is checked to ensure that air does not escape through the packaging.',
          'arText':
              'يتم فحص العبوة للتأكد من عدم تسرب الهواء من خلالها.',
        },
        {
          'number': '10',
          'enTitle': 'Liquid Permeability',
          'arTitle': 'نفاذية السوائل',
          'enText':
              'Weight loss is monitored over time to evaluate liquid permeability.',
          'arText':
              'تتم مراقبة فقد الوزن بمرور الوقت لتقييم نفاذية السوائل.',
        },
        {
          'number': '11',
          'enTitle': 'Compression Resistance',
          'arTitle': 'مقاومة الضغط',
          'enText':
              'The container is evaluated under heat or heavy loads to assess its compression resistance.',
          'arText':
              'يتم تقييم العبوة تحت الحرارة أو الأحمال الثقيلة للتحقق من مقاومتها للضغط.',
        },
        {
          'number': '12',
          'enTitle': 'Thickness Test',
          'arTitle': 'اختبار السمك',
          'enText':
              'Thickness is checked across the different areas of the container to ensure uniformity.',
          'arText':
              'يتم فحص السمك في أجزاء العبوة المختلفة للتأكد من تجانسه.',
        },
        {
          'number': '13',
          'enTitle': 'Container Stability',
          'arTitle': 'ثبات العبوة',
          'enText':
              'The container is checked for stability when positioned on a flat surface.',
          'arText':
              'يتم فحص ثبات العبوة عند وضعها على سطح مستوٍ.',
        },
        {
          'number': '14',
          'enTitle': 'Cracking Test',
          'arTitle': 'اختبار التشقق',
          'enText':
              'The container is evaluated under stress to ensure that cracks do not develop.',
          'arText':
              'يتم تقييم العبوة تحت الإجهاد للتأكد من عدم حدوث تشققات.',
        },
        {
          'number': '15',
          'enTitle': 'Chemical Resistance',
          'arTitle': 'المقاومة الكيميائية',
          'enText':
              'The supplied material specifies no effect on the container after 28 days at 60°C.',
          'arText':
              'تحدد المادة المصدرية عدم حدوث تأثير على العبوة بعد 28 يومًا عند درجة حرارة 60°م.',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Eyebrow(
            text: isArabic
                ? 'اختبارات الجودة'
                : 'Quality Testing',
            isArabic: isArabic,
          ),

          const SizedBox(height: 15),

          Text(
            isArabic
                ? 'نظام اختبارات منظم للتحقق من أداء العبوة.'
                : 'A structured testing system for packaging performance.',
            style: const TextStyle(
              color: Color(0xFF12372D),
              fontSize: 30,
              height: 1.3,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            isArabic
                ? 'يغطي نظام الجودة المظهر والمتانة والتسرب والنفاذية وأداء طبقات الحاجز والأبعاد وثبات المنتج.'
                : 'The quality system covers appearance, strength, leakage, permeability, barrier-layer performance, dimensions and product stability.',
            style: const TextStyle(
              color: Color(0xFF66736D),
              fontSize: 15,
              height: 1.8,
            ),
          ),

          const SizedBox(height: 35),

          LayoutBuilder(
            builder: (context, constraints) {
              int columns = 3;

              if (constraints.maxWidth < 900) {
                columns = 2;
              }

              if (constraints.maxWidth < 600) {
                columns = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tests.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 205,
                ),
                itemBuilder: (context, index) {
                  final test = tests[index];

                  return _TestCard(
                    number: test['number']!,
                    title: isArabic
                        ? test['arTitle']!
                        : test['enTitle']!,
                    text: isArabic
                        ? test['arText']!
                        : test['enText']!,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  final String number;
  final String title;
  final String text;

  const _TestCard({
    required this.number,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFDCE8DF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .025),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBF2),
              border: Border.all(
                color: const Color(0xFFD8B77A),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFFB08B48),
                fontSize: 10,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF12372D),
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 9),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF66736D),
                fontSize: 13,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// QUALITY FRAMEWORK
// ============================================================

class QualityFramework extends StatelessWidget {
  final bool isArabic;

  const QualityFramework({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final standards = [
      {
        'image': 'assets/images/iso-9001.webp',
        'title': 'ISO 9001',
        'en': 'Quality Management System',
        'ar': 'نظام إدارة الجودة',
      },
      {
        'image': 'assets/images/iso-45001.webp',
        'title': 'ISO 45001',
        'en': 'Occupational Health & Safety Management System',
        'ar': 'نظام إدارة الصحة والسلامة المهنية',
      },
      {
        'image': 'assets/images/iso-14001.webp',
        'title': 'ISO 14001',
        'en': 'Environmental Management System',
        'ar': 'نظام الإدارة البيئية',
      },
      {
        'image': 'assets/images/iso-22000.webp',
        'title': 'ISO 22000',
        'en': 'Food Safety Management System',
        'ar': 'نظام إدارة سلامة الغذاء',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F8F5),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final mobile = constraints.maxWidth < 800;

              final textContent = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Eyebrow(
                    text: isArabic
                        ? 'إطار الجودة'
                        : 'Quality Framework',
                    isArabic: isArabic,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    isArabic
                        ? 'جودة مدعومة بالمعايير والتوثيق وإمكانية التتبع.'
                        : 'Quality supported by documented standards and traceability.',
                    style: const TextStyle(
                      color: Color(0xFF12372D),
                      fontSize: 28,
                      height: 1.35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isArabic
                        ? 'تشير المواد المصدرية الخاصة بالشركة إلى ISO 9001 وISO 45001 وISO 14001 وISO 22000 ضمن إطار الجودة.'
                        : 'The supplied company material references ISO 9001, ISO 45001, ISO 14001 and ISO 22000 within its quality framework.',
                    style: const TextStyle(
                      color: Color(0xFF66736D),
                      fontSize: 14,
                      height: 1.8,
                    ),
                  ),
                ],
              );

              final standardsGrid = GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: standards.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 175,
                ),
                itemBuilder: (context, index) {
                  final standard = standards[index];

                  return _StandardCard(
                    image: standard['image']!,
                    title: standard['title']!,
                    description: isArabic
                        ? standard['ar']!
                        : standard['en']!,
                  );
                },
              );

              if (mobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textContent,
                    const SizedBox(height: 30),
                    standardsGrid,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: textContent),
                  const SizedBox(width: 45),
                  Expanded(child: standardsGrid),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StandardCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _StandardCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFDCE8DF),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 58,
            width: 105,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1F2D26),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF66736D),
              fontSize: 11,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SAFETY & SUSTAINABILITY
// ============================================================

class SafetySection extends StatelessWidget {
  final bool isArabic;

  const SafetySection({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return _Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Eyebrow(
            text: isArabic
                ? 'السلامة والاستدامة'
                : 'Safety & Sustainability',
            isArabic: isArabic,
          ),

          const SizedBox(height: 15),

          Text(
            isArabic
                ? 'جودة تدعم عبوات أكثر أمانًا واستخدامًا مسؤولًا.'
                : 'Quality that supports safer packaging and responsible use.',
            style: const TextStyle(
              color: Color(0xFF12372D),
              fontSize: 30,
              height: 1.3,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SHARED WIDGETS
// ============================================================

class _Section extends StatelessWidget {
  final Widget child;

  const _Section({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 90,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  final bool isArabic;

  const _Eyebrow({
    required this.text,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFF145C4A),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF145C4A),
            fontSize: isArabic ? 15 : 12,
            fontWeight: FontWeight.w900,
            letterSpacing: isArabic ? 0 : 1.5,
          ),
        ),
      ],
    );
  }
}