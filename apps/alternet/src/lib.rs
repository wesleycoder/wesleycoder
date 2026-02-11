#[doc(hidden)]
#[path = "lib"]
mod lib {
  automod::dir!(pub "src/lib");
}

pub use lib::*;
