#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: niccheva <niccheva@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/20 09:39:55 by niccheva          #+#    #+#              #
#    Updated: 2015/06/20 09:45:45 by niccheva         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME			=	tic-tac-toe

SOURCES			=	main.ml

CAMLC			=	ocamlc
CAMLOPT			=	ocamlopt
CAMLDEP			=	ocamldep


all: depend $(NAME)

$(NAME): opt byt
	ln -s $(NAME).opt $(NAME)

opt: $(NAME).opt
byt: $(NAME).byt

OBJS			=	$(SOURCES:.ml=.cmo)
OPTOBJS			=	$(SOURCES:.ml=.cmx)

$(NAME).byt: $(OBJS)
	$(CAMLC) -o $(NAME).byt $(LIBS) $(OBJS)

$(NAME).opt: $(OPTOBJS)
	$(CAMLOPT) -o $(NAME).opt $(LIBS:.cma=.cmxa) $(OPTOBJS)

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(CAMLC) -c $<

.mli.cmi:
	$(CAMLC) -c $<

.ml.cmx:
	$(CAMLOPT) -c $<

clean:
	rm -f *.cm[iox]
	rm -f *.o
	rm -f .depend

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME).opt
	rm -f $(NAME).byt

depend: .depend
	$(CAMLDEP) $(SOURCES) > .depend

.depend:
	touch .depend

re: fclean all

include .depend
