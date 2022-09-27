%{ open Ast %}

%token <string> IDENT
%token LAMBDA
%token DOT
%token LPAREN
%token RPAREN
%token EOF

%start <Ast.expression> file

%%

let file :=
  | e = expression; EOF; { e }

let expression :=
  | LAMBDA; i = IDENT; DOT; e = expression; { Abstraction { parameter = i; body = e } }
  | e = application; { e }

let application :=
  | e1 = application; e2 = terminal; { Application { function_ = e1; argument = e2 } }
  | e = terminal; { e }

let terminal :=
  | i = IDENT; { Variable i }
  | LPAREN; e = expression; RPAREN; { e }

