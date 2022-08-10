# Base64

[Documentation](https://hexdocs.pm/base64)

A micro-library to encode and decode binaries using the base 64 encoding scheme.
This library uses [rustler](https://github.com/rusterlium/rustler) to implement Rust NIFs which wrap the [base64 crate](https://github.com/marshallpierce/rust-base64).

Minimal benchmarking showed these are 2-40x faster than the built in Elixir/Erlang versions depending on the amount of data encoded or decoded. The larger the data, the bigger the difference.

## Installation

You'll need to install Rust, the instructions can be found [here](https://doc.rust-lang.org/book/ch01-01-installation.html).

The package can be installed by adding `base64` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:base64, "~> 0.1.0"}
  ]
end
```
