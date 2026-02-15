use serde::Serialize;

pub trait Json: Serialize {
  fn json(&self) -> String {
    serde_json::to_string(self).expect("Failed to serialize model to JSON")
  }

  fn json_pretty(&self) -> String {
    serde_json::to_string_pretty(self).expect("Failed to serialize model to JSON")
  }
}

impl<T: Serialize> Json for T {}
