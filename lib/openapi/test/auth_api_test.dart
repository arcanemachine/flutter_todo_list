//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for AuthApi
void main() {
  // final instance = AuthApi();

  group('tests for AuthApi', () {
    // Check the credentials and return the REST Token if the credentials are valid and authenticated. Calls Django Auth login method to register User ID in Django session framework  Accept the following POST parameters: username, password Return the REST Framework Token Object's key.
    //
    //Future<Login> authLoginCreate(LoginRequest loginRequest) async
    test('test authLoginCreate', () async {
      // TODO
    });

    //Future<AuthToken> authLoginTokenCreate(String username, String password) async
    test('test authLoginTokenCreate', () async {
      // TODO
    });

    // Calls Django logout method and delete the Token object assigned to the current User object.  Accepts/Returns nothing.
    //
    //Future<RestAuthDetail> authLogoutCreate() async
    test('test authLogoutCreate', () async {
      // TODO
    });

    // Calls Django Auth SetPasswordForm save method.  Accepts the following POST parameters: new_password1, new_password2 Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordChangeCreate(PasswordChangeRequest passwordChangeRequest) async
    test('test authPasswordChangeCreate', () async {
      // TODO
    });

    // Password reset e-mail link is confirmed, therefore this resets the user's password.  Accepts the following POST parameters: token, uid,     new_password1, new_password2 Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordResetConfirmCreate(PasswordResetConfirmRequest passwordResetConfirmRequest) async
    test('test authPasswordResetConfirmCreate', () async {
      // TODO
    });

    // Calls Django Auth PasswordResetForm save method.  Accepts the following POST parameters: email Returns the success/fail message.
    //
    //Future<RestAuthDetail> authPasswordResetCreate(PasswordResetRequest passwordResetRequest) async
    test('test authPasswordResetCreate', () async {
      // TODO
    });

    //Future<Token> authRegistrationCreate(RegisterRequest registerRequest) async
    test('test authRegistrationCreate', () async {
      // TODO
    });

    //Future<RestAuthDetail> authRegistrationResendEmailCreate({ ResendEmailVerificationRequest resendEmailVerificationRequest }) async
    test('test authRegistrationResendEmailCreate', () async {
      // TODO
    });

    //Future<RestAuthDetail> authRegistrationVerifyEmailCreate(VerifyEmailRequest verifyEmailRequest) async
    test('test authRegistrationVerifyEmailCreate', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserPartialUpdate({ PatchedUserDetailsRequest patchedUserDetailsRequest }) async
    test('test authUserPartialUpdate', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserRetrieve() async
    test('test authUserRetrieve', () async {
      // TODO
    });

    // Reads and updates UserModel fields Accepts GET, PUT, PATCH methods.  Default accepted fields: username, first_name, last_name Default display fields: pk, username, email, first_name, last_name Read-only fields: pk, email  Returns UserModel fields.
    //
    //Future<UserDetails> authUserUpdate(UserDetailsRequest userDetailsRequest) async
    test('test authUserUpdate', () async {
      // TODO
    });

  });
}
