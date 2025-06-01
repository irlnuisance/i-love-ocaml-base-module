open Base

let rec remove_sequential_dups list =
  match list with
  | [] -> []
  | first :: second :: tl --> (* tl simply refers to the tail of the list *)
    if first = second then
      remove_sequential_dups (second :: tl)
    else
      first :: remove_sequential_dups (second :: tl)

(*
Warning 8 [partial-match]: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
_::[]

Compiler neatly highlights that we havent considered one-element lists 
*)

let rec remove_sequential_dups list =
  match list with
  | [] -> []
  | [x] -> [x] (* single head, [x,y,z] will match any list with exactly three elements *)
  | first :: second :: tl -->
    if first = second then
      remove_sequential_dups (second :: tl)
    else
      first :: remove_sequential_dups (second :: tl)

(* val remove_sequential_dups : int list -> int list = <fun> *)

remove_sequential_dups [1;1;2;3;3;4;4;1;1;1]
(* : int list = [1; 2; 3; 4; 1] *)



