import 'package:bit_design_system/components/button/bit_button.dart';
import 'package:bit_design_system/components/button/bit_outlined_button.dart';
import 'package:bit_design_system/components/modal/bit_modal.dart';
import 'package:bit_design_system/utils/extensions.dart';
import 'package:flutter/material.dart';

class BitForm extends StatefulWidget {
  final bool autoFocus;
  final List<BitFormPage> pages;
  final Function(Map<String, dynamic>) onComplete;
  final int initialPage;
  final bool showPageIndicator;
  final ScrollPhysics? scrollPhysics;
  final Function(int)? onPageChanged;
  final bool Function(int)? canGoBack;
  final bool validateOnPageChange;
  final String? continueButtonText;
  final String? finishButtonText;
  final String? backButtonText;
  final bool showBackButton;
  final bool isModal;

  const BitForm({
    super.key,
    this.autoFocus = true,
    this.pages = const [],
    required this.onComplete,
    this.initialPage = 0,
    this.showPageIndicator = false,
    this.scrollPhysics,
    this.onPageChanged,
    this.canGoBack,
    this.validateOnPageChange = true,
    this.continueButtonText,
    this.finishButtonText,
    this.backButtonText,
    this.showBackButton = true,
    this.isModal = false,
  });

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
    EdgeInsets contentPadding = const EdgeInsets.all(16),
  }) async {
    final controller = _BitFormModalController(
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

  @override
  State<BitForm> createState() => _BitFormState();
}

class _BitFormState extends State<BitForm> with SingleTickerProviderStateMixin {
  final Map<String, dynamic> _formData = {};
  final Map<int, FocusNode?> _focusNodes = {};
  late final TabController _tabController;
  late final List<GlobalKey<FormState>> _formKeys;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _tabController = TabController(
      length: widget.pages.length,
      vsync: this,
      initialIndex: widget.initialPage,
    );
    _formKeys = List.generate(
      widget.pages.length,
      (_) => GlobalKey<FormState>(),
    );
    _tabController.addListener(_onTabChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autoFocus) {
        _focusFirstInput(_currentPage);
      }
    });
  }

  void _onTabChanged() {
    if (_tabController.index != _currentPage) {
      setState(() {
        _currentPage = _tabController.index;
      });
      widget.onPageChanged?.call(_currentPage);
      if (widget.autoFocus) {
        _focusFirstInput(_currentPage);
      }
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _registerFocus(FocusNode focusNode, int pageIndex) {
    if (_focusNodes[pageIndex] == null) {
      _focusNodes[pageIndex] = focusNode;
    }
  }

  void _focusFirstInput(int pageIndex) {
    final focusNode = _focusNodes[pageIndex];
    if (focusNode != null && focusNode.canRequestFocus) {
      Future.microtask(() => focusNode.requestFocus());
    } else if (pageIndex > 0) {
      Future.microtask(() => _focusNodes[pageIndex - 1]?.unfocus());
    }
  }

  bool _validateCurrentPage() {
    final formKey = _formKeys[_currentPage];
    final isValid = formKey.currentState?.validate() ?? true;

    final page = widget.pages[_currentPage];
    if (isValid && page.customValidator != null) {
      return page.customValidator!();
    }

    return isValid;
  }

  void _saveFormData(String key, dynamic value) {
    _formData[key] = value;
  }

  void _nextPage() {
    if (_currentPage < widget.pages.length - 1) {
      if (widget.validateOnPageChange && !_validateCurrentPage()) {
        return;
      }

      _formKeys[_currentPage].currentState?.save();

      _tabController.animateTo(_currentPage + 1);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      final canGoBack = widget.canGoBack?.call(_currentPage) ?? true;
      if (!canGoBack) return;

      _tabController.animateTo(_currentPage - 1);
    }
  }

  void _jumpToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < widget.pages.length) {
      if (pageIndex > _currentPage && widget.validateOnPageChange) {
        for (int i = _currentPage; i < pageIndex; i++) {
          final formKey = _formKeys[i];
          if (formKey.currentState?.validate() != true) {
            return;
          }
          formKey.currentState?.save();
        }
      }

      _tabController.animateTo(pageIndex);
    }
  }

  bool _isFirstPage() {
    return _currentPage == 0;
  }

  bool _isLastPage() {
    return _currentPage == widget.pages.length - 1;
  }

  void _submit() {
    if (!_validateCurrentPage()) {
      return;
    }

    _formKeys[_currentPage].currentState?.save();

    widget.onComplete(_formData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPage = widget.pages[_currentPage];
    final isLastPage = _isLastPage();

    return BitFormProvider(
      save: _saveFormData,
      formData: _formData,
      registerFocus: _registerFocus,
      currentPage: _currentPage,
      totalPages: widget.pages.length,
      validateCurrentPage: _validateCurrentPage,
      nextPage: _nextPage,
      previousPage: _previousPage,
      jumpToPage: _jumpToPage,
      isFirstPage: _isFirstPage,
      isLastPage: _isLastPage,
      submit: _submit,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics:
                  widget.scrollPhysics ?? const NeverScrollableScrollPhysics(),
              children: widget.pages.asMap().entries.map((entry) {
                final index = entry.key;
                final page = entry.value;

                return _BitFormPageKeepAlive(
                  child: BitFormPageScope(
                    pageIndex: index,
                    child: Form(
                      key: _formKeys[index],
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (page.title != null) ...[
                              Text(
                                page.title!,
                                style: theme.textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                            ],
                            if (page.subtitle != null) ...[
                              Text(
                                page.subtitle!,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 24),
                            ],
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
          Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: const Offset(0, -2),
                  blurRadius: 8,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  if (widget.showBackButton && !_isFirstPage())
                    Expanded(
                      child: BitOutlinedButton(
                        text:
                            currentPage.backButtonText ??
                            widget.backButtonText ??
                            'Back',
                        onPressed: _previousPage,
                      ),
                    ),
                  if (widget.showBackButton && !_isFirstPage())
                    const SizedBox(width: 16),
                  Expanded(
                    flex: widget.showBackButton && !_isFirstPage() ? 1 : 2,
                    child: BitButton(
                      text:
                          currentPage.continueButtonText ??
                          (isLastPage
                              ? (widget.finishButtonText ?? 'Finish')
                              : (widget.continueButtonText ?? 'Continue')),
                      onPressed: isLastPage ? _submit : _nextPage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

class BitFormProvider extends InheritedWidget {
  final void Function(String key, dynamic value) save;
  final Map<String, dynamic> formData;
  final void Function(FocusNode, int pageIndex) registerFocus;
  final int currentPage;
  final int totalPages;
  final bool Function() validateCurrentPage;
  final void Function() nextPage;
  final void Function() previousPage;
  final void Function(int) jumpToPage;
  final bool Function() isFirstPage;
  final bool Function() isLastPage;
  final void Function() submit;

  const BitFormProvider({
    super.key,
    required this.save,
    required this.formData,
    required this.registerFocus,
    required this.currentPage,
    required this.totalPages,
    required this.validateCurrentPage,
    required this.nextPage,
    required this.previousPage,
    required this.jumpToPage,
    required this.isFirstPage,
    required this.isLastPage,
    required this.submit,
    required super.child,
  });

  static BitFormProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BitFormProvider>()!;
  }

  static BitFormProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BitFormProvider>();
  }

  @override
  bool updateShouldNotify(BitFormProvider oldWidget) {
    return currentPage != oldWidget.currentPage ||
        formData != oldWidget.formData;
  }
}

class BitFormPageScope extends InheritedWidget {
  final int pageIndex;

  const BitFormPageScope({
    super.key,
    required this.pageIndex,
    required super.child,
  });

  static int? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BitFormPageScope>()
        ?.pageIndex;
  }

  @override
  bool updateShouldNotify(BitFormPageScope oldWidget) {
    return pageIndex != oldWidget.pageIndex;
  }
}

class _BitFormModalController with ChangeNotifier {
  final List<BitFormPage> pages;
  final bool autoFocus;
  final int initialPage;
  final ScrollPhysics? scrollPhysics;
  final Function(int)? onPageChanged;
  final bool Function(int)? canGoBack;
  final bool validateOnPageChange;
  final String? continueButtonText;
  final String? finishButtonText;
  final String? backButtonText;
  final bool showBackButton;

  late final TabController tabController;
  late final List<GlobalKey<FormState>> formKeys;
  final Map<String, dynamic> formData = {};
  final Map<int, FocusNode?> focusNodes = {};
  int currentPage = 0;

  _BitFormModalController({
    required this.pages,
    required this.autoFocus,
    required this.initialPage,
    this.scrollPhysics,
    this.onPageChanged,
    this.canGoBack,
    required this.validateOnPageChange,
    this.continueButtonText,
    this.finishButtonText,
    this.backButtonText,
    required this.showBackButton,
  }) {
    currentPage = initialPage;
    formKeys = List.generate(pages.length, (_) => GlobalKey<FormState>());
  }

  void initializeTabController(TickerProvider vsync) {
    tabController = TabController(
      length: pages.length,
      vsync: vsync,
      initialIndex: initialPage,
    );
    tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (tabController.index != currentPage) {
      currentPage = tabController.index;
      notifyListeners();
      onPageChanged?.call(currentPage);
    }
  }

  void registerFocus(FocusNode focusNode, int pageIndex) {
    if (focusNodes[pageIndex] == null) {
      focusNodes[pageIndex] = focusNode;
    }
  }

  void focusFirstInput(int pageIndex) {
    final focusNode = focusNodes[pageIndex];
    if (focusNode != null && focusNode.canRequestFocus) {
      Future.microtask(() => focusNode.requestFocus());
    } else if (pageIndex > 0) {
      Future.microtask(() => focusNodes[pageIndex - 1]?.unfocus());
    }
  }

  bool validateCurrentPage() {
    final formKey = formKeys[currentPage];
    final isValid = formKey.currentState?.validate() ?? true;

    final page = pages[currentPage];
    if (isValid && page.customValidator != null) {
      return page.customValidator!();
    }

    return isValid;
  }

  void saveFormData(String key, dynamic value) {
    formData[key] = value;
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      if (validateOnPageChange && !validateCurrentPage()) {
        return;
      }

      formKeys[currentPage].currentState?.save();
      tabController.animateTo(currentPage + 1);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      final canGoBackResult = canGoBack?.call(currentPage) ?? true;
      if (!canGoBackResult) return;

      tabController.animateTo(currentPage - 1);
    }
  }

  void jumpToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < pages.length) {
      if (pageIndex > currentPage && validateOnPageChange) {
        for (int i = currentPage; i < pageIndex; i++) {
          final formKey = formKeys[i];
          if (formKey.currentState?.validate() != true) {
            return;
          }
          formKey.currentState?.save();
        }
      }

      tabController.animateTo(pageIndex);
    }
  }

  bool isFirstPage() => currentPage == 0;
  bool isLastPage() => currentPage == pages.length - 1;

  @override
  void dispose() {
    tabController.removeListener(_onTabChanged);
    tabController.dispose();
    super.dispose();
  }
}

class _BitFormModalHeader extends StatelessWidget {
  final _BitFormModalController controller;
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
        final currentPage = controller.pages[controller.currentPage];

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
                        child: Text(
                          currentPage.title!,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                  ],
                ),
                if (showPageIndicator) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(
                      controller.pages.length,
                      (index) => Expanded(
                        child: Container(
                          height: 4,
                          margin: EdgeInsets.only(
                            right: index < controller.pages.length - 1 ? 8 : 0,
                          ),
                          decoration: BoxDecoration(
                            color: index <= controller.currentPage
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
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
  final _BitFormModalController controller;
  final EdgeInsets contentPadding;

  const _BitFormModalContent({
    required this.controller,
    this.contentPadding = const EdgeInsets.all(16),
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

    widget.controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (widget.controller.autoFocus) {
      widget.controller.focusFirstInput(widget.controller.currentPage);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BitFormProvider(
      save: widget.controller.saveFormData,
      formData: widget.controller.formData,
      registerFocus: widget.controller.registerFocus,
      currentPage: widget.controller.currentPage,
      totalPages: widget.controller.pages.length,
      validateCurrentPage: widget.controller.validateCurrentPage,
      nextPage: widget.controller.nextPage,
      previousPage: widget.controller.previousPage,
      jumpToPage: widget.controller.jumpToPage,
      isFirstPage: widget.controller.isFirstPage,
      isLastPage: widget.controller.isLastPage,
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
                            Text(
                              page.subtitle!,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 24),
                          ],
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
  }
}

class _BitFormModalFooter extends StatelessWidget {
  final _BitFormModalController controller;

  const _BitFormModalFooter({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final currentPage = controller.pages[controller.currentPage];
        final isLastPage = controller.isLastPage();
        final isFirstPage = controller.isFirstPage();

        return Row(
          children: [
            if (controller.showBackButton && !isFirstPage)
              Expanded(
                child: BitOutlinedButton(
                  text:
                      currentPage.backButtonText ??
                      controller.backButtonText ??
                      'Back',
                  onPressed: controller.previousPage,
                ),
              ),
            if (controller.showBackButton && !isFirstPage)
              const SizedBox(width: 16),
            Expanded(
              flex: controller.showBackButton && !isFirstPage ? 1 : 2,
              child: BitButton(
                text:
                    currentPage.continueButtonText ??
                    (isLastPage
                        ? (controller.finishButtonText ?? 'Finish')
                        : (controller.continueButtonText ?? 'Continue')),
                onPressed: () {
                  if (isLastPage) {
                    if (!controller.validateCurrentPage()) {
                      return;
                    }
                    controller.formKeys[controller.currentPage].currentState
                        ?.save();
                    Navigator.of(context).pop(controller.formData);
                  } else {
                    controller.nextPage();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class BitFormPage {
  final String? title;
  final String? subtitle;
  final List<Widget> children;
  final IconData? icon;
  final String? buttonText;
  final String? continueButtonText;
  final String? backButtonText;
  final bool Function()? customValidator;

  const BitFormPage({
    this.title,
    this.subtitle,
    this.icon,
    this.buttonText,
    this.continueButtonText,
    this.backButtonText,
    this.customValidator,
    this.children = const [],
  });
}
