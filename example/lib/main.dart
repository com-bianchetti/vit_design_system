import 'package:example/accordion/bit_accordion.dart';
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
import 'package:example/fields/bit_fields.dart';
import 'package:example/input/bit_input.dart';
import 'package:example/input/bit_raw_input.dart';
import 'package:example/input/bit_input_count.dart';
import 'package:example/popover/bit_popover.dart';
import 'package:example/progress/bit_progress.dart';
import 'package:example/radio/bit_radio.dart';
import 'package:example/select/bit_select.dart';
import 'package:example/sheet/bit_sheet.dart';
import 'package:example/skeleton/bit_skeleton.dart';
import 'package:example/slider/bit_slider.dart';
import 'package:example/switch/bit_switch.dart';
import 'package:example/text/bit_text.dart';
import 'package:example/text/bit_text_rich.dart';
import 'package:example/toast/bit_toast.dart';
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
        BitAccordionStory,
        BitSheetStory,
        BitDialogStory,
        BitModalStory,
        BitPopoverStory,
        BitToastStory,
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
        BitFieldsStory,
        BitSkeletonStory,
      ],
    );
  }
}
