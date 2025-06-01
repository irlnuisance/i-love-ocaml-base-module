open Base

(* toy example of a data type representing a point in a 2d space *)

type point2d = { x: float; y : float } (* record type, similar to a tuple where fields are named, rather than defined positionally *)

let point = { x = 3.; y = -5. }

(* val point : point2d = {x = 3.; y = 5.}, we can use pattern matching to access its contents *)

let magnitude { x = x_position ; y = y_position } =
  Float.sqrt (x_position **. 2. +. y_position **. 2.) (* ngl, slightly hetctic syntax to elevate to power of 2 *)

(* val magnitude : point2d -> float = <fun> *)

(* 
the same method can be written more concisely using whats called field punning,
basically when then name of the name of the field and the name of the var it is
bound to concide, we can avoid writing both of them explicitly
*)

let magnitude { x; y } = Float.sqrt (x **. 2. +. y **. 2.)

(* to access record fields we can use dot notation as follows *)

let distance v1 v2 =
  magnitude { x = v1.x -. v2.x; y = v1.y -. v2.y }

(* val distance : point2d -> point2d -> float = <fun> *)

(* we can reuse custom types into more complex types *)

type circle_desc = { center: point2d; radius: float }
type rect_desc = { lower_left: point2d; width: float; height: float }
type segment_desc = { endpoint1: point2d; endpoint2: point2d }

(* we can use variant types to combine multiple objects of these types together as a description of a multi-obj scene *)

type scene_element =
  | Circle of circle_desc (* first | notation is always optional but i like it *)
  | Rectangle of rect_desc
  | Segment of segment_desc (* each case must have capitalised tag *)


(* we can check whether a point is in the interior of some element of a list of scene_element *)

let is_inside_scene_element point scene_element = (* fn takes two args *)
  let open Float.O in (* opened on demand to use undotted and float comparison operators *)
  match scene_element with
  | Circle { center; radius } ->
    distance center point < radius
  | Rectangle { lower_left; width; height } ->
    point.x    > lower_left.x && point.x < lower_left.x + width
    && point.y > lower_left.y && point.y < lower_left.y + height
  | Segment _ -> false

let is_inside_scene point scene =
  List.exists scene
    ~f:(fun el -> is_inside_scene_element point el) (* ~f anonymous function*)

(*
val is_inside_scene_element : point2d -> scene_element -> bool = <fun>
val is_inside_scene : point2d -> scene_element list -> bool = <fun>
*)
  
is_inside_scene {x=3.;y=7.} [ Circle {center = {x=4.;y=7.}; radius = 0.5} ] (*: bool = false *)


