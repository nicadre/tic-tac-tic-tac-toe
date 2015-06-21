#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/21 10:42:19 by niccheva          #+#    #+#              #
#    Updated: 2015/06/21 21:53:22 by jerdubos         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

RESULT = tic-tac-tic-tac-toe

SOURCES =	Grid.ml			\
			main.ml

fclean: cleanup
	rm -f $(RESULT)

include OCamlMakefile
