class MyDuration {

  final int _milliseconds;

  MyDuration(this._milliseconds)


  MyDuration.fromHours(int hours) {

    _milliseconds = hours * 360000;

  }

  MyDuration.fromMinutes(int minutes) {

    _milliseconds = minutes * 60000;
  }

  MyDuration.fromSeconds(int seconds) {

    _milliseconds = seconds * 1000;

  }

  MyDuration operator +(MyDuration other) {

    int sum = this._milliseconds + other._milliseconds;

    return sum;

  }

  MyDuration operator -(MyDuration other){

    int sum = this._milliseconds - other._milliseconds;

    if (sum < 0){

       throw Exception("Result can not be negative");

    }

    return sum;

  }

  bool operator >(MyDuration other){

    return this._milliseconds > other._milliseconds;

  }


  @override
  String toString(){

    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60)floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;

    return '$hours hours, $minutes minutes, $seconds seconds';

  }

  }


void main() {
  MyDuration duration1 = MyDuration.fromHours(3);
  MyDuration duration2 = MyDuration.fromMinutes(45);

  print(duration1 + duration2);
  print(duration1 > duration2);

  try {

    print(duration2 - duration1);

  } catch (e) {

    print(e);

  }
  
}
