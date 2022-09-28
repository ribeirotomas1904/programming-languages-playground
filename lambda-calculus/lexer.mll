{
  open Parser

  let _tokens = ref []

  let add_token token =
    _tokens := token :: !_tokens;
    token

  let get_tokens () = List.rev !_tokens

  let reset_tokens () = _tokens := []
}

let lower = ['a'-'z']
let ident = lower (lower | '_')*

let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule lex = parse
| whitespace { lex lexbuf }
| newline { Lexing.new_line lexbuf; lex lexbuf }
| '\\' { add_token LAMBDA }
| ident as i { add_token @@ IDENT i }
| '.' { add_token DOT }
| '(' { add_token LPAREN }
| ')' { add_token RPAREN }
| _ { failwith @@ Printf.sprintf "Illegal character \"%s\"" @@ Lexing.lexeme lexbuf }
| eof { add_token EOF }
