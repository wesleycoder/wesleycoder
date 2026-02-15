use serde::{Deserialize, Serialize};
use std::fmt::{self, Display, Formatter};

#[derive(Debug, Default, Clone, PartialEq, Eq, Serialize, Deserialize, Hash)]
pub struct Color {
  pub r: u8,
  pub g: u8,
  pub b: u8,
}

impl Color {
  pub fn new(r: u8, g: u8, b: u8) -> Self {
    Color { r, g, b }
  }
}

impl Display for Color {
  fn fmt(&self, f: &mut Formatter) -> fmt::Result {
    write!(f, "#{:02X}{:02X}{:02X}", self.r, self.g, self.b)
  }
}
