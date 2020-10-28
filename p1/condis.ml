false && (2 / 0 > 0);;
(*
Prediccion:
- : bool = false

Resultado:
- : bool = false

Correccion:
ninguna.
*)
(*true && (2 / 0 > 0);;*)
(*
Prediccion:
Excepcion: Dividiendo por cero.

Resultado:
Exception: Division_by_zero.

Correccion:
ninguna.
*)
true || (2 / 0 > 0);;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
(*false || (2 / 0 > 0);;*)
(*
Prediccion:
Excepcion: Dividiendo por cero.

Resultado:
Exception: Division_by_zero.

Correccion:
ninguna.
*)
let con = (&&);;
(*
Prediccion:
con : bool -> bool -> bool = <fun>

Resultado:
con : bool -> bool -> bool = <fun>

Correccion:
ninguna.
*)
let dis = (||);;
(*
Prediccion:
dis : bool -> bool -> bool = <fun>

Resultado:
dis : bool -> bool -> bool = <fun>

Correccion:
ninguna.
*)
(&&) (1 < 0) (2 / 0 > 0);;
(*
Prediccion:
- : bool = false

Resultado:
- : bool = false

Correccion:
ninguna.
*)
(*con (1 < 0) (2 / 0 > 0);;*)
(*
Prediccion:
- : bool = false

Resultado:
Exception: Division_by_zero.

Correccion:
La funcion pasa a ser eagle.
*)
(||) (1 > 0) (2 / 0 > 0);;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
(*dis (1 > 0) (2 / 0 > 0);;*)
(*
Prediccion:
Excepcion: Dividiendo por cero.

Resultado:
Exception: Division_by_zero.

Correccion:
ninguna.
*)