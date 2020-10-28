(*3. Ejercicio opcional.*)
(*Con deficiones locales.*)
let e1 =
	let pi = 2. *. asin 1. in pi *. (pi +. 1.);;
(*Con aplicacion de funciones*)
let e1 =
	(function pi -> pi *. (pi +. 1.)
	)(2. *. asin 1.);;

(*Con deficiones locales.*)
let e2 =
	let lg2 = log 2. in
	let log2 = function x -> log x /. lg2 
	in log2 (float (1024 * 1024));;
(*Con aplicacion de funciones*)
let e2 =
	(function lg2 -> 
		(function log2 -> log2 (float (1024 * 1024))
		)(function x -> log x /. lg2)
	)(log 2.);;

(*Con deficiones locales.*)
let e3 =
	let pi_2 = 4. *. asin 1. in
	function r -> pi_2 *. r;;
(*Con aplicacion de funciones*)
let e3 =
	(function pi_2 -> 
		(function r -> pi_2 *. r)
	)(4. *. asin 1.);;

(*Con deficiones locales.*)
let e4 =
	let sqr = function x -> x *. x in
	let pi = 2. *. asin 1. in
	function r -> pi *. sqr r;;
(*Con aplicacion de funciones*)	
let e4 =
	(function sqr ->
		(function pi ->
			function r -> pi *. sqr r
		)(2. *. asin 1.)
	)(function x -> x *. x);;