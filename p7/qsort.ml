(*Practica 7*)
(*Funciones auxiliares usadas*)
let randlist n m = 
	let rec bucle l k = if(k > 0)
		then bucle((Random.int m)::l) (k-1)
		else l
	in bucle [] n;;

let creclist n = List.init n (fun x -> x);;

let decrlist n = List.init n (fun x -> n-x-1);;

let crono f x k = 
	let t0 = Sys.time()
	in
	let rec bulcle k = if(k > 0)
		then (fun _ -> bulcle (k-1))(f x)
		else Sys.time() -. t0
	in bulcle k;;

(*Funciones del ejercicio*)
let rec qsort1 ord = function
    [] -> []
  | h::t -> let after, before = List.partition (ord h) t in
            qsort1 ord before @ h :: qsort1 ord after;;

let rec qsort2 ord =
  let append' l1 l2 = List.rev_append (List.rev l1) l2 in
  function
      [] -> []
    | h::t -> let after, before = List.partition (ord h) t in
              append' (qsort2 ord before) (h :: qsort2 ord after);;

(* 1º
En los casos en que la lista recivida ya este ordenada,
siendo el peor ordenada descendientemente en referencia
a la funcion 'ord'.
*)
(*
qsort2 reduce la cantidad de datos necesarios en el stack,
por lo que necesitaría de listas mas grandes para producirse
stack overflow, pero a costa de ser mas lenta qsort1.
Si, puede ordenar listas mucho mas grandes pero tras
bastante tiempo.
*)
(*Lista que da stack overflow con qsort1 pero no con qsor2,
se que es aleatoria pero al menos a mi me ocurrio.*)
let l1 = randlist 600000 600000;;

(*
# let ranl = randlist 10 10;;
val ranl : int list = [2; 8; 6; 6; 9; 9; 1; 4; 8; 8]
# let masl = creclist 10;;
val masl : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]
# let menl = decrlist 10;;
val menl : int list = [9; 8; 7; 6; 5; 4; 3; 2; 1; 0]

# crono (qsort1 (<)) ranl 10;;
- : float = 0.000103999999999992987
# crono (qsort2 (<)) ranl 10;;
- : float = 0.000134999999999996234
# crono (qsort1 (<)) masl 10;;
- : float = 0.000126999999999988233
# crono (qsort2 (<)) masl 10;;
- : float = 0.000150999999999984488
# crono (qsort1 (<)) menl 10;;
- : float = 0.000159000000000020236
# crono (qsort2 (<)) menl 10;;
- : float = 0.000202000000000007729

Como se puede ver en la comprobacion, qsort2 es mas lenta
que qsort1 en todos los caso por un 20% de tiempo medio.
La causa de este aumento en el tiempo de ejecucion de qsort2
respecto a qsort1 es debido a que se remplaza el List.append
no terminal, por un append' terminal que recorre dos veces la
lista a unir delante de la otra, mientras que la no terminal
solo una vez.
*)