(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Grid.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:46:03 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/21 17:53:36 by niccheva         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type r = Row of (char list) | RNil

type c = Cell of (r list) | CNil

type g = Grid of (c list)

let rec getCell list n = match list with
  | Grid([]) -> CNil
  | Grid (head::tail) -> if n = 0 then
						   head
						 else
						   getCell (Grid tail) (n - 1)

let rec getRow list n = match list with
  | Cell([]) | CNil -> RNil
  | Cell(head::tail) -> if n = 0 then
						  head
						else
						  getRow (Cell tail) (n - 1)

let rec getChar list n = match list with
  | Row([]) | RNil -> (char_of_int 0)
  | Row(head::tail) -> if n = 0 then
						 head
					   else
						 getChar (Row tail) (n - 1)

let makeList n =
  let rec loop l n =
	match l with
	  | h::t -> if n > 0 then loop (List.append l [h]) (n - 1) else l
	  | [] -> loop [ ['-'; '-'; '-'] ] (n - 1)
  in
  loop [] n

let initializeGrid col row =
  let rec loop l col row =
	match l with
	  | h::t -> if row > 0 then loop (List.append l [h]) col (row - 1) else l
	  | [] -> loop [ (makeList col) ] col (3 * row - 1)
  in
  Grid (loop [] col row)

let changeValue grid cell nb c =
  (List.nth
	 (List.nth
		(List.nth grid (((nb + 2) / 3 * ((cell + 2) / 3)) - 1))
		(((cell + 1) / 3))
	 )
	 (((nb + 1) / 3))
  )

let rec print_n c n =
  if n > 0
  then (print_char c ; print_n c (n - 1))

let rec displayGrid grid col l =
  let rec displayCell cell n m =
	let rec displayRow row n =
	  match row with
		| c::[] -> print_char c ; displayRow [] n
		| h::t -> print_char h ; print_char ' ' ; displayRow t n
		| [] -> if (n = 1 || n = 2) then print_string " | "
	in
	match cell with
	  | h::t -> displayRow h n ; displayCell t (n + 1) m
	  | [] -> if (m <> col * 3 && m mod 3 = 0) then (print_newline () ; print_n '-' (7 * col) ; print_newline ())
		else if (m <> col * 3) then print_newline ()
  in
  match grid with
	| Grid (h::t) -> displayCell h 1 l ; displayGrid (Grid t) col (l + 1)
	| Grid [] -> print_newline ()


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
