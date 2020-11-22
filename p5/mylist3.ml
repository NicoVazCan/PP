(*Opcional practica 5*)

let rec remove e = function
		[] -> []
		|
		h::t -> if(h = e)
			then t
			else h::(remove e t);;

(*remove_all terminal*)
let remove_all e l =
	let rec buscar lo lf = match lo with
		[] -> lf
		|
		h::t -> if(h = e)
			then buscar t lf
			else buscar t (h::lf)
	in buscar (List.rev l) [];;

(*remove_all no terminal (por curiosidad)
let rec remove_all e = function
		[] -> []
		|
		h::t -> if(h = e)
			then remove_all e t
			else h::(remove_all e t);;
*)

let ldif =
	let aux = fun l e -> remove_all e l
	in fun l1 l2
	-> List.fold_left aux l1 l2;;

let lprod l1 l2 =
	let rec bucle la lb = match (la, lb) with
		([], []) -> []
		|
		([], _) -> raise(Failure "lprod")
		|
		(_, []) -> raise(Failure "lprod")
		|
		(ha::[], hb::[]) -> (ha, hb)::[]
		|
		(ha::ta, hb::[]) -> (ha, hb)::(bucle ta l2)
		|
		(ha::[], hb::tb) -> (ha, hb)::(bucle (ha::[]) tb)
		|
		(ha::ta, hb::tb) -> (ha, hb)::(bucle (ha::ta) tb)
	in
	bucle l1 l2;;

let divide =
	let rec saltar = function
		[] -> []
		|
		h::[] -> h::[]
		|
		h::_::t -> h::(saltar t)
	in function
	[] -> raise(Failure "divide")
	|
	(h::t) -> (saltar (h::t), saltar t);;