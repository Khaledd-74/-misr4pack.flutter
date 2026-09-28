import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../state/app_state.dart';
import '../../widgets/site_header.dart';
import '../../widgets/site_footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  bool sending = false;
  String status = '';

  @override
  void dispose() {
    nameController.dispose();
    companyController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  Future<void> sendRequest(bool isArabic) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      sending = true;
      status = '';
    });

    // Web3Forms integration will be connected after
    // the page layout is finalized.
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    if (!mounted) return;

    setState(() {
      sending = false;
      status = isArabic
          ? 'تعذر إرسال طلبك. حاول مرة أخرى.'
          : 'We could not send your enquiry. Please try again.';
    });
  }

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

                  _ContactHero(
                    isArabic: isArabic,
                  ),

                  _ContactInformation(
                    isArabic: isArabic,
                    openUrl: openUrl,
                  ),

                  _QuoteForm(
                    isArabic: isArabic,
                    formKey: _formKey,
                    nameController: nameController,
                    companyController: companyController,
                    emailController: emailController,
                    phoneController: phoneController,
                    messageController: messageController,
                    sending: sending,
                    status: status,
                    onSubmit: sendRequest,
                  ),

                  _WhatToInclude(
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


/* =========================================================
   CONTACT HERO
========================================================= */

class _ContactHero extends StatelessWidget {
  final bool isArabic;

  const _ContactHero({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F7F4),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 75,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 2,
                    color: const Color(0xFFE2B94F),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isArabic
                        ? 'تواصل مع شركة مصر'
                        : 'Contact MISR Company',
                    style: TextStyle(
                      fontFamily:
                          isArabic ? 'Cairo' : 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF356C4D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                isArabic
                    ? 'ابدأ نقاشًا حول متطلبات التعبئة.'
                    : 'Start a packaging conversation.',
                style: TextStyle(
                  fontFamily:
                      isArabic ? 'Cairo' : 'Inter',
                  fontSize: 40,
                  height: 1.2,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F2D26),
                ),
              ),

              const SizedBox(height: 16),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 680,
                ),
                child: Text(
                  isArabic
                      ? 'نرحب بالاستفسارات وطلبات التعبئة والتغليف. استخدم بيانات التواصل الواردة أو أرسل متطلباتك من خلال النموذج أدناه.'
                      : 'We welcome enquiries and packaging requests. Use the supplied contact details or send your requirement through the form below.',
                  style: TextStyle(
                    fontFamily:
                        isArabic ? 'Cairo' : 'Inter',
                    fontSize: 15,
                    height: 1.8,
                    color: const Color(0xFF6B7D73),
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


/* =========================================================
   CONTACT INFORMATION
========================================================= */

class _ContactInformation extends StatelessWidget {
  final bool isArabic;
  final Future<void> Function(String) openUrl;

  const _ContactInformation({
    required this.isArabic,
    required this.openUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        34,
        20,
        28,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1180,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              int columns;

              if (width <= 700) {
                columns = 1;
              } else if (width <= 1000) {
                columns = 2;
              } else {
                columns = 4;
              }

              final double aspectRatio;

              if (columns == 4) {
                aspectRatio = 1.65;
              } else if (columns == 2) {
                aspectRatio = 2.2;
              } else {
                aspectRatio = 4.0;
              }

              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: aspectRatio,
                children: [
                  // ADDRESS
                  _ContactCard(
                    icon: '📍',
                    title: isArabic
                        ? 'العنوان'
                        : 'Address',
                    children: [
                      Text(
                        isArabic
                            ? 'الصالحية الجديدة – المنطقة الصناعية الأولى'
                            : 'New Salhia – First Industrial Zone',
                        style: _cardTextStyle(
                          isArabic,
                        ),
                      ),
                    ],
                    onTap: () {
                      openUrl(
                        'https://maps.app.goo.gl/em2YJo2A3phjLJ5t6',
                      );
                    },
                  ),

                  // EMAIL
                  _ContactCard(
                    icon: '✉',
                    title: isArabic
                        ? 'البريد الإلكتروني'
                        : 'Email',
                    children: [
                      Text(
                        'sales@misr4pack.com',
                        style: _cardTextStyle(
                          isArabic,
                          color:
                              const Color(0xFF356C4D),
                        ),
                      ),
                    ],
                    onTap: () {
                      openUrl(
                        'mailto:sales@misr4pack.com',
                      );
                    },
                  ),

                  // WHATSAPP
                  _ContactCard(
                    icon: '◉',
                    title: isArabic
                        ? 'واتساب'
                        : 'WhatsApp',
                    children: [
                      GestureDetector(
                        onTap: () {
                          openUrl(
                            'https://wa.me/201002184066',
                          );
                        },
                        child: Text(
                          '01002184066',
                          style: _cardTextStyle(
                            isArabic,
                            color:
                                const Color(0xFF356C4D),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          openUrl(
                            'https://wa.me/201008997555',
                          );
                        },
                        child: Text(
                          '01008997555',
                          style: _cardTextStyle(
                            isArabic,
                            color:
                                const Color(0xFF356C4D),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // MOBILE
                  _ContactCard(
                    icon: '📱',
                    title: isArabic
                        ? 'موبايل'
                        : 'Mobile',
                    children: [
                      _PhoneLink(
                        number: '01002184066',
                        openUrl: openUrl,
                        isArabic: isArabic,
                      ),
                      _PhoneLink(
                        number: '01008997555',
                        openUrl: openUrl,
                        isArabic: isArabic,
                      ),
                      _PhoneLink(
                        number: '01025227271',
                        openUrl: openUrl,
                        isArabic: isArabic,
                      ),
                      _PhoneLink(
                        number: '01001397575',
                        openUrl: openUrl,
                        isArabic: isArabic,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  TextStyle _cardTextStyle(
    bool isArabic, {
    Color? color,
  }) {
    return TextStyle(
      fontFamily:
          isArabic ? 'Cairo' : 'Inter',
      fontSize: 13,
      height: 1.55,
      fontWeight: FontWeight.w600,
      color:
          color ?? const Color(0xFF6B7D73),
    );
  }
}


/* =========================================================
   PHONE LINK
========================================================= */

class _PhoneLink extends StatelessWidget {
  final String number;
  final Future<void> Function(String) openUrl;
  final bool isArabic;

  const _PhoneLink({
    required this.number,
    required this.openUrl,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openUrl('tel:$number');
      },
      child: Text(
        number,
        style: TextStyle(
          fontFamily:
              isArabic ? 'Cairo' : 'Inter',
          fontSize: 13,
          height: 1.6,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF356C4D),
        ),
      ),
    );
  }
}


/* =========================================================
   CONTACT CARD
========================================================= */

class _ContactCard extends StatefulWidget {
  final String icon;
  final String title;
  final List<Widget> children;
  final VoidCallback? onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.children,
    this.onTap,
  });

  @override
  State<_ContactCard> createState() =>
      _ContactCardState();
}

class _ContactCardState
    extends State<_ContactCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
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
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration:
              const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(16),
            border: Border.all(
              color: hovered
                  ? const Color(0xFFCBDCD4)
                  : const Color(0xFFDFE9E4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: hovered ? 0.08 : 0.045,
                ),
                blurRadius:
                    hovered ? 28 : 20,
                offset: Offset(
                  0,
                  hovered ? 12 : 6,
                ),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color(0xFFF4F8F6),
                  border: Border.all(
                    color:
                        const Color(0x1F145C4A),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.icon,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight:
                            FontWeight.w800,
                        letterSpacing: .5,
                        color:
                            Color(0xFF356C4D),
                      ),
                    ),

                    const SizedBox(height: 7),

                    Column(
                      mainAxisSize:
                          MainAxisSize.min,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children:
                          widget.children,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   QUOTE FORM
========================================================= */

class _QuoteForm extends StatelessWidget {
  final bool isArabic;
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController companyController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController messageController;

  final bool sending;
  final String status;

  final Future<void> Function(bool) onSubmit;

  const _QuoteForm({
    required this.isArabic,
    required this.formKey,
    required this.nameController,
    required this.companyController,
    required this.emailController,
    required this.phoneController,
    required this.messageController,
    required this.sending,
    required this.status,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 4,
        bottom: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 920,
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              36,
              34,
              36,
              32,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(26),
              border: Border.all(
                color: const Color(0xFFDFE9E4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: .065,
                  ),
                  blurRadius: 50,
                  offset: const Offset(0, 18),
                ),
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  LayoutBuilder(
                    builder:
                        (context, constraints) {
                      final twoColumns =
                          constraints.maxWidth >
                              650;

                      final fieldWidth =
                          twoColumns
                              ? (constraints.maxWidth -
                                      20) /
                                  2
                              : constraints
                                  .maxWidth;

                      return Wrap(
                        spacing: 20,
                        runSpacing: 22,
                        children: [
                          SizedBox(
                            width: fieldWidth,
                            child: _FormField(
                              label: isArabic
                                  ? 'الاسم'
                                  : 'Name',
                              controller:
                                  nameController,
                              required: true,
                              isArabic: isArabic,
                            ),
                          ),

                          SizedBox(
                            width: fieldWidth,
                            child: _FormField(
                              label: isArabic
                                  ? 'الشركة'
                                  : 'Company',
                              controller:
                                  companyController,
                              isArabic: isArabic,
                            ),
                          ),

                          SizedBox(
                            width: fieldWidth,
                            child: _FormField(
                              label: isArabic
                                  ? 'البريد الإلكتروني'
                                  : 'Email',
                              controller:
                                  emailController,
                              keyboardType:
                                  TextInputType
                                      .emailAddress,
                              required: true,
                              isArabic: isArabic,
                            ),
                          ),

                          SizedBox(
                            width: fieldWidth,
                            child: _FormField(
                              label: isArabic
                                  ? 'رقم الموبايل'
                                  : 'Mobile Number',
                              controller:
                                  phoneController,
                              keyboardType:
                                  TextInputType.phone,
                              required: true,
                              isArabic: isArabic,
                            ),
                          ),

                          SizedBox(
                            width:
                                constraints.maxWidth,
                            child: _FormField(
                              label: isArabic
                                  ? 'متطلبات التعبئة'
                                  : 'Packaging requirement',
                              controller:
                                  messageController,
                              maxLines: 6,
                              required: true,
                              isArabic: isArabic,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: sending
                          ? null
                          : () => onSubmit(isArabic),
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF356C4D),
                        foregroundColor:
                            Colors.white,
                        elevation: 0,
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 25,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),
                        ),
                      ),
                      child: Text(
                        sending
                            ? (isArabic
                                ? 'جاري الإرسال...'
                                : 'Sending...')
                            : (isArabic
                                ? 'إرسال الطلب'
                                : 'Send Request'),
                        style: TextStyle(
                          fontFamily:
                              isArabic
                                  ? 'Cairo'
                                  : 'Inter',
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  if (status.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFEDF6F1),
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontFamily:
                              isArabic
                                  ? 'Cairo'
                                  : 'Inter',
                          color:
                              const Color(0xFF356C4D),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/* =========================================================
   FORM FIELD
========================================================= */

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool required;
  final bool isArabic;
  final int maxLines;
  final TextInputType? keyboardType;

  const _FormField({
    required this.label,
    required this.controller,
    required this.isArabic,
    this.required = false,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 4,
              margin:
                  const EdgeInsetsDirectional.only(
                end: 7,
              ),
              decoration:
                  const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC9A968),
              ),
            ),

            Text(
              label,
              style: TextStyle(
                fontFamily:
                    isArabic ? 'Cairo' : 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color:
                    const Color(0xFF1F2D26),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textDirection:
              isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          validator: required
              ? (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return isArabic
                        ? 'هذا الحقل مطلوب'
                        : 'This field is required';
                  }

                  if (keyboardType ==
                          TextInputType
                              .emailAddress &&
                      !value.contains('@')) {
                    return isArabic
                        ? 'أدخل بريدًا إلكترونيًا صحيحًا'
                        : 'Enter a valid email';
                  }

                  return null;
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                const Color(0xFFFBFCFC),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFDCE8DF),
              ),
            ),
            enabledBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFFDCE8DF),
              ),
            ),
            focusedBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Color(0xFF356C4D),
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}


/* =========================================================
   WHAT TO INCLUDE
========================================================= */

class _WhatToInclude extends StatelessWidget {
  final bool isArabic;

  const _WhatToInclude({
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F7F4),
      padding: const EdgeInsets.symmetric(
        vertical: 70,
        horizontal: 20,
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

              return Flex(
                direction:
                    mobile
                        ? Axis.vertical
                        : Axis.horizontal,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: mobile ? 0 : 1,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 2,
                              color:
                                  const Color(
                                0xFFE2B94F,
                              ),
                            ),

                            const SizedBox(width: 10),

                            Text(
                              isArabic
                                  ? 'ما الذي نحتاج معرفته'
                                  : 'What to include',
                              style: TextStyle(
                                fontFamily:
                                    isArabic
                                        ? 'Cairo'
                                        : 'Inter',
                                fontSize: 14,
                                fontWeight:
                                    FontWeight.w800,
                                color:
                                    const Color(
                                  0xFF356C4D,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        Text(
                          isArabic
                              ? 'كلما كان الطلب أوضح، كان نقاش الحل أكثر دقة.'
                              : 'A better brief leads to a better packaging discussion.',
                          style: TextStyle(
                            fontFamily:
                                isArabic
                                    ? 'Cairo'
                                    : 'Inter',
                            fontSize: 30,
                            height: 1.3,
                            fontWeight:
                                FontWeight.w800,
                            color:
                                const Color(
                              0xFF1F2D26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (!mobile)
                    const SizedBox(width: 50),

                  if (mobile)
                    const SizedBox(height: 30),

                  Expanded(
                    flex: mobile ? 0 : 1,
                    child: Column(
                      children: [
                        _InfoCard(
                          title: isArabic
                              ? 'المنتج والمركب'
                              : 'Product & compound',
                          text: isArabic
                              ? 'اذكر طبيعة المنتج أو المركب المستخدم داخل العبوة حتى يركز النقاش الفني على متطلبات التغليف المناسبة.'
                              : 'Describe the product or active compound being packaged so the technical discussion can focus on the relevant packaging requirements.',
                          isArabic: isArabic,
                        ),

                        const SizedBox(height: 14),

                        _InfoCard(
                          title: isArabic
                              ? 'الاستخدام والمقاس'
                              : 'Application & format',
                          text: isArabic
                              ? 'اذكر الاستخدام المستهدف والمقاس المفضل للعبوة إذا كان معروفًا.'
                              : 'Mention the intended use and preferred container size, if known.',
                          isArabic: isArabic,
                        ),
                      ],
                    ),
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


/* =========================================================
   INFO CARD
========================================================= */

class _InfoCard extends StatelessWidget {
  final String title;
  final String text;
  final bool isArabic;

  const _InfoCard({
    required this.title,
    required this.text,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFDCE8DF),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily:
                  isArabic ? 'Cairo' : 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color:
                  const Color(0xFF356C4D),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            text,
            style: TextStyle(
              fontFamily:
                  isArabic ? 'Cairo' : 'Inter',
              fontSize: 14,
              height: 1.8,
              color:
                  const Color(0xFF6B7D73),
            ),
          ),
        ],
      ),
    );
  }
}