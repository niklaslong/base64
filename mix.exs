defmodule Base64.MixProject do
  use Mix.Project

  def project do
    [
      app: :base64,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, github: "rusterlium/rustler", sparse: "rustler_mix", branch: "master"},
      {:benchee, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      fmt: ["format", "cmd cargo fmt --manifest-path native/lars/Cargo.toml"]
    ]
  end
end
