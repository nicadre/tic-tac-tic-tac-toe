(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Grid.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/20 09:46:03 by niccheva          #+#    #+#             *)
(*   Updated: 2015/06/20 11:20:16 by niccheva         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Play of (char list) list | Win of (char list) list

let getRow grid row = match grid with
  | Win(c)	-> 
  | Play(l)	->
