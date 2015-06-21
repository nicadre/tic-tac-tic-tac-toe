#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/21 10:42:19 by niccheva          #+#    #+#              #
#    Updated: 2015/06/21 21:55:46 by jerdubos         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

RESULT = tic-tac-tic-tac-toe

SOURCES =	Grid.ml			\
			main.ml

include OCamlMakefile

fclean: cleanup
	rm -f $(RESULT)
