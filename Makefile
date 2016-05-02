#
# paths
#
INCDIR :=	./includes
SRCDIR :=	./sources

#
# compilation options
#
CXX :=		g++
CXXFLAGS :=	-I $(INCDIR) -W -Wall -Wextra -Werror -pedantic

#
# link options
#
LINKER :=	$(CXX)
LDFLAGS :=
LDLIBS :=	-l Irrlicht

#
# indie binary options
#
NAME :=		indie
SRC :=		main.cpp
SRC :=		$(addprefix $(SRCDIR)/, $(SRC))
OBJ :=		$(SRC:.cpp=.swag)

#
# main build rules
#
all:		$(NAME)

%.swag:		%.cpp
		$(CXX) -c $(CXXFLAGS) -o $@ $<

$(NAME):	$(OBJ)
		$(LINKER) -o $@ $^ $(LDFLAGS) $(LDLIBS)
		@echo === $@ BUILD COMPLETE ===

#
# clean rules
#
RM :=		rm -fv

clean:
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

#
# special rules
#
.PHONY:		all clean fclean re

.SILENT:	clean fclean

.DEFAULT:
		@echo nik ta mèr tu peu pa fèr sa
