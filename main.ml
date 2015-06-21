(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:44:33 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/21 16:29:08 by niccheva         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let grid = Grid([
					 Cell([
							 Row(['A'; '-'; '-']);
							 Row(['-'; 'B'; '-']);
							 Row(['-'; '-'; 'C'])
						 ]);
					 Cell([
							 Row(['-'; 'D'; '-']);
							 Row(['-'; '-'; 'E']);
							 Row(['F'; '-'; '-'])
						 ]);
					 Cell([
							 Row(['-'; '-'; 'G']);
							 Row(['H'; '-'; '-']);
							 Row(['-'; 'I'; '-'])
						 ]);
					 Cell([
							 Row(['J'; '-'; '-']);
							 Row(['-'; 'K'; '-']);
							 Row(['-'; '-'; 'L'])
						 ]);
					 Cell([
							 Row(['-'; 'M'; '-']);
							 Row(['-'; '-'; 'N']);
							 Row(['O'; '-'; '-'])
						 ]);
					 Cell([
							 Row(['-'; '-'; 'P']);
							 Row(['Q'; '-'; '-']);
							 Row(['-'; 'R'; '-'])
						 ]);
					 Cell([
							 Row(['S'; '-'; '-']);
							 Row(['-'; 'T'; '-']);
							 Row(['-'; '-'; 'U'])
						 ]);
					 Cell([
							 Row(['-'; 'V'; '-']);
							 Row(['-'; '-'; 'W']);
							 Row(['X'; '-'; '-'])
						 ]);
					 Cell([
							 Row(['-'; '-'; 'Y']);
							 Row(['Z'; '-'; '-']);
							 Row(['-'; '8'; '-'])
						 ]);
				 ])
  in
  let grid2 = Grid.initializeGrid 3 3 in
(*  Grid.displayGrid grid 3 1 ;*)
  let test = Grid.changeValue grid2 7 9 'X' in
  Grid.displayGrid grid2 3 1 ;
  Grid.displayGrid test 3 1
