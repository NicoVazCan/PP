(*Practica 4*)

let hd = function 
	[] -> raise(Failure "hd")
	|
	h::t -> h;;

let tl = function
	[] -> raise(Failure "tl")
	|
	h::t -> t;;

let rec length = function
	[] -> 0;
	|
	h::t -> 1 + length t;;

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

let filter f l =
	let rec bucle = function
		[] ->  []
		|
		h::t ->
			if(f h)
			then h::bucle t
			else bucle t
	in bucle l;;

let find_all = filter;;

let partition =
	let finv f x = not((f x))
	in fun f l ->
		(filter f l, (filter (finv f)) l);;

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

let init n f = if(n > 0)
	then
		let rec bucle k = if(k < n)
			then (f k)::(bucle (succ k))
			else []
		in
			bucle 0
	else
		raise(Invalid_argument "List.init");;

let rev =
	let rec bucle li = function 
		[] -> li
		|
		h::t -> (bucle (h::li)) t
	in 
		function l -> bucle [] l;;

let rec rev_append li lo = match li with
	[] -> lo
	|
	h::t -> rev_append t (h::lo);;

let concat =
	let rec bucle ll lr = match ll with
		[] -> lr
		|
		sl::t0 -> (bucle t0) (append lr sl)
	in function 
		[] -> []
		|
		ll -> bucle ll [];;

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