open Js_of_ocaml
module Html = Dom_html

let _a =
  let input_opt =
    Html.getElementById_coerce "source-code" Html.CoerceTo.textarea
  in
  let button_opt =
    Html.getElementById_coerce "run-button" Html.CoerceTo.button
  in
  match (input_opt, button_opt) with
  | None, _ | _, None -> assert false
  | Some input, Some button ->
      let on_click _ _ =
        input##.value |> Js.to_string |> print_endline;
        true
      in

      Dom_events.listen button Dom_events.Typ.click on_click
