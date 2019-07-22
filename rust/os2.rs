
fn main() {
   println!("hello !");

  let _a = 2;
  println!("{}", _a);

  let _b = [3; 4];
  println!("{:#?}", _b);
  println!("one value {}", _b[3]);

  let _c = [_b, [1,2,3,4]];
  println!("{:?}", _c);
}
