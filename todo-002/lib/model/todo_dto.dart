class TodoDto {
  //데이터 클래스에 선언된 변수들 속성 필드 멤버변수
  String id;
  String sdate;
  String edate;
  String content;
  bool? complete;
  TodoDto({
    required this.id,
    required this.sdate,
    required this.edate,
    required this.content,
    this.complete,
  });

//주석은 버린다. 몰라몰라 오브젝트 : 모든 타입의 변수
  Map<String, Object?> toMap() {
    return {
      "id": id,
      "sdate": sdate,
      "edate": edate,
      "content": content,
      "complete": complete
    };
  }
}
