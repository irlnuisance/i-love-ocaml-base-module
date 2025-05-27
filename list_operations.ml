open Base

let languages = ["TypeScript"; "OCaml"; "Python"; "Java"]
(* : val languages : string list = ["TypeScript"; "OCaml"; "Python"; "Java"] *)

(* both statements work thanks to labeled arguments*)
List.map languages ~f:String.length
List.map ~f:String.length languages
(* : int list = [10; 5; 5; 4] *)

"Italian" :: languages
(* returns a new list + new element up front*)
(* : string list = ["Italian"; "TypeScript"; "OCaml"; "Python"; "Java"]*)

List.length languages
(* : int = 4*)

[1;3;5] @ [2;4;6]
(* int list = [1; 3; 5; 2; 4; 6]*)

(* since we know that a list can either be empty or have at least one element, match expression is an elegant way to handle both cases explicitly*)
let return_first_element languages =
  match languages with
  | first :: the_rest -> first (* this pattern covers the case where languages (fn argument) has at least one element*)
  | [] -> "OCaml" (* this pattern matches the empty list*)

return_first_element ["English"; "Italian"; "Portuguese"]
(* : string = "English"*)

return_first_element []
(* : string = "OCaml" *)
