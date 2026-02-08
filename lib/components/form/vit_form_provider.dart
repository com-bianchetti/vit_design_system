import 'package:flutter/material.dart';

class VitFormProvider extends InheritedWidget {
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

  const VitFormProvider({
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

  static VitFormProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VitFormProvider>()!;
  }

  static VitFormProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VitFormProvider>();
  }

  @override
  bool updateShouldNotify(VitFormProvider oldWidget) {
    return currentPage != oldWidget.currentPage ||
        formData != oldWidget.formData;
  }
}

class VitFormPageScope extends InheritedWidget {
  final int pageIndex;

  const VitFormPageScope({
    super.key,
    required this.pageIndex,
    required super.child,
  });

  static int? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VitFormPageScope>()
        ?.pageIndex;
  }

  @override
  bool updateShouldNotify(VitFormPageScope oldWidget) {
    return pageIndex != oldWidget.pageIndex;
  }
}
