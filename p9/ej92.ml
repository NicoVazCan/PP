open Bin_tree

let rec insert_tree f a = function
	Empty -> Node(a, Empty, Empty)
	|
	Node(v, tl, tr) -> if(f v a)
		then Node(v, tl, insert_tree f a tr)
		else Node(v, insert_tree f a tl, tr);;

let sort f l =
	in_order (List.fold_left (fun a x -> insert_tree f x a) Empty l) ;;