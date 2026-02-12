use crate::color::Color;
use serde::Serialize;

pub trait JsonEx: Serialize {
  fn json(&self) -> String {
    serde_json::to_string(self).expect("Failed to serialize model to JSON")
  }

  fn json_pretty(&self) -> String {
    serde_json::to_string_pretty(self).expect("Failed to serialize model to JSON")
  }
}

impl<T: Serialize> JsonEx for T {}

pub fn test_inter_dep_fn() {
  let red = Color { r: 255, g: 0, b: 0 };
  println!("testing {}", red);
}
