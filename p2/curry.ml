(*
1. Curry y uncurry.
*)
let curry f = function x -> function y -> f (x, y);;
(*val curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c = <fun>*)

let uncurry f = function b -> let (x,y) = b in f x y;;
(*val uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c = <fun>*)

uncurry (+);;
(*
Prediccion:
- : int * int -> int = <fun>

Resultado:
- : int * int -> int = <fun>

Correccion:
ninguna.
*)

let sum = (uncurry (+));;
(*
Prediccion:
val sum : int * int -> int = <fun>

Resultado:
val sum : int * int -> int = <fun>

Correccion:
ninguna.
*)

(*sum 1;;*)
(*
Prediccion:
Error de tipo: la funcion llamada requiere de argumento un par
de enteros pero solo recive un entero.

Resultado:
Error: This expression has type int but an expression was expected of type
         int * int

Correccion:
ninguna.
*)

let g = curry (function p -> 2 * fst p + 3 * snd p);;
(*
Prediccion:
val g : int -> int -> int = <fun>

Resultado:
val g : int -> int -> int = <fun>

Correccion:
ninguna.
*)

(*g (2,5);;*)
(*
Prediccion:
Error de tipo: la funcion llamada espera un entero y se le da
un par de enteros.

Resultado:
Error: This expression has type 'a * 'b
       but an expression was expected of type int

Correccion:
ninguna.
*)

let h = g 2;;
(*
Prediccion:
val h : int -> int = <fun>

Resultado:
val h : int -> int = <fun>

Correccion:
ninguna.
*)

h 1, h 2, h 3;;
(*
Prediccion:
- : int * int * int = (7, 10, 13)

Resultado:
- : int * int * int = (7, 10, 13)

Correccion:
ninguna.
*)