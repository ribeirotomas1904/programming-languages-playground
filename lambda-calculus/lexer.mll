{ open Parser }

let lower = ['a'-'z']
let ident = lower (lower | '_')*

let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule lex = parse
| whitespace { lex lexbuf }
| newline { Lexing.new_line lexbuf; lex lexbuf }
| '\\' { LAMBDA }
| ident as i { IDENT i }
| '.' { DOT }
| '(' { LPAREN }
| ')' { RPAREN }
| _ { failwith @@ Printf.sprintf "Illegal character \"%s\"" @@ Lexing.lexeme lexbuf }
| eof { EOF }
