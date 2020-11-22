(*
4.
*)
let goldbach g =
	let is_prm n =
		let rec not_divisible_from d =
			d * d > n || (n mod d <> 0 && not_divisible_from (d+1)) in
	n > 1 && not_divisible_from 2
	in
		let rec bucle x = 
			if(is_prm x && is_prm(g-x))
			then
				(x, g-x)
			else
				bucle(x+1)
		in 
			if(g > 3 && g mod 2 == 0)
			then
				bucle 2
			else
				raise(Invalid_argument "Se esperaba un numero par mayor que dos");;