(*Practica 3*)
(*
1.
*)
let rec gcd a b = match (a, b) with
    (0, 0) -> raise(Failure "Infinitos divisores")
    |
    (0, b) -> b
    |
    (a, 0) -> a
    |
    (a, b) -> gcd b (a mod b);;

(*
2.

Tanto 'is_prm' como 'is_prm2' son funciones de 'int -> bool' que
comprueban si el entero introducido es o no primo.

Considero mas optima la funcion 'is_prm' ya que al comprobar antes
que el cuadrado del divisor auxiliar sea mayor que el numero 
insertado, nos evitamos hacer el modulo del numero insertado por
todos los numeros menores o iguales al este. Además, de esta
forma no se deja operaciones pendientes que puedan colapsar el stack.
*)
(*
3
*)
let capicua x =
	let list_of_string stg = List.init (String.length stg) (String.get stg)
	in let lis = list_of_string (string_of_int x)
		in lis = (List.rev lis);;
