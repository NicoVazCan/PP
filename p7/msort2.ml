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
let rec divide l = match l with
    h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
  | _ -> l, [];;
(*
let rec merge = function
    [], l | l, [] -> l
  | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                      else h2 :: merge (h1::t1, t2);;

let rec msort1 l = match l with
    [] | _::[] -> l
  | _ -> let l1, l2 = divide l in
         merge (msort1 l1, msort1 l2);;
*)

(* 2º*)
let rec merge f = function
	[], l | l, [] -> l
	|
	h1::t1, h2::t2 -> if(f h1 h2) 
		then h1 :: merge f (t1, h2::t2)
		else h2 :: merge f (h1::t1, t2);;

let rec msort1 f l = match l with
	[] | _::[] -> l
	|
	_ -> let l1, l2 = divide l
		in merge f (msort1 f l1, msort1 f l2);;

(*
El problema se da con listas de 100_000 o mas elementos
por culpa de la funcion 'merge' como en este ejemplo:
# merge (<=) (List.init 50_000 abs, List.init 50_000 abs);;
Stack overflow during evaluation (looping recursion?).

En cambio 'divide' puede llegar hasta 300_000 elementos
sin dar stack overflow, por lo que nunca se llega a producir
al usar la funcion 'msort1' porque lo produce 'mergue' antes.
*)
let l2 = List.init 100_000 abs;;

let divide' =
	let rec bucle lo (l1, l2) = match lo with
		[] -> (l1, l2)
		|
		h::[] -> (h::l1, l2)
		|
		h1::h2::t -> bucle t (h1::l1, h2::l2)
	in fun l
	-> bucle (List.rev l) ([], []);;

let merge' f p =
	let rec bucle po lf = match po with
		[], l | l, [] -> List.rev_append lf l
		|
		(h1::t1, h2::t2) -> if(f h1 h2)
			then bucle (t1, h2::t2) (h1::lf)
			else bucle (h1::t1, t2) (h2::lf)
	in
	bucle p [];;

let rec msort2 f l = match l with
	[] | _::[] -> l
	|
	_ -> let l1, l2 = divide' l
		in merge' f (msort2 f l1, msort2 f l2);;

(*
El divide no terminal el mas rapido que el terminal, como es
de esperar ya que recorre dos veces la misma lista.
# crono divide (List.init 200_000 abs) 10;;
- : float = 0.163738999999999635
# crono divide' (List.init 200_000 abs) 10;;
- : float = 0.224640999999998314

El merge no terminal resulto ser mas lento que el terminal
sorprendentemente a pesar de recorrer dos veces ambas listas.
# crono (merge (<=)) ((List.init 40_000 abs), (List.init 40_000 abs)) 10;;
- : float = 0.176403000000000532
# crono (merge' (<=)) ((List.init 40_000 abs), (List.init 40_000 abs)) 10;;
- : float = 0.106774999999998954

Al comparar los tres algorimos comprobamos que msort1 es
el mas rapido en todos los casos, pero tampoco hay tanta
diferencia con msor2 asi que puede compensar si el objetivo
es ordenar listas con muchos elementos.
Cabe añadir que qsort2 alcanza una gran diferencia de tiempo
con los demas en el caso de recivir una lista ordenada
decrecientemente, ya que su complejidad se vuelve cuadratica,
mientras que las otras dos se mantienen en n*log(n).

# let ranl = randlist 10 10;;
val ranl : int list = [2; 8; 6; 6; 9; 9; 1; 4; 8; 8]
# let masl = creclist 10;;
val masl : int list = [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]
# let menl = decrlist 10;;
val menl : int list = [9; 8; 7; 6; 5; 4; 3; 2; 1; 0]

# crono (msort1 (<)) ranl 10;;
- : float = 0.000108000000011543307
# crono (msort2 (<)) ranl 10;;
- : float = 0.000120000000001805347
# crono (qsort2 (<)) ranl 10;;
- : float = 0.000134999999999996234

# crono (msort1 (<)) masl 10;;
- : float = 0.000101999999998270141
# crono (msort2 (<)) masl 10;;
- : float = 0.000149999999990768629
# crono (qsort2 (<)) masl 10;;
- : float = 0.000150999999999984488

# crono (msort1 (<)) menl 10;;
- : float = 0.000104000000007431481
# crono (msort2 (<)) menl 10;;
- : float = 0.000158999999996467523
# crono (qsort2 (<)) menl 10;;
- : float = 0.000202000000000007729
*)