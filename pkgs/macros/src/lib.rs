use proc_macro::TokenStream;
use quote::quote;
use syn::{DeriveInput, parse_macro_input};

#[proc_macro_derive(Vehicle)]
pub fn vehicle_derive(input: TokenStream) -> TokenStream {
  let input = parse_macro_input!(input as DeriveInput);
  let name = &input.ident;

  let expanded = quote! {
      impl Vehicle for #name {
          const NAME: &'static str = stringify!(#name);
          fn name(&self) -> &str { Self::NAME }
      }

      impl MultiVehicle for #name {
          const NAME: &'static str = stringify!(#name);
      }

      impl AirVehicle for #name { const NAME: &'static str = stringify!(#name); }
      impl LandVehicle for #name { const NAME: &'static str = stringify!(#name); }
  };

  TokenStream::from(expanded)
}
