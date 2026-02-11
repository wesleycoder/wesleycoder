use std::fmt::{self, Display, Formatter};

#[derive(Debug)]
pub struct Color {
  pub r: u8,
  pub g: u8,
  pub b: u8,
}

impl Display for Color {
  fn fmt(&self, f: &mut Formatter) -> fmt::Result {
    write!(f, "#{:02X}{:02X}{:02X}", self.r, self.g, self.b)
  }
}
