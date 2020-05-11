defmodule Base64Test do
  use ExUnit.Case
  use ExUnitProperties

  alias StreamData

  doctest Base64

  describe "encode/1:" do
    test "returns a valid string (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s) do
        assert String.valid?(b64_s)
      end
    end

    test "correctly encodes base64 (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s) do
        assert s == Base.decode64!(b64_s)
      end
    end
  end

  describe "encode/2:" do
    test "returns a valid string (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :standard) do
        assert String.valid?(b64_s)
      end
    end

    test "correctly encodes base64 (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :standard) do
        assert s == Base.decode64!(b64_s)
      end
    end
  end

  describe "decode/1:" do
    test "returns a valid string (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.encode64(s),
                result = Base64.decode(b64_s) do
        assert String.valid?(result)
      end
    end

    test "correctly decodes base64 (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.encode64(s) do
        assert s == Base64.decode(b64_s)
      end
    end
  end

  describe "decode/2:" do
    test "returns a valid string (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.encode64(s),
                result = Base64.decode(b64_s, :standard) do
        assert String.valid?(result)
      end
    end

    test "correctly decodes base64 (standard)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.encode64(s) do
        assert s == Base64.decode(b64_s, :standard)
      end
    end
  end
end
