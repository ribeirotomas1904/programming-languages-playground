open Ast

let rec eval env expression =
  match expression with
  | Variable ident -> (
      match Env.find_opt ident env with
      | Some value -> value
      | None -> failwith @@ Printf.sprintf "Unbounded variable \"%s\"" ident)
  | Abstraction { parameter; body } -> Closure { parameter; body; env }
  | Application { function_; argument } ->
      let (Closure { parameter; body; env = closure_env }) =
        eval env function_
      in
      let argument_value = eval env argument in
      let closure_env' = Env.add parameter argument_value closure_env in
      eval closure_env' body
