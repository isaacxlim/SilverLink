import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:silverlink/orderRequest.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
class MockDocumentReference extends Mock implements DocumentReference {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Map<String, dynamic>> {}

void main() {
  group('User Repository Tests', () {
    late UserRepository userRepository;
    late MockFirebaseFirestore mockFirestore;

    setUp(() {
      mockFirestore = MockFirebaseFirestore();
      userRepository = UserRepository(firestore: mockFirestore);
    });

    test('Get User Data - User Found', () async {

      final userId = 'user_id';
      final userData = {'name': 'John Doe', 'email': 'john@example.com'};
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockDocumentSnapshot.data()).thenReturn(userData);
      final mockDocumentReference = MockDocumentReference();
      when(mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(mockFirestore.collection('users').doc(userId)).thenReturn(mockDocumentReference);

      final result = await userRepository.getUserData(userId);

      // Assert
      expect(result, equals(userData));
    });

    test('Get User Data - User Not Found', () async {
      final userId = 'user_id';
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockDocumentSnapshot.exists).thenReturn(false);
      final mockDocumentReference = MockDocumentReference();
      when(mockDocumentReference.get()).thenAnswer((_) async => mockDocumentSnapshot);
      when(mockFirestore.collection('users').doc(userId)).thenReturn(mockDocumentReference);

      final result = await userRepository.getUserData(userId);

      // Assert
      expect(result, isNull);
    });

    test('Get User Data - Error Fetching Data', () async {
      final userId = 'user_id';
      final mockDocumentReference = MockDocumentReference();
      when(mockDocumentReference.get()).thenThrow(Exception('Firebase Error'));
      when(mockFirestore.collection('users').doc(userId)).thenReturn(mockDocumentReference);

      final result = await userRepository.getUserData(userId);

      // Assert
      expect(result, isNull);
    });
  });
}
