import 'package:flutter/material.dart';

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
