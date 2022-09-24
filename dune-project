(lang dune 3.4)

(name playground)

(generate_opam_files true)

(implicit_transitive_deps false)

(source
 (github ribeirotomas1904/programming-languages-playground))

(authors "Nathanael Ribeiro")

(maintainers "Nathanael Ribeiro <ribeirotomas1904@gmail.com>")

(license MIT)

(package
 (name playground)
 (synopsis "An online playground for my programming languages explorations")
 (depends
  ocaml
  dune
  js_of_ocaml-compiler
  js_of_ocaml
  ocaml-lsp-server
  ocamlformat
  ocamlformat-rpc
  utop))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
