(*Practica 6*)
(*
let rec suml = function
	[] -> 0
	| h::t -> h + suml t;;
*)
let suml l = List.fold_left (+) 0 l;;

(*
let rec maxl = function
	[] -> raise (Failure "maxl")
	| h::[] -> h
	| h::t -> max h (maxl t);;
*)
let maxl = function 
	[] -> raise(Failure "maxl")
	|
	(h::t) -> List.fold_left max h t;;

(*
let rec to0from n =
	if n < 0 then []
	else n :: to0from (n-1);;
*)
let to0from n =
	let rec bucle l k = if(k <= n)
		then bucle (k::l) (k+1)
		else l
	in bucle [] 0;;

(*
let rec fromto m n =
	if m > n then []
	else m :: fromto (m+1) n;;
*)
let fromto m n = 
	let rec bucle l k = if(k >= m)
		then bucle (k::l) (k-1)
		else l
	in bucle [] n;;

(*
let rec from1to n =
	if n < 1 then []
	else from1to (n-1) @ [n];;
*)
let from1to n = fromto 1 n;;

(*
let append = List.append;;
*)
let append l1 l2 = List.rev_append(List.rev l1) l2;;

(*
let map = List.map;;
*)
let map f l = List.rev_map f (List.rev l);;

(*
let power x y =
	let rec innerpower x y =
		if y = 0 then 1
		else x * innerpower x (y-1)
	in
	if y >= 0 then innerpower x y
		else invalid_arg "power";;
*)
let power x y =
	let rec bucle s = function
		1 -> s
		|
		k -> bucle (x*s) (k-1)
	in if(y < 0)
		then invalid_arg "power"
		else if(y = 0)
			then 1
			else bucle x y;;

(*
let incseg l =
	List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;
*)
let incseg =
	let rec bucle lo lf k = match lo with
		[] -> List.rev lf
		|
		h::t -> let aux = h + k
		in bucle t (aux::lf) aux
	in fun l
	-> bucle l [] 0;;

(*
let rec remove x = function
	[] -> []
	| h::t -> if x = h then t
		else h :: remove x t;;
*)
let remove n l =
	let rec quitar lo la = match lo with
		[] -> l
		|
		h::t -> if(h == n)
			then List.rev_append la t
			else quitar t (h::la)
	in quitar l [];;

(*
let rec insert x = function
	[] -> [x]
	| h::t -> if x <= h then x::h::t
		else h :: insert x t;;
*)
let insert n l =
	let rec anadir lo la = match lo with
		[] -> List.rev (n::la)
		|
		h::t -> if(h > n)
			then List.rev_append (n::la) lo
			else anadir t (h::la)
	in anadir l [];;

(*
let rec insert_gen f x l = match l with
	[] -> [x]
	| h::t -> if f x h then x::l
		else h :: insert_gen f x t;;
*)
let insert_gen f n l =
	let rec anadir lo la = match lo with
		[] -> List.rev (n::la)
		|
		h::t -> if(f n h)
			then List.rev_append (n::la) lo
			else anadir t (h::la)
	in anadir l [];;
