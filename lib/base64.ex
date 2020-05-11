defmodule Base64 do
  use Rustler, otp_app: :base64, crate: "base64_nif"

  def decode(_b64, _opt \\ :standard), do: error()

  def encode(_s, _opt \\ :standard), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
