let parse input =
  let lexbuf = Lexing.from_string input in
  Parser.file Lexer.lex lexbuf

let eval = Interpreter.eval Ast.Env.empty
