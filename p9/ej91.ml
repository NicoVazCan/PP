open Bin_tree

let rec fold_tree f b = function 
	Empty -> b
	|
	Node(v, l, r) -> f v (fold_tree f b l) (fold_tree f b r);; 

let sum tree = fold_tree(fun a b1 b2 -> a + b1 + b2) 0 tree;;


let prod tree = fold_tree(fun a b1 b2 -> a *. b1 *. b2) 1. tree;;


let num_nodes tree = fold_tree(fun _ b1 b2 -> 1 + b1 + b2) 0 tree;;


let in_order tree = fold_tree(fun a b1 b2 -> b1 @ (a::b2)) [] tree;;


let mirror tree = fold_tree(fun a b1 b2 -> Node(a,b2,b1)) Empty tree;;

let prod2 tree = try
	(fold_tree(fun a b1 b2 -> match a with
			0. -> raise(Failure "0")
			|
			a -> a *. b1 *. b2) 1. tree) 
	with Failure _ -> 0.;;