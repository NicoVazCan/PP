();;
(*
Prediccion:
- : unit = ()

Resultado:
- : unit = ()

Correccion:
ninguna.
*)
2 + 5 * 3;;
(*
Prediccion:
- : int = 17

Resultado:
- : unit = 17

Correccion:
ninguna.
*)
1.0;;
(*
Prediccion:
- : float = 1

Resultado:
- : float = 1.

Correccion:
punto a continuacion del numero.
*)
(*1.0 * 2;;*)
(*
Prediccion:
error de tipos, debido a que se esta haciendo una multiplicacion
de enteros entre un entero con un float (1.0).

Resultado:
Error: This expression has type float but an expression was expected of type
         int

Correccion:
Ninguna.
*)
(*2 - 2.0;;*)
(*
Prediccion:
error de tipos, debido a que se esta haciendo una resta
de enteros entre un entero con un float (2.0).

Resultado:
Error: This expression has type float but an expression was expected of type
         int

Correccion:
Ninguna.
*)
(*3.0 + 2.0;;*)
(*
Prediccion:
error de tipos, debido a que se esta haciendo una suma
de enteros entre dos floats.

Resultado:
Error: This expression has type float but an expression was expected of type
         int

Correccion:
Ninguna.
*)
5 / 3;;
(*
Prediccion:
- : int = 1

Resultado:
- : int = 1

Correccion:
Ninguna.
*)
5 mod 3;;
(*
Prediccion:
- : int = 2

Resultado:
- : int = 2

Correccion:
Ninguna.
*)
3.0 *. 2.0 ** 3.0;;
(*
Prediccion:
- : float = 24.

Resultado:
- : float = 24.

Correccion:
Ninguna.
*)
3.0 = float_of_int 3;;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
Ninguna.
*)
(*sqrt 4;;*)
(*
Prediccion:
Error de tipo, debido a que la funcion raiz debe recibir un 
float y en este caso se le da un entero.

Resultado:
Error: This expression has type int but an expression was expected of type
         float

Correccion:
Ninguna.
*)
int_of_float 2.1 + int_of_float (-2.9);;
(*
Prediccion:
- : int = 0

Resultado:
- : int = 0

Correccion:
Ninguna.
*)
truncate 2.1 + truncate (-2.9);;
(*
Prediccion:
- : int = 0

Resultado:
- : int = 0

Correccion:
Ninguna.
*)
floor 2.1 +. floor (-2.9);;
(*
Prediccion:
- : float = -1

Resultado:
- : float = -1

Correccion:
Ninguna.
*)
(*ceil 2.1 +. ceil -2.9;;*)
(*
Prediccion:
- : float = 1.

Resultado:
Error: This expression has type float -> float
       but an expression was expected of type float

Correccion:
al no ir -2.9 entre parentesis es un error de tipo.
*)
2.0 ** 3.0 ** 2.0;;
(*
Prediccion:
- : float = 64.

Resultado:
- : float = 512.

Correccion:
la funcion ** se lee de derecha a izquierda.
*)

'B';;
(*
Prediccion:
- : char = 'B'

Resultado:
- : char = 'B'

Correccion:
ninguna.
*)
int_of_char 'A';;
(*
Prediccion:
- : int = 65

Resultado:
- : int = 65

Correccion:
ninguna.
*)
char_of_int 66;;
(*
Prediccion:
- : char = 'B'

Resultado:
- : char = 'B'

Correccion:
ninguna.
*)
Char.code 'B';;
(*
Prediccion:
- : int = 66

Resultado:
- : int = 66

Correccion:
ninguna.
*)
Char.chr 67;;
(*
Prediccion:
- : char = 'C'

Resultado:
- : char = 'C'

Correccion:
ninguna.
*)
'\067';;
(*
Prediccion:
- : char = 'C'

Resultado:
- : char = 'C'

Correccion:
ninguna.
*)
Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*
Prediccion:
- : char = 'm'

Resultado:
- : char = 'm'

Correccion:
ninguna.
*)
Char.uppercase 'm';;
(*
Prediccion:
- : char = 'M'

Resultado:
Warning 3: deprecated: Char.uppercase
Use Char.uppercase_ascii instead.
- : char = 'M'

Correccion:
Debe usarse la funcion de ascii.
*)
Char.lowercase 'O';;
(*
Prediccion:
Aviso de usar la funcion ascii.
- : char = 'o'

Resultado:
Warning 3: deprecated: Char.uppercase
Use Char.lowercase_ascii instead.
- : char = 'o'

Correccion:
Debe usarse la funcion de ascii.
*)
"this is a string";;
(*
Prediccion:
Aviso de usar la funcion ascii.
- : string = "this is a string"

Resultado:
- : string = "this is a string"

Correccion:
ninguna.
*)
String.length "longitud";;
(*
Prediccion:
Aviso de usar la funcion ascii.
- : int = 8

Resultado:
- : int = 8

Correccion:
ninguna.
*)
(*"1999" + "1";;*)
(*
Prediccion:
error de tipos, se esta haciendo una suma de enteros entre
dos strings.

Resultado:
Error: This expression has type string but an expression was expected of type
         int

Correccion:
ninguna.
*)
"1999" ^ "1";;
(*
Prediccion:
- : string = "19991"

Resultado:
- : string = "19991"

Correccion:
ninguna.
*)
int_of_string "1999" + 1;;
(*
Prediccion:
Aviso de usar la funcion ascii.
- : int = 2000

Resultado:
- : int = 2000

Correccion:
ninguna.
*)
"\064\065";;
(*
Prediccion:
- : string = "@A"

Resultado:
- : string = "@A"

Correccion:
ninguna.
*)
string_of_int 010;;
(*
Prediccion:
- : string = "10"

Resultado:
- : string = "10"

Correccion:
ninguna.
*)
not true;;
(*
Prediccion:
- : bool = false

Resultado:
- : bool = false

Correccion:
ninguna.
*)
true && false;;
(*
Prediccion:
- : bool = false

Resultado:
- : bool = false

Correccion:
ninguna.
*)
true || false;;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
(1 < 2) = false;;
(*
Prediccion:
- : bool = false

Resultado:
- : bool = false

Correccion:
ninguna.
*)
"1" < "2";;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
2 < 12;;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
"2" < "12";;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = false

Correccion:
En los strings se sigue un orden lexico-grafico
*)
"uno" < "dos";;
(*
Prediccion:
- : bool = true

Resultado:
- : bool = true

Correccion:
ninguna.
*)
if 3 = 4 then 0 else 4;;
(*
Prediccion:
- : int = 4

Resultado:
- : int = 4

Correccion:
ninguna.
*)
(*if 3 = 4 then "0" else 4;;*)
(*
Prediccion:
- : int = 4

Resultado:
Error: This expression has type int but an expression was expected of type
         string

Correccion:
una funcion no puede devolver dos tipos diferentes
*)
(*if 3 = 4 then 0 else "4";;*)
(*
Prediccion:
Error de tipos, una funcion no puede devolver dos tipos diferentes.

Resultado:
Error: This expression has type string but an expression was expected of type
         int

Correccion:
ninguna.
*)
(if 3 < 5 then 8 else 10) + 4;;
(*
Prediccion:
- : int = 12

Resultado:
- : int = 12

Correccion:
ninguna.
*)
2.0 *. asin 1.0;;
(*
Prediccion:
- : float = 3.14159

Resultado:
- : float = 3.14159265358979312

Correccion:
no recuerdaba mas de cinco decimales de pi.
*)
sin (2.0 *. asin 1.0 /. 2.);;
(*
Prediccion:
- : float = 1.57079

Resultado:
- : float = 3.14159265358979312

Correccion:
no recuerdaba mas de cinco decimales de pi.
*)
function x -> 2 * x;;
(*
Prediccion:
- : int -> int = <fun>

Resultado:
- : int -> int = <fun>

Correccion:
ninguna;
*)
(function x -> 2 * x) (2 + 1);;
(*
Prediccion:
- : int = 6

Resultado:
- : int = 6

Correccion:
ninguna;
*)
let x = 1;;
(*
Prediccion:
val x : int = 1

Resultado:
val x : int = 1

Correccion:
ninguna;
*)
let y = 2;;
(*
Prediccion:
val y : int = 2

Resultado:
val y : int = 2

Correccion:
ninguna;
*)
x - y;;
(*
Prediccion:
- : int = -1

Resultado:
- : int = -1

Correccion:
ninguna;
*)
let x = y in x -y;;
(*
Prediccion:
- : int = 0

Resultado:
- : int = 0

Correccion:
ninguna;
*)
x - y;;
(*
Prediccion:
- : int = -1

Resultado:
- : int = -1

Correccion:
ninguna;
*)
(*z;;*)
(*
Prediccion:
Error de ejecucion, valor de z no registrado.

Resultado:
Error: Unbound value y

Correccion:
ninguna;
*)
let z = x + y;;
(*
Prediccion:
val z : int = 3

Resultado:
val z : int = 3

Correccion:
ninguna;
*)
z;;
(*
Prediccion:
val z : int = 3

Resultado:
- : int = 3

Correccion:
solo recive el valor;
*)
let x = 5;;
(*
Prediccion:
val x : int = 5

Resultado:
val x : int = 5

Correccion:
ninguna;
*)
z;;
(*
Prediccion:
- : int = 3

Resultado:
- : int = 3

Correccion:
ninguna.
*)
let y = 5 in x + y;;
(*
Prediccion:
- : int = 10

Resultado:
- : int = 10

Correccion:
ninguna.
*)
x + y;;
(*
Prediccion:
- : int = 7

Resultado:
- : int = 7

Correccion:
ninguna.
*)
let x = x + y in let y = x * y in x + y + z;;
(*
Prediccion:
- : int = 24

Resultado:
- : int = 24

Correccion:
ninguna.
*)
x + y + z;;
(*
Prediccion:
- : int = 8

Resultado:
- : int = 8

Correccion:
ninguna.
*)
int_of_float;;
(*
Prediccion:
- : float -> int = <fun>

Resultado:
- : float -> int = <fun>

Correccion:
ninguna.
*)
float_of_int;;
(*
Prediccion:
- : int -> float = <fun>

Resultado:
- : int -> float = <fun>

Correccion:
ninguna.
*)
int_of_char;;
(*
Prediccion:
- : char -> int = <fun>

Resultado:
- : char -> int = <fun>

Correccion:
ninguna.
*)
char_of_int;;
(*
Prediccion:
- : int -> char = <fun>

Resultado:
- : int -> char = <fun>

Correccion:
ninguna.
*)
abs;;
(*
Prediccion:
- : float -> float = <fun>

Resultado:
- : float -> float = <fun>

Correccion:
ninguna.
*)
sqrt;;
(*
Prediccion:
- : float -> float = <fun>

Resultado:
- : float -> float = <fun>

Correccion:
ninguna.
*)
truncate;;
(*
Prediccion:
- : float -> int = <fun>

Resultado:
- : float -> int = <fun>

Correccion:
ninguna.
*)
ceil;;
(*
Prediccion:
- : float -> float = <fun>

Resultado:
- : float -> int = <fun>

Correccion:
ninguna.
*)
floor;;
(*
Prediccion:
- : float -> float = <fun>

Resultado:
- : float -> float = <fun>

Correccion:
ninguna.
*)
Char.code;;
(*
Prediccion:
- : char -> int = <fun>

Resultado:
- : char -> int = <fun>

Correccion:
ninguna.
*)
Char.chr;;
(*
Prediccion:
- : int -> char = <fun>

Resultado:
- : int -> char = <fun>

Correccion:
ninguna.
*)
Char.uppercase;;
(*
Prediccion:
- : char -> char = <fun>

Resultado:
- : char -> char = <fun>

Correccion:
ninguna.
*)
Char.lowercase;;
(*
Prediccion:
- : char -> char = <fun>

Resultado:
- : char -> char = <fun>

Correccion:
ninguna.
*)
int_of_string;;
(*
Prediccion:
- : string -> int = <fun>

Resultado:
- : string -> int = <fun>

Correccion:
ninguna.
*)
string_of_int;;
(*
Prediccion:
- : int -> string = <fun>

Resultado:
- : int -> string = <fun>

Correccion:
ninguna.
*)
String.length;;
(*
Prediccion:
- : string -> int = <fun>

Resultado:
- : string -> int = <fun>

Correccion:
ninguna.
*)
let f = function x -> 2 * x;;
(*
Prediccion:
val f : int -> int = <fun>

Resultado:
val f : int -> int = <fun>

Correccion:
ninguna.
*)
f (2+1);;
(*
Prediccion:
- : int = 6

Resultado:
- : int = 6

Correccion:
ninguna.
*)
f 2 + 1;;
(*
Prediccion:
- : int = 5

Resultado:
- : int = 5

Correccion:
ninguna.
*)
let n = 1;;
(*
Prediccion:
val n : int = 1
Resultado:
val n : int = 1

Correccion:
ninguna.
*)
let g x = x + n;;
(*
Prediccion:
val g : int -> int = <fun>
Resultado:
val g : int -> int = <fun>

Correccion:
ninguna.
*)
g 3;;
(*
Prediccion:
- : int = 4

Resultado:
- : int = 4

Correccion:
ninguna.
*)
let n = 5;;
(*
Prediccion:
val n : int = 5
Resultado:
val n : int = 5

Correccion:
ninguna.
*)
g 3;;
(*
Prediccion:
- : int = 8

Resultado:
- : int = 8

Correccion:
ninguna.
*)