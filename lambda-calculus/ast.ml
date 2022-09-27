module Env = Map.Make (String)

type expression =
  | Variable of string
  | Abstraction of { parameter : string; body : expression }
  | Application of { function_ : expression; argument : expression }

type value =
  | Closure of { parameter : string; body : expression; env : value Env.t }
