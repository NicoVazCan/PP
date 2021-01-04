
open St_tree

let is_single t =
	try let _ = branches t in false
	with No_branches -> true;;

let breadth_first = 
	let rec aux = function
		[] -> []
		|
		ht::tt -> (root ht)::(if(is_single ht)
			then aux tt
			else let (tl,tr) = branches ht
				in aux (tt @ [tl;tr]))
	in fun tree -> aux [tree];;