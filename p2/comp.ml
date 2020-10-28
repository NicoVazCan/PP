(*
2. Composición.
*)
let comp f g = function x -> f (g x);;
(*val comp : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b = <fun>*)

let f = let square x = x * x in comp square ((+) 1);;
(*
Prediccion:
val f : int -> int = <fun>

Resultado:
val f : int -> int = <fun>

Correccion:
ninguna.
*)

f 1, f 2, f 3;;
(*
Prediccion:
- : int * int * int = (4, 9, 16)

Resultado:
- : int * int * int = (4, 9, 16)

Correccion:
ninguna.
*)