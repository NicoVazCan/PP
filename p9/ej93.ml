open G_tree

let breadth_first_t tree =
	let rec aux l = function
		Gt(v,[]) -> List.rev (v::l)
		|
		Gt(v,((Gt(vs,lt))::tt)) 
			-> aux (v::l) (Gt(vs, (List.rev_append (List.rev tt) lt)))
	in aux [] tree;;

let t = Gt(0, List.init 300_000 (fun n -> Gt(n, [])));;