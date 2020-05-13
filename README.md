# Base64

A micro library to encode and decode binaries using the base 64 encoding scheme.
This library uses [rustler](https://github.com/rusterlium/rustler) to implement rust NIFs which wrap the [base64 crate](https://github.com/marshallpierce/rust-base64). 
These functions are 2-30x faster than the built in Elixir/Erlang versions depending on the amount of data encoded and decoded. 
The larger the data, the bigger the difference. 

## Installation

The package can be installed by adding `base64` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:base64, "~> 0.1.0"}
  ]
end
```

The docs can be found at [https://hexdocs.pm/base64](https://hexdocs.pm/base64).

