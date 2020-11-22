(*Practica 5*)

let hd = function 
	[] -> raise(Failure "hd")
	|
	h::t -> h;;

let tl = function
	[] -> raise(Failure "tl")
	|
	h::t -> t;;

let length =
	let rec contar n = function
		[] -> n
		|
		h::t -> contar (n+1) t
	in function n -> contar 0 n;;

let rec compare_lengths l1 l2 = match (l1, l2) with
	([],[]) -> 0
	|
	([],_) -> -1
	|
	(_,[]) -> 1
	|
	(h1::t1,h2::t2) -> compare_lengths t1 t2;;

let rec nth l n =
	let rec bucle k = function
		[] -> raise(Failure "nth")
		|
		h::t -> if(k = n)
			then h
			else bucle (k+1) t
	in bucle 0 l;;

let rec append l1 l2 = match l1 with
	[] -> l2
	|
	h::t -> h::append t l2;;

let rec find f = function
	[] -> raise(Not_found)
   |
   h::t -> if(f h)
		then h
		else find f t;;

let rec for_all f = function
	[] -> true
	|
	h::t -> f h && for_all f t;;

let rec exists f = function
	[] -> false
	|
	h::t -> f h || exists f t;;

let rec mem a = function
	[] -> false
	|
	h::t -> h = a || mem a t;;

let rev =
	let rec bucle lo lf = match lo with
		[] -> lf
		|
		h::t -> bucle t (h::lf)
	in 
		function l -> bucle l [];;

let filter f l =
	let rec bucle lo lf = match lo with
		[] -> rev lf
		|
		h::t -> if(f h)
			then bucle t (h::lf)
			else bucle t lf
	in bucle l [];;

let find_all = filter;;

let partition f l =
	let rec bucle lt lf lo = match lo with
		[] -> (lt, lf)
		|
		h::t -> if(f h)
			then bucle (h::lt) lf t
			else bucle lt (h::lf) t
	in bucle [] [] (rev l);;

let rec map f = function
	[] -> []
	|
	h::t -> (f h)::((map f) t);;

let split l = ((map fst) l, (map snd) l);;

let rec combine la lb = match (la,lb) with
	([],[]) -> []
	|
	([],_) -> raise(Invalid_argument "List.combine")
	|
	(_,[]) -> raise(Invalid_argument "List.combine")
	|
	((ha::ta),(hb::tb)) -> (ha,hb)::(combine ta tb);;

let init n f =
	let rec aux lf = function
		(-1) -> lf 
		|
		k -> aux ((f k)::lf) (k - 1)
	in if(n < 0)
		then raise(Invalid_argument "List.init")
		else aux [] (n - 1);;

let rec rev_append li lo = match li with
	[] -> lo
	|
	h::t -> rev_append t (h::lo);;

let concat =
	let rec bucle ll ls = match ll with
		[] -> []
		|
		_::tl -> (match ls with
			[] -> bucle tl (match tl with 
				[] -> [] | hs::_ -> hs)
			|
			hs::ts -> hs::(bucle ll ts))
	in function 
	[] -> []
	|
	(hl::tl) ->	bucle (hl::tl) hl;;

let flatten = concat

let rev_map f l =
	let rec bucle la lb = match la with
		[] -> lb
		|
		h::t -> (bucle t) ((f h)::lb)
  in bucle l [];;

let rec map2 =
	let rec bucle lf lb = match (lf,lb) with
		([],[]) -> []
		|
		([],_) -> raise(Invalid_argument "List.map2")
		|
		(_,[]) -> raise(Invalid_argument "List.map2")
		|
		((hf::tf),(hb::tb)) -> (hf hb)::(bucle tf tb)
	in fun f la lb
	-> bucle (map f la) lb;;

let rec fold_left f x l = match l with
	[] -> x
	|
	h::t -> fold_left f (f x h) t;;

let rec fold_right f l x = match l with
	[] -> x
	|
	h::t -> f h (fold_right f t x);;