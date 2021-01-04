let all_next_cells (i,j) =
	[(i-2,j-1);(i-2,j+1);(i-1,j+2);(i+1,j+2);
	 (i+2,j+1);(i+2,j-1);(i+1,j-2);(i-1,j-2)];;

let valid_cell (i,j) x y = i > 0 && i <= y && j > 0 && j <= x;;

let next_cells (i,j) path x y =
	List.filter (fun a -> (not(List.mem a path)) && (valid_cell a x y))
			(all_next_cells(i,j));;

let knight_tour x y pi = let xy = x*y in
	let rec buscar path next k = match next with
		[] -> if(k < xy)
			then raise(Not_found)
			else List.rev path
		|
		h::t -> try buscar (h::path) (next_cells h path x y) (k+1) with
			Not_found -> buscar path t k
	in if(valid_cell pi x y)
		then buscar [pi] (next_cells pi [] x y) 1
		else raise(Failure "Argumento no valido");;