# Vit Design System

A comprehensive Flutter UI component library with superpowers. Vit Design System provides a complete set of customizable, production-ready components to help you build beautiful Flutter applications faster.

## Features

### 🎨 Rich Component Library
- **30+ UI Components** - Everything from buttons and inputs to complex forms and modals
- **Consistent Design Language** - All components follow a unified design system
- **Fully Customizable** - Extensive theming and styling options
- **Responsive** - Components adapt to different screen sizes and orientations

### 🚀 Developer Experience
- **Easy to Use** - Simple, intuitive API with sensible defaults
- **Well Documented** - Comprehensive examples and inline documentation
- **Type Safe** - Full Dart type safety with clear component APIs
- **Storybook Integration** - Interactive component showcase included

### ⚡ Built-in Features
- **Form Management** - Multi-page forms with validation and state management
- **Loading States** - Skeleton loading with shimmer animations
- **Theme Support** - Light and dark mode with full customization
- **Internationalization** - Built-in i18n support with VitStrings
- **Accessibility** - Components follow accessibility best practices

## Getting Started

### Installation

Add `vit_design_system` to your `pubspec.yaml`:

```yaml
dependencies:
  vit_design_system: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Setup

Wrap your app with `VitApp` instead of `MaterialApp`:

```dart
import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VitApp(
      theme: VitTheme(),
      home: MyHomePage(),
    );
  }
}
```

## Components

### Typography

**VitText** - Enhanced text widget with rich formatting support

```dart
VitText(
  'Hello, World!',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)

VitText(
  'Styled text with <b>bold</b>, <i>italic</i>, and <u>underline</u>',
  parseStyledText: true,
)
```

### Buttons

Multiple button variants for different use cases:

```dart
VitButton(
  text: 'Primary Button',
  icon: Icon(Icons.add),
  onPressed: () {},
)

VitOutlinedButton(
  text: 'Outlined Button',
  onPressed: () {},
)

VitSecondaryButton(
  text: 'Secondary Button',
  onPressed: () {},
)

VitLinkButton(
  text: 'Link Button',
  onPressed: () {},
)

VitSocialButton(
  socialNetwork: SocialNetwork.google,
  onPressed: () {},
)
```

### Inputs & Fields

**Basic Input**

```dart
VitInput(
  id: 'username',
  label: 'Username',
  hintText: 'Enter your username',
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  },
)
```

**Specialized Fields**

Pre-configured fields with built-in validation:

```dart
VitEmailField(id: 'email')
VitPasswordField(id: 'password')
VitPhoneField(id: 'phone')
VitUrlField(id: 'url')
VitNumberField(id: 'quantity')
VitCurrencyField(id: 'amount')
VitPercentageField(id: 'rate')
VitDateRangeField(id: 'dateRange')
VitCountryField(id: 'country')
VitLanguageField(id: 'language')
VitBirthdayField(id: 'birthday')
VitGenderField(id: 'gender')
VitSearchField(id: 'search')
VitTextAreaField(id: 'description')
```

**Input Variants**

```dart
VitRawInput(
  id: 'description',
  placeholder: 'Enter description...',
  maxLines: 5,
)

VitInputCount(
  id: 'quantity',
  label: 'Quantity',
  value: 1,
  minValue: 0,
  maxValue: 100,
)
```

### Form System

**Multi-Page Forms**

Complete form management with validation and state:

```dart
VitForm(
  showPageIndicator: true,
  finishButtonText: 'Submit',
  onComplete: (data) {
    print('Form data: $data');
  },
  pages: [
    VitFormPage(
      title: 'Personal Info',
      subtitle: 'Enter your details',
      children: [
        VitInput(id: 'name', label: 'Name'),
        VitInput(id: 'email', label: 'Email'),
      ],
    ),
    VitFormPage(
      title: 'Preferences',
      subtitle: 'Choose your options',
      children: [
        VitSwitch(id: 'notifications', title: 'Enable Notifications'),
        VitCheckbox(id: 'terms', title: 'Accept Terms'),
      ],
    ),
  ],
)
```

**Modal Forms**

```dart
final result = await VitForm.show(
  context,
  pages: [
    VitFormPage(
      title: 'Quick Registration',
      children: [
        VitInput(id: 'name', label: 'Name'),
        VitEmailField(id: 'email'),
      ],
    ),
  ],
);
```

### Selection Components

**Checkbox**

```dart
VitCheckbox(
  id: 'acceptTerms',
  title: 'I accept the Terms & Conditions',
  subtitle: 'Required to continue',
  value: false,
)
```

**Radio Buttons**

```dart
VitRadioGroup<String>(
  id: 'preference',
  options: const [
    VitRadioOption(value: 'option1', title: 'Option 1'),
    VitRadioOption(value: 'option2', title: 'Option 2'),
    VitRadioOption(value: 'option3', title: 'Option 3'),
  ],
)
```

**Switch**

```dart
VitSwitch(
  id: 'darkMode',
  title: 'Dark Mode',
  subtitle: 'Enable dark theme',
  value: false,
)
```

**Select Dropdown**

```dart
VitSelect(
  id: 'country',
  label: 'Country',
  hintText: 'Select country',
  options: const ['USA', 'UK', 'Canada', 'Australia'],
)

VitSelect(
  id: 'interests',
  label: 'Interests',
  multiSelection: true,
  options: const ['Sports', 'Music', 'Technology'],
)
```

**Slider**

```dart
VitSlider(
  id: 'volume',
  label: 'Volume',
  min: 0,
  max: 100,
  value: 50,
)
```

**Chip**

```dart
VitChip(
  label: 'Technology',
  onDeleted: () {},
)

VitChipGroup(
  id: 'tags',
  chips: ['Flutter', 'Dart', 'Mobile'],
)
```

**Date Picker**

```dart
VitDate(
  id: 'birthday',
  label: 'Birthday',
  hintText: 'Select your birthday',
)

VitDate(
  id: 'dateRange',
  label: 'Date Range',
  rangeSelection: true,
)
```

### Display Components

**Avatar**

```dart
VitAvatar(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 64,
)

VitAvatarGroup(
  avatars: [
    VitAvatar(imageUrl: 'url1'),
    VitAvatar(imageUrl: 'url2'),
    VitAvatar(imageUrl: 'url3'),
  ],
  maxAvatars: 3,
)
```

**Badge**

```dart
VitBadge(
  label: 'New',
  color: Colors.red,
  child: Icon(Icons.notifications),
)
```

**Card**

```dart
VitCard(
  title: 'Card Title',
  subtitle: 'Card subtitle',
  child: Text('Card content goes here'),
)

VitListCard(
  leading: Icon(Icons.person),
  title: 'List Item',
  subtitle: 'Item description',
  trailing: Icon(Icons.chevron_right),
  onTap: () {},
)
```

**Progress**

```dart
VitProgress(
  value: 0.7,
  label: '70% Complete',
)
```

### Feedback Components

**Dialog**

```dart
VitDialog.show(
  context,
  title: 'Confirm Action',
  message: 'Are you sure you want to continue?',
  confirmText: 'Yes',
  cancelText: 'No',
  onConfirm: () {},
)

VitDialog.success(
  context,
  title: 'Success',
  message: 'Your action was completed successfully!',
)

VitDialog.error(
  context,
  title: 'Error',
  message: 'An error occurred. Please try again.',
)
```

**Toast**

```dart
VitToast.show(
  context,
  message: 'Item saved successfully',
)

VitToast.success(context, message: 'Success!')
VitToast.error(context, message: 'Error occurred')
VitToast.warning(context, message: 'Warning!')
```

**Modal**

```dart
VitModal.show(
  context,
  title: 'Modal Title',
  child: Text('Modal content'),
)
```

**Sheet**

```dart
VitSheet.show(
  context,
  title: 'Bottom Sheet',
  child: ListView(
    children: [
      ListTile(title: Text('Option 1')),
      ListTile(title: Text('Option 2')),
    ],
  ),
)
```

**Popover**

```dart
VitPopover(
  content: Text('This is a popover'),
  child: Icon(Icons.info),
)
```

### Layout Components

**Accordion**

```dart
VitAccordion(
  title: 'Section 1',
  children: [
    Text('Content for section 1'),
  ],
)
```

### Loading States

**Loading Indicator**

```dart
VitLoading()

VitLoading.overlay(context)
```

**Skeleton Loading**

Wrap any widget tree to show skeleton loading states:

```dart
VitLoadingScope(
  loading: isLoading,
  child: Column(
    children: [
      VitText('Title').skeleton(),
      VitButton(text: 'Button', onPressed: () {}).skeleton(),
    ],
  ),
)

VitSkeletonShimmer(
  child: Container(
    width: 200,
    height: 20,
    color: Colors.grey,
  ),
)
```

## Theming

### Custom Theme

Create a custom theme by extending `VitTheme`:

```dart
VitApp(
  theme: VitTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.orange,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    fontFamily: 'Roboto',
  ),
  home: MyHomePage(),
)
```

### Dark Mode

Provide both light and dark themes:

```dart
VitApp(
  theme: VitTheme(
    primaryColor: Colors.blue,
    backgroundColor: Colors.white,
  ),
  darkTheme: VitTheme(
    primaryColor: Colors.blue.shade300,
    backgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
  ),
  themeMode: ThemeMode.system,
  home: MyHomePage(),
)
```

### Accessing Theme

Access theme values anywhere in your widget tree:

```dart
final theme = VitAppTheme.of(context).theme;
final primaryColor = theme.primaryColor;
```

## Internationalization

Customize component strings for different languages:

```dart
VitApp(
  bitStrings: VitStrings(
    ok: 'OK',
    cancel: 'Cancel',
    confirm: 'Confirm',
    save: 'Save',
    delete: 'Delete',
  ),
  home: MyHomePage(),
)
```

## Examples

Check out the `/example` folder for a complete Storybook showcase with interactive examples of all components.

To run the examples:

```bash
cd example
flutter run
```

## Advanced Usage

### Form Validation

```dart
VitForm(
  validateOnPageChange: true,
  onComplete: (data) async {
    await submitForm(data);
  },
  pages: [
    VitFormPage(
      title: 'Registration',
      children: [
        VitInput(
          id: 'email',
          label: 'Email',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            if (!value.contains('@')) {
              return 'Invalid email format';
            }
            return null;
          },
        ),
        VitPasswordField(
          id: 'password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },
        ),
      ],
    ),
  ],
)
```

### Custom Colors

Define and use custom colors in your theme:

```dart
VitTheme(
  colors: {
    'brand': Colors.purple,
    'accent': Colors.amber,
    'custom': Color(0xFF123456),
  },
)

final customColor = theme.colors['brand'];
```

### Button Dock

Create responsive button groups:

```dart
VitButtonDock(
  children: [
    VitButton(text: 'Button 1', onPressed: () {}),
    VitButton(text: 'Button 2', onPressed: () {}),
    VitButton(text: 'Button 3', onPressed: () {}),
  ],
)
```

## Requirements

- Flutter SDK: >=3.10.1
- Dart SDK: >=3.10.1

## Dependencies

- `flutter`: SDK
- `intl`: ^0.20.2

## Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

## License

This package is available under the MPL-2.0 License. See the LICENSE file for more details.

## Support

For questions, issues, or feature requests, please file an issue on the GitHub repository.
