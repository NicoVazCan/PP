let all_next_cells (i,j) =
	[(i-2,j-1);(i-2,j+1);(i-1,j+2);(i+1,j+2);
	 (i+2,j+1);(i+2,j-1);(i+1,j-2);(i-1,j-2)];;

let valid_cell (i,j) x y = i > 0 && i <= y && j > 0 && j <= x;;

let next_cells (i,j) path x y =
	List.filter (fun
		a -> not(List.mem a path) && (valid_cell a x y))
			(all_next_cells(i,j));;

let tour x y pi pf =
	let rec buscar path next = match next with
		[] -> raise(Not_found)
		|
		h::t -> if(h = pi)
			then h::path
			else try buscar (h::path) (next_cells h path x y) with
				Not_found -> buscar path t
	in if(valid_cell pi x y && 
	      valid_cell pf x y && 
	   	pi <> pf)
		then buscar [pf] (next_cells pf [] x y)
		else raise(Failure "Argumento no valido");;
