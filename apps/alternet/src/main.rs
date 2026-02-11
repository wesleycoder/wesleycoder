use anet::color::Color;

fn sep() {
  println!("{}", "=".repeat(80));
}

fn main() {
  sep();

  let red = Color { r: 255, g: 0, b: 0 };

  println!("{}", red);
  println!("{:?}", red);

  sep();

  let cafe: u32 = 0xcafe18ed;
  println!("Hexadecimal number: {:#010X}", 0xcafe);
  println!("Hexadecimal number: {:#010X}", cafe);

  sep();
}
