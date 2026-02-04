import 'package:bit_design_system/components/dialog/bit_dialog.dart';
import 'package:bit_design_system/components/form/bit_form.dart';
import 'package:bit_design_system/components/input/bit_input.dart';
import 'package:example/avatar/bit_avatar.dart';
import 'package:example/button/bit_button.dart';
import 'package:example/button/bit_social_button.dart';
import 'package:example/badge/bit_badge.dart';
import 'package:example/checkbox/bit_checkbox.dart';
import 'package:example/chip/bit_chip.dart';
import 'package:example/date/bit_date.dart';
import 'package:example/dialog/bit_dialog.dart';
import 'package:example/modal/bit_modal.dart';
import 'package:example/form/bit_form.dart';
import 'package:example/input/bit_input.dart';
import 'package:example/input/bit_raw_input.dart';
import 'package:example/input/bit_input_count.dart';
import 'package:example/popover/bit_popover.dart';
import 'package:example/progress/bit_progress.dart';
import 'package:example/radio/bit_radio.dart';
import 'package:example/select/bit_select.dart';
import 'package:example/sheet/bit_sheet.dart';
import 'package:example/slider/bit_slider.dart';
import 'package:example/switch/bit_switch.dart';
import 'package:example/text/bit_text.dart';
import 'package:example/text/bit_text_rich.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        BitTextStory,
        BitTextRichStory,
        BitButtonStory,
        BitSocialButtonStory,
        BitAvatarStory,
        BitBadgeStory,
        BitProgressStory,
        BitSheetStory,
        BitDialogStory,
        BitModalStory,
        BitPopoverStory,
        BitSwitchStory,
        BitCheckboxStory,
        BitRadioStory,
        BitChipStory,
        BitSliderStory,
        BitInputStory,
        BitRawInputStory,
        BitInputCountStory,
        BitSelectStory,
        BitDateStory,
        BitFormStory,
      ],
    );
  }
}

class ExampleForm extends StatelessWidget {
  const ExampleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BitForm(
        pages: [
          BitFormPage(
            title: 'Basic Info',
            children: [
              BitInput(
                id: 'username',
                label: 'Username',
                hintText: 'johndoe',
              ),
              BitInput(
                id: 'email',
                label: 'Email',
                hintText: 'johndoe@example.com',
              ),
            ],
          ),
          BitFormPage(
            title: 'Password',
            children: [
              BitInput(
                id: 'password',
                label: 'Password',
                hintText: 'Password',
                obscureText: true,
              ),
              BitInput(
                id: 'confirmPassword',
                label: 'Confirm Password',
                hintText: 'Confirm Password',
                obscureText: true,
              ),
            ],
          ),
        ],
        onComplete: (data) {
          BitDialog.success(context, message: data.toString());
        },
      ),
    );
  }
}
