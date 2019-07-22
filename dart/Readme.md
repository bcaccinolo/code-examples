# Testing Dart

To test Dart there is a DartPad https://dartpad.dartlang.org/
It allows you to write code easily without having to install anything.

Here is a code example:
```r
// print a String
toto(String x) {
  print('coucou le monde' + x);
}

// print an int
totoInt(int y) {
  print('coucou le monde ' + y.toString());
}

// using the type 'dynamic' meaning whatever
totoDyn(dynamic y) {
  print('coucou le monde ' + y.toString());
}

oneLine() => print('test ici le monde');

// It s heavily typed
// everything is an object

main() {
  toto(" and more !");
  totoInt(42.hashCode);
  totoInt('test'.hashCode);
  totoDyn('a');
  var a = 2;
  a = a++;
  totoDyn(a);
}
```







