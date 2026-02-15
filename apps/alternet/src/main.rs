use macros::HelloMacro;

trait Vehicle {
  const NAME: &str = "Vehicle";
  fn name(&self) -> &str {
    "Vehicle"
  }
  fn move_it(&self) {
    println!("{} moving", <Self as Vehicle>::NAME);
  }
}
trait AirVehicle: Vehicle {
  const NAME: &str = "Airplane";
  fn fly(&self) {
    println!("{} flying", <Self as AirVehicle>::NAME)
  }
}
trait WaterVehicle: Vehicle {
  const NAME: &str = "Boat";
  fn dive(&self) {
    println!("{} diving", <Self as WaterVehicle>::NAME)
  }
}
trait LandVehicle: Vehicle {
  const NAME: &str = "Car";
  fn drive(&self) {
    println!("{} driving", <Self as LandVehic‰le>::NAME)
  }
}

trait AmphibiousVehicle: LandVehicle + WaterVehicle {
  const NAME: &str = "Frog Car";
  fn float(&self) {
    println!("{} floating", <Self as AmphibiousVehicle>::NAME)
  }
}

trait MultiVehicle: AmphibiousVehicle + AirVehicle {
  const NAME: &str = "Multi Hover";
  fn go(&self) {
    println!("{} goes anywhere", <Self as MultiVehicle>::NAME)
  }
}
#[rustfmt::skip] impl<T: MultiVehicle> AirVehicle for T { const NAME: &str = <Self as MultiVehicle>::NAME; }
#[rustfmt::skip] impl<T: MultiVehicle> AmphibiousVehicle for T { const NAME: &str = <Self as MultiVehicle>::NAME; }
#[rustfmt::skip] impl<T: AmphibiousVehicle> LandVehicle for T { const NAME: &str = <Self as AmphibiousVehicle>::NAME; }
#[rustfmt::skip] impl<T: AmphibiousVehicle> WaterVehicle for T { const NAME: &str = <Self as AmphibiousVehicle>::NAME; }

#[derive(Debug, HelloMacro)]
struct SuperCar {}
impl Vehicle for SuperCar {
  const NAME: &str = "Super";
  fn name(&self) -> &str {
    "Super"
  }
}
impl MultiVehicle for SuperCar {
  const NAME: &str = "Super";
}

fn main() {
  let multi = SuperCar {};
  println!("Name: {:?}", multi.name());
  multi.move_it();
  multi.drive();
  multi.fly();
  multi.dive();
  multi.float();
  multi.go();
}
