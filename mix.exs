defmodule Base64.MixProject do
  use Mix.Project

  def project do
    [
      app: :base64,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      description: description(),
      package: package(),
      docs: docs()
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
      {:rustler, "~> 0.22-rc"},
      {:stream_data, "~> 0.5.0", only: [:test, :dev]},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      fmt: ["format", "cmd cargo fmt --manifest-path native/base64_nif/Cargo.toml"]
    ]
  end

  defp description() do
    """
    A micro-library providing base 64 encoding/decoding using Rust NIFs. 
    """
  end

  defp package() do
    [
      maintainers: ["Niklas Long"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/niklaslong/base64"},
      files:
        ~w(lib priv .formatter.exs mix.exs README* LICENSE* native/base64_nif/src native/base64_nif/.cargo native/base64_nif/README* native/base64_nif/Cargo*)
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "Base64",
      source_url: "https://github.com/niklaslong/base64",
      extras: [
        "README.md"
      ]
    ]
  end
end
