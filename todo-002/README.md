# todo

- `Android`, `Iphone` 기타 테이블에서는 기본적으로 `SQLite` 라고 하는 작은 `RDBMS` 가 내장되어 있다.
- `Todo` 리스트를 `SQLite`에 저장하고 리스트를 화면에 출력하는 프로젝트

- SQLite : `flutter pub add sqflite`
- 날짜 시간 : `flutter pub add intl`
- 경로 : `flutter pub add path`

## Foutter(Dart)의 변수

- Flutter 에서는 3가지 type 의 변수 선언 키워드가 있다
- Flutter 에서도 정적 type 변수를 선언할 수 있다.

```dart
String name = "홍길동"
int num = 12345
```

- Flutter 에서는 동적 type 변수를 선언할 수 있다
- 동적 type 변수를 선언할 때는 `const`, `final` , `var` 키워드를 사용활 수 있다.

### const

- `const` 키워드는 일반적인 변수와 성질이 매우 다르다.
- 완전한 상수값ㅇ르 저장하는 저장소를 선언하는 키워드
- 코드에서 `magic string` 코드를 사용하지 않도록 하기 위한 것이기도.
- `widget`을 사용활 때도 const 를 부착할 때가 있다.
- `const` type 의 변수는 함수의 `return` 값을 저장할 수 없다.
- 함수의 return 값은 코드가 실해오디는 과정에서 확정되기 대문에 const type 변수에 저장할 수 없음.

```dart
const korea = "Republick of Korea"
cont Naver_ID ="sster"

```

### final

- `final` 키워드가 부착된 변수는 한번만 값을 할당할 수 있다.
- `final` 키워드가 부착된 변수는 함수의 return 값을 저장할 수 있다.
- `final` 키워드가 부착된 변수는 코드가 실행되는 동안 확정된다.
- 코드가 실행되는 과정에서 변수의 변형을 방지하기 위한 고정값으로 설정할 때 사용

```dart
final inputController = TextDeditController();
final sum = num1+ num2;
```

### var

- `var` 키워드는 일반적인 변수의 성질을 모두 갖는다.
- 값을 자유롭게 할당, 제거
- 함수의 return type 이나 변수의 type을 확인하기 어려울 때 일반적으로 사용
- `var` 키워드가 부착된 변수는 코드가 실행되는 과정에서 변수의 type 이 결정된다 : 이것을 동적(Dynamic) 타이핑이라고 한다.
