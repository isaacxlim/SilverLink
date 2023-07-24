import 'package:silverlink/signUpPage.dart';
import 'package:mockito/mockito.dart';

class MockUserRegistration extends Mock implements signUpPage {}

void main() {
  test('User Registration with Email and Password', () async {
    final mockRegistration = MockUserRegistration();
    final email = 'test@example.com';
    final password = 'testpassword';
    
    when(mockRegistration.register(email, password)).thenAnswer((_) async => true);

    await registrationPage.register(email, password);

    // Assert
    expect(registrationPage.isRegistered(), isTrue);
  });
}
