s = "aGVsbG8gd29ybGQ="

Benchee.run(
  %{
    "Rust Nif" => fn -> Base64.NifBridge.decode(s) end,
    "Elixir/Erlang" => fn -> Base.decode64!(s) end
  },
  time: 10,
  memory_time: 2
)
