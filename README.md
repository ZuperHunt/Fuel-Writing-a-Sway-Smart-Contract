Author: [Naufal](https://x.com/0xfal)

> [!NOTE]
> **WHAT IS FUEL?**\
> [Fuel](https://fuel.network) is an operating system purpose-built for Ethereum rollups, designed to help developers build decentralized economies at scale.

# Writing a Sway Smart Contract

> [!TIP]
> Use **[Gitpod](https://www.gitpod.io)**, see [acknowledgements](https://github.com/ZuperHunt/Fuel-Writing-a-Sway-Smart-Contract#acknowledgements) for the guide, basically you just need an Gitpod account.

> [!WARNING]
> DO NOT SKIP EVERY STEPS! FOLLOW CLOSELY!

## Dependencies

### Install `rustup`

Proceed with standard installation (default - just press `enter`).
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Configure your PATH environment variable.
```
. "/workspace/.cargo/env"
```

### Install `fuelup`

This will install `forc`, `forc-client`, `forc-fmt`, `forc-lsp`, `forc-wallet` as well as `fuel-core`.
```
curl https://install.fuel.network | sh
```

Configure your PATH environment variable.
```
export PATH="${HOME}/.fuelup/bin:${PATH}"
```

## Building Smart Contract

Run the command below to generate a counter contract in Sway.
```
forc new zuperfuel
cd zuperfuel
```

Edit `src/main.sw` file by run the command below, clear/delete everything inside.
```
nano src/main.sw
```

Copy and paste the code below into your `src/main.sw` file, and save the file by press `ctrl + x` on your keyboard, then press `y`, and press `enter`.
```
contract;
 
storage {
    counter: u64 = 0,
}
 
abi Counter {
    #[storage(read, write)]
    fn increment();
 
    #[storage(read)]
    fn count() -> u64;
}
 
impl Counter for Contract {
    #[storage(read)]
    fn count() -> u64 {
        storage.counter.read()
    }
 
    #[storage(read, write)]
    fn increment() {
        let incremented = storage.counter.read() + 1;
        storage.counter.write(incremented);
    }
}
```

Build the smart contract by run the command below.
```
forc build
```

## Deploying Smart Contract

Import your wallet, input your `mnemonic phrase`, and random `password`.
```
forc wallet import
```

Next, create a new wallet account. Don't worry, this step will create `index 0` account, which means the same address you uses daily.\
Just run the command below, you'll be asked to input the `password` created earlier.
```
forc wallet account new
```

Steady lads.. deploying smart contract 🤓
```
forc deploy --testnet
```
You'll be asked to input the `password` created earlier.\
You'll be asked to provide the index of account to use for signing, just input the number `0`, then input `y`, and press `enter`.

Finally, you will get back the network endpoint where the contract was deployed, a `Contract ID` and the `block` where the transaction was signed.

# Help

If you have any questions, find us on:\
[ZuperHunt's Discord server](https://discord.gg/ZuperHunt)\
[ZuperHunt's X(Twitter)](https://twitter.com/ZuperHunt)

# Acknowledgements

* [Smart Contract Quickstart](https://docs.fuel.network/guides/contract-quickstart/)
* [Gitpod-based “Virtual Private Server” Guidebook](https://luthfi0x.notion.site/Gitpod-based-Virtual-Private-Server-Guidebook-a82c45e276ea436986959e83d26b32f8#6f2f73ec3658433b86cf7405b1819d28)
