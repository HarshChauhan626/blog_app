import 'package:blog_app/config/utils/util_functions.dart';
import 'package:faker/faker.dart';

abstract class FakeDataSource{
  String get fakeName;
  String get fakeBio;
  String get fakePhoneNumber;
  String get fakeEmail;
  String get fakeImage;
  String get fakePostTitle;
  String get fakePostBody;
  int get fakeNumber;
}

class FakeDataSourceImpl implements FakeDataSource{

  Faker faker;

  FakeDataSourceImpl(this.faker);

  @override
  String get fakeBio{
    return faker.lorem.words(8).join(" | ");
  }

  @override
  String get fakeImage => getRandomImage();

  @override
  String get fakeName => faker.person.firstName()+" "+faker.person.lastName();

  @override
  String get fakePostBody{
    List<String> postBody=faker.lorem.sentences(100);
    return postBody.join(".");
  }

  @override
  String get fakePostTitle => faker.lorem.sentence();

  @override
  int get fakeNumber{
    return getRandomImageId();
  }

  @override
  String get fakeEmail => faker.internet.safeEmail();

  @override
  String get fakePhoneNumber => faker.phoneNumber.toString();

}



