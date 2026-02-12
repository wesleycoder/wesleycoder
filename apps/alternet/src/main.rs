use anet::color::*;
use anet::traits::*;

fn line() {
  println!("{}", "=".repeat(80));
}

fn main() {
  line();

  let red = Color { r: 255, g: 0, b: 0 };
  println!("{}", red);
  println!("{:?}", red);
  println!("{}", red.json());

  line();

  let cafe: u32 = 0xcafe18ed;
  println!("Hexadecimal number: {:#010X}", 0xcafe);
  println!("Hexadecimal number: {:#010X}", cafe);

  line();

  test_inter_dep_fn();

  line();
}
