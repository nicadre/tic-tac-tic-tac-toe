(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Grid.mli                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: jerdubos <jerdubos@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/21 21:20:37 by jerdubos          #+#    #+#             *)
(*   Updated: 2015/06/21 21:44:53 by jerdubos         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a g

val displayGrid : char g -> unit
val gridZero : char g
val changeValue : 'a g -> int -> int -> 'a -> 'a g
val checkValue : char g -> int -> int -> bool
