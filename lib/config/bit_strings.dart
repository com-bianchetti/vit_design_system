/// A class that contains the strings used by Bit components.
/// Used to translate the app.
class BitStrings {
  final String confirm;
  final String searchHint;
  final String noResultsFound;
  final String email;
  final String emailHint;
  final String emailError;
  final String required;

  const BitStrings({
    this.confirm = 'Confirm',
    this.searchHint = 'Search...',
    this.noResultsFound = 'No results found',
    this.email = 'Email',
    this.emailHint = 'Enter your email',
    this.emailError = 'Please enter a valid email address',
    this.required = 'This field is required',
  });
}
