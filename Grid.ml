(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Grid.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:46:03 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/21 21:47:28 by jerdubos         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a r = Row of ('a list) | RNil

type 'a c = Cell of ('a r list) | CNil

type 'a g = Grid of ('a c list)

let rec getCell list n = match list with
  | Grid([]) -> CNil
  | Grid (head::tail) ->
	if n = 0 then
	  head
	else
	  getCell (Grid tail) (n - 1)

and getRow list n = match list with
  | Cell([]) | CNil -> RNil
  | Cell(head::tail) -> if n = 0 then
						  head
						else
						  getRow (Cell tail) (n - 1)

and getChar list n = match list with
  | Row([]) | RNil -> char_of_int 0
  | Row(head::tail) -> if n = 0 then
	  head
	else
	  getChar (Row tail) (n - 1)

let rec print_n c n =
  if n > 0
  then (print_char c ; print_n c (n - 1))

let displayGrid grid =
  let rec displayRow cell nbcell nbrow =
	match (getRow cell nbrow) with
	  | Row(a::b::c::[])	->
		begin
		  print_char a; print_char ' ';
		  print_char b; print_char ' ';
		  print_char c;
		  if (nbcell mod 3) <> 2 then
			print_string " | "
		  else
			print_newline ();
		  let nbcell2 = if (nbcell mod 3) = 2 && nbrow = 2 then
			  nbcell + 1
			else
			  if (nbcell mod 3) = 2 then
				nbcell - 2
			  else
				nbcell + 1
		  in
		  displayCell (getCell grid (nbcell2)) (nbcell2) (if (nbcell mod 3) = 2 then
			  nbrow + 1
			else
			  nbrow)
		end
	  | _					-> ()
  and displayCell cell nbcell nbrow =
	match cell with
	  | Cell(a::b::c::[])	->
		begin
		  if nbrow = 3 then
			(print_n '-' 21; print_newline (); displayRow cell nbcell 0)
		  else
			displayRow cell nbcell nbrow
		end
	  | _					-> ()
  in
  displayCell (getCell grid 0) 0 0; print_newline ()

let gridZero =
  Grid([
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
	Cell([
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-']);
	  Row(['-'; '-'; '-'])
	]);
  ])

let rec removeAt n = function
  | h::t -> if n = 0 then t else h::(removeAt (n - 1) t)
  | [] -> []

let rec insertAt c n = function
  | h::t as l -> if n = 0 then c::l else h::(insertAt c (n - 1) t)
  | [] -> [c]

let changeRowValue cell pos ch =
  match (getRow cell ((pos - 1) / 3)) with
	| RNil -> RNil
	| Row(r) -> Row (insertAt ch ((pos - 1) mod 3) (removeAt ((pos - 1) mod 3) r))

let changeCellValue grid cell pos row =
  match (getCell grid (cell - 1)) with
	| CNil -> CNil
	| Cell(c) -> Cell( insertAt row ((pos - 1) / 3) (removeAt ((pos - 1) / 3) c ))

let changeGridValue grid cell pos =
  match grid with
	| Grid(g) -> Grid ( insertAt cell (pos - 1) (removeAt (pos - 1) g))

let changeValue grid cell pos ch =
  changeGridValue grid (changeCellValue grid cell pos (changeRowValue (getCell grid (cell - 1)) pos ch)) cell

let checkValue grid cell pos =
  let c = getCell grid (cell - 1) in
  let r = getRow c ((pos - 1) / 3) in
  let ch = getChar r ((pos - 1) mod 3) in
  if ch = '-' then true
  else false
