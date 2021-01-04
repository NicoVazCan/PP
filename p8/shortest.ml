let all_next_cells (i,j) =
	[(i-2,j-1);(i-2,j+1);(i-1,j+2);(i+1,j+2);
	 (i+2,j+1);(i+2,j-1);(i+1,j-2);(i-1,j-2)];;

let next_cola = function
	[] -> []
	|
	h::t -> List.map (fun a -> a::h::t) (all_next_cells h);;

let rec mem_h a = function
	[] -> false
	|
	h::t -> ((List.hd h) = a) || (mem_h a t);;

let valid_cell (i,j) x y = i > 0 && i <= y && j > 0 && j <= x;;

let next_cells cola path x y =
	List.filter (function 
		[] -> false
		|
		h::_ -> not(mem_h h path) && (valid_cell h x y)) (next_cola cola);;

let shortest_tour x y pi pf =
	let rec buscar path = match path with
	[] -> raise(Not_found)
	|
	h::t -> if((List.hd h) = pi)
			then h
			else buscar (t @ (next_cells h t x y))
	in if(valid_cell pi x y && 
	      valid_cell pf x y &&
	   	pi <> pf)
		then buscar(next_cells [pf] [] x y)
		else raise(Failure "Argumento no valido");;