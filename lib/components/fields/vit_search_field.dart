import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

class VitSearchField extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final String? hintText;
  final String? id;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;

  const VitSearchField({
    super.key,
    this.initialValue,
    this.label,
    this.hintText,
    this.id,
    this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  State<VitSearchField> createState() => _VitSearchFieldState();
}

class _VitSearchFieldState extends State<VitSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.theme.bitStrings;
    return VitInput(
      id: widget.id ?? 'search',
      controller: _controller,
      label: widget.label ?? strings.search,
      hintText: widget.hintText ?? strings.searchHint,
      leading: const Icon(Icons.search),
      trailing: _hasText
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _handleClear,
            )
          : null,
      onChanged: widget.onChanged,
    );
  }
}
