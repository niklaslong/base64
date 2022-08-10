use base64::{
    alphabet, decode_engine, encode_engine,
    engine::{fast_portable, fast_portable::FastPortable},
};
use rustler::Atom;

mod atoms {
    rustler::atoms! {
      crypt,
      bcrypt,
      bin_hex,
      imap_map7,
      standard,
      url_safe,
    }
}

#[rustler::nif]
pub fn decode(b64: String, alphabet: Atom, should_pad: bool) -> String {
    let engine = match_config(alphabet, should_pad);
    let bytes = decode_engine(b64, &engine).expect("decode failed: invalid b64");

    String::from_utf8(bytes).unwrap()
}

#[rustler::nif]
pub fn encode(s: String, alphabet: Atom, is_padded: bool) -> String {
    let engine = match_config(alphabet, is_padded);
    encode_engine(s.as_bytes(), &engine)
}

fn match_config(alphabet: Atom, padding: bool) -> FastPortable {
    let alphabet = if alphabet == atoms::crypt() {
        alphabet::CRYPT
    } else if alphabet == atoms::bcrypt() {
        alphabet::BCRYPT
    } else if alphabet == atoms::bin_hex() {
        alphabet::BIN_HEX
    } else if alphabet == atoms::imap_map7() {
        alphabet::IMAP_MUTF7
    } else if alphabet == atoms::url_safe() {
        alphabet::URL_SAFE
    } else {
        alphabet::STANDARD
    };

    let pad = match padding {
        true => fast_portable::PAD,
        false => fast_portable::NO_PAD,
    };

    FastPortable::from(&alphabet, pad)
}

rustler::init!("Elixir.Base64", [decode, encode]);
