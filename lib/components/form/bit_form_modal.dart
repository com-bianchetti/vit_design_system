import 'package:bit_design_system/components/modal/bit_modal.dart';
import 'package:bit_design_system/components/progress/bit_progress.dart';
import 'package:bit_design_system/components/text/bit_text.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'bit_form_controller.dart';
import 'bit_form_footer.dart';
import 'bit_form_page.dart';
import 'bit_form_provider.dart';

class BitFormModal {
  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    required List<BitFormPage> pages,
    bool autoFocus = true,
    int initialPage = 0,
    bool showPageIndicator = false,
    ScrollPhysics? scrollPhysics,
    Function(int)? onPageChanged,
    bool Function(int)? canGoBack,
    bool validateOnPageChange = true,
    String? continueButtonText,
    String? finishButtonText,
    String? backButtonText,
    bool showBackButton = true,
    EdgeInsets contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  }) async {
    final controller = BitFormController(
      pages: pages,
      autoFocus: autoFocus,
      initialPage: initialPage,
      scrollPhysics: scrollPhysics,
      onPageChanged: onPageChanged,
      canGoBack: canGoBack,
      validateOnPageChange: validateOnPageChange,
      continueButtonText: continueButtonText,
      finishButtonText: finishButtonText,
      backButtonText: backButtonText,
      showBackButton: showBackButton,
    );

    final result = await BitModal.show(
      context,
      useScroll: false,
      header: _BitFormModalHeader(
        controller: controller,
        showPageIndicator: showPageIndicator,
      ),
      content: _BitFormModalContent(
        controller: controller,
        contentPadding: contentPadding,
      ),
      footer: _BitFormModalFooter(
        controller: controller,
      ),
    );

    controller.dispose();
    return result;
  }
}

class _BitFormModalHeader extends StatelessWidget {
  final BitFormController controller;
  final bool showPageIndicator;

  const _BitFormModalHeader({
    required this.controller,
    required this.showPageIndicator,
  });

  void _handleBackButton(BuildContext context) {
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final currentPage = controller.currentFormPage;

        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: context.theme.borderColor,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Material(
                      child: IconButton(
                        onPressed: () => _handleBackButton(context),
                        icon: const Icon(Icons.arrow_back),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    if (currentPage.title != null)
                      Expanded(
                        child: BitTitle(
                          currentPage.title!,
                          bold: true,
                        ),
                      ),
                  ],
                ),
                if (showPageIndicator) ...[
                  const SizedBox(height: 16),
                  BitProgress(
                    key: Key('progress_${controller.currentPage}'),
                    value: (controller.currentPage + 1) / controller.totalPages,
                    minHeight: 4,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BitFormModalContent extends StatefulWidget {
  final BitFormController controller;
  final EdgeInsets contentPadding;

  const _BitFormModalContent({
    required this.controller,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  });

  @override
  State<_BitFormModalContent> createState() => _BitFormModalContentState();
}

class _BitFormModalContentState extends State<_BitFormModalContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeTabController(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.autoFocus) {
        widget.controller.focusFirstInput(widget.controller.currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, _) {
        return BitFormProvider(
          save: widget.controller.saveFormData,
          formData: widget.controller.formData,
          registerFocus: widget.controller.registerFocus,
          currentPage: widget.controller.currentPage,
          totalPages: widget.controller.totalPages,
          validateCurrentPage: widget.controller.validateCurrentPage,
          nextPage: widget.controller.nextPage,
          previousPage: widget.controller.previousPage,
          jumpToPage: widget.controller.jumpToPage,
          isFirstPage: () => widget.controller.isFirstPage,
          isLastPage: () => widget.controller.isLastPage,
          submit: () {},
          child: Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).width > 600
                  ? MediaQuery.sizeOf(context).height * 0.55
                  : null,
              child: TabBarView(
                controller: widget.controller.tabController,
                physics:
                    widget.controller.scrollPhysics ??
                    const NeverScrollableScrollPhysics(),
                children: widget.controller.pages.asMap().entries.map((entry) {
                  final index = entry.key;
                  final page = entry.value;

                  return _BitFormPageKeepAlive(
                    child: BitFormPageScope(
                      pageIndex: index,
                      child: Form(
                        key: widget.controller.formKeys[index],
                        child: Padding(
                          padding: widget.contentPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (page.subtitle != null) ...[
                                BitText(
                                  page.subtitle!,
                                ),
                                const SizedBox(height: 24),
                              ],
                              if (page.spacing != null)
                                ...List.generate(
                                  page.children.length,
                                  (childIndex) {
                                    if (childIndex ==
                                        page.children.length - 1) {
                                      return page.children[childIndex];
                                    }
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: page.spacing!,
                                      ),
                                      child: page.children[childIndex],
                                    );
                                  },
                                )
                              else
                                ...page.children,
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BitFormModalFooter extends StatelessWidget {
  final BitFormController controller;

  const _BitFormModalFooter({
    required this.controller,
  });

  void _handleSubmit(BuildContext context) {
    if (!controller.validateCurrentPage()) {
      return;
    }
    controller.saveCurrentPageData();
    Navigator.of(context).pop(controller.formData);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return BitFormFooter(
          showBackButton: controller.showBackButton,
          isFirstPage: controller.isFirstPage,
          isLastPage: controller.isLastPage,
          backButtonText: controller.getBackButtonText(),
          continueButtonText: controller.getContinueButtonText(),
          onBack: controller.previousPage,
          onContinue: controller.isLastPage
              ? () => _handleSubmit(context)
              : controller.nextPage,
          showShadow: false,
        );
      },
    );
  }
}

class _BitFormPageKeepAlive extends StatefulWidget {
  final Widget child;

  const _BitFormPageKeepAlive({required this.child});

  @override
  State<_BitFormPageKeepAlive> createState() => _BitFormPageKeepAliveState();
}

class _BitFormPageKeepAliveState extends State<_BitFormPageKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
