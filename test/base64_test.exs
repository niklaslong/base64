defmodule Base64Test do
  use ExUnit.Case
  use ExUnitProperties

  alias Base64
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

    test "returns a valid string (standard no padding)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :standard_no_pad) do
        assert String.valid?(b64_s)
      end
    end

    test "correctly encodes base64 (standard no padding)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :standard_no_pad) do
        assert s == Base.decode64!(b64_s, padding: false)
      end
    end

    test "returns a valid string (url safe)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :url_safe) do
        assert String.valid?(b64_s)
      end
    end

    test "correctly encodes base64 (url safe)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :url_safe) do
        assert s == Base.url_decode64!(b64_s)
      end
    end

    test "returns a valid string (url safe no padding)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :url_safe_no_pad) do
        assert String.valid?(b64_s)
      end
    end

    test "correctly encodes base64 (url safe no padding)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :url_safe_no_pad) do
        assert s == Base.url_decode64!(b64_s, padding: false)
      end
    end

    test "returns a valid string (crypt)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :crypt) do
        assert String.valid?(b64_s)
      end
    end

    test "returns a valid string (imap modified utf7)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base64.encode(s, :imap_map7) do
        assert String.valid?(b64_s)
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

    test "correctly decodes base64 (standard no padding)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.encode64(s, padding: false) do
        assert s == Base64.decode(b64_s, :standard_no_pad)
      end
    end

    test "correctly decodes base64 (url safe)" do
      check all s <- StreamData.string(:ascii),
                b64_s = Base.url_encode64(s) do
        assert s == Base64.decode(b64_s, :url_safe)
      end
    end
  end
end
