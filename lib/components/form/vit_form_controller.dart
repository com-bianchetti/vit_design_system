import 'package:flutter/material.dart';

import 'vit_form_page.dart';

class VitFormController with ChangeNotifier {
  final List<VitFormPage> pages;
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

  TabController? _tabController;
  late final List<GlobalKey<FormState>> formKeys;
  final Map<String, dynamic> formData = {};
  final Map<int, FocusNode?> focusNodes = {};
  int _currentPage = 0;

  VitFormController({
    required this.pages,
    this.autoFocus = true,
    this.initialPage = 0,
    this.scrollPhysics,
    this.onPageChanged,
    this.canGoBack,
    this.validateOnPageChange = true,
    this.continueButtonText,
    this.finishButtonText,
    this.backButtonText,
    this.showBackButton = true,
  }) {
    _currentPage = initialPage;
    formKeys = List.generate(pages.length, (_) => GlobalKey<FormState>());
  }

  TabController get tabController {
    assert(
      _tabController != null,
      'TabController not initialized. Call initializeTabController first.',
    );
    return _tabController!;
  }

  int get currentPage => _currentPage;

  VitFormPage get currentFormPage => pages[_currentPage];

  bool get isFirstPage => _currentPage == 0;

  bool get isLastPage => _currentPage == pages.length - 1;

  int get totalPages => pages.length;

  void initializeTabController(TickerProvider vsync) {
    _tabController = TabController(
      length: pages.length,
      vsync: vsync,
      initialIndex: initialPage,
    );
    _tabController!.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController!.index != _currentPage) {
      _currentPage = _tabController!.index;
      notifyListeners();
      onPageChanged?.call(_currentPage);
      if (autoFocus) {
        focusFirstInput(_currentPage);
      }
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
    final formKey = formKeys[_currentPage];
    final isValid = formKey.currentState?.validate() ?? true;

    final page = pages[_currentPage];
    if (isValid && page.customValidator != null) {
      return page.customValidator!();
    }

    return isValid;
  }

  void saveFormData(String key, dynamic value) {
    formData[key] = value;
  }

  void saveCurrentPageData() {
    formKeys[_currentPage].currentState?.save();
  }

  void nextPage() {
    if (_currentPage < pages.length - 1) {
      if (validateOnPageChange && !validateCurrentPage()) {
        return;
      }

      saveCurrentPageData();
      _tabController?.animateTo(_currentPage + 1);
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      final canGoBackResult = canGoBack?.call(_currentPage) ?? true;
      if (!canGoBackResult) return;

      _tabController?.animateTo(_currentPage - 1);
    }
  }

  void jumpToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < pages.length) {
      if (pageIndex > _currentPage && validateOnPageChange) {
        for (int i = _currentPage; i < pageIndex; i++) {
          final formKey = formKeys[i];
          if (formKey.currentState?.validate() != true) {
            return;
          }
          formKey.currentState?.save();
        }
      }

      _tabController?.animateTo(pageIndex);
    }
  }

  String getContinueButtonText() {
    return currentFormPage.continueButtonText ??
        (isLastPage
            ? (finishButtonText ?? 'Finish')
            : (continueButtonText ?? 'Continue'));
  }

  String getBackButtonText() {
    return currentFormPage.backButtonText ?? backButtonText ?? 'Back';
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }
}
