contract;

abi HelloSway {
  #[storage(read)]
  fn my_lucky_number() -> u64;
}

storage {
  lucky_number: u64 = 777,
}

impl HelloSway for Contract {
  #[storage(read)]
  fn my_lucky_number() -> u64 {
    storage.lucky_number.read()
  }
}
