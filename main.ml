(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:44:33 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/21 21:49:56 by jerdubos         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec main grid player =
  Grid.displayGrid grid ;
  print_endline (player ^ "'s turn to play") ;
  let s = read_line () in
  if (String.length s) <> 3 || s.[0] < '1' || s.[0] > '9' || s.[1] <> ' ' || s.[2] < '1' || s.[2] > '9'
  then (print_endline "Format error or incorrect values." ; main grid player)
  else
	if Grid.checkValue grid ((int_of_char s.[0]) - 48) ((int_of_char s.[2]) - 48)
	then main (Grid.changeValue grid ((int_of_char s.[0]) - 48) ((int_of_char s.[2]) - 48) player.[0]) (if player.[0] = 'X' then "O" else "X")
	else (print_endline "You cannot play there." ; main grid player)

let () = main Grid.gridZero "O"
