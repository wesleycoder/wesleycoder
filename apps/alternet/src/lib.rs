#[doc(hidden)]
#[path = "lib"]
mod lib {
  automod::dir!(pub "src/lib");
}

#[doc(hidden)]
#[path = "models"]
mod models {
  automod::dir!(pub "src/models");
}

pub use lib::*;
pub use models::*;
