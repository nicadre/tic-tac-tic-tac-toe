(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Grid.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:46:03 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/20 22:33:17 by jerdubos         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Play of (char list) list | Win of (char list) list

type g = Grid of (char list) list list

(*let getRow grid row = (match grid with
  | Win(c)	->
  | Play(l)	->)*)

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
  Grid (c::(List.nth (List.nth (List.nth grid (nb / 3 * ((cell + 2) / 3))) ((cell + 2) / 3)) ((nb + 2) / 3)))

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
