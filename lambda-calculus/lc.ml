let parse input =
  let lexbuf = Lexing.from_string input in
  Lexer.reset_tokens ();
  Parser.file Lexer.lex lexbuf

let tokens = Lexer.get_tokens
let eval = Interpreter.eval Ast.Env.empty
