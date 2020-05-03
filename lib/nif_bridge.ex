defmodule Base64.NifBridge do
  use Rustler, otp_app: :base64, crate: "base64_nif"

  def decode(_s), do: error()
  def encode(_s), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
