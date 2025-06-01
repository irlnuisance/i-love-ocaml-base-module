open Base

(*

OCaml uses option to express that a value might or might not be present.
Some and None are constructors that let us build optional values, can think of it as
a list that can have zero or one elements.

There are no NullPointerExceptions in OCaml, missing values are explicit.

A value string * string always contaisn two well defined values of type string, 
say we want to allow one to be absent, we can change the type to string option * string

*)

let divide x y =
  if y = 0 then None (* None if divide by zero *)
  else Some (x / y) (* Some otherwise *)

(* val divide : int -> int -> int option = <fun> *)

(* similarly to tuples and lists, we can use pattern matching to examine the contents of an option *)

(* brief example using String.rsplit2 (returns string * string) to split a string baed on the rightmost period found in a given string *)

let downcase_ext filename = (* fn takes a filename and returns its file extension downcased *)
  match String.rsplit2 filename ~on:'.' with
  | None -> filename
  | Some (base,ext) ->
    base ^ "." ^ String.lowercase ext (* concat strings using ^ operator, part of Stdlib module *)

  (* val downcase_ext : string -> string = <fun> *)

List.map ~f:downcase_ext ["Hello_World.TXT"; "wheres_waldo.PY"; "NO_EXT_FILE"]

(* : string list = ["Hello_World.txt"; "wheres_waldo.py"; "NO_EXT_FILE"] *)

