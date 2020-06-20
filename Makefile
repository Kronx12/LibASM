
NAME	= libasm.a

SRC		= 	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s	\
			ft_read.s	\
			ft_strdup.s

NASM	= nasm

SRCDIR	= ./src/

INCDIR	= ./includes/

CC_FLAG = -Wall -Werror -Wextra

MAIN	= main_test

FLAG	= -f elf64

SRCS	= $(addprefix $(SRCDIR), $(SRC))

OBJS	= $(SRCS:.s=.o)

.SILENT:

all: $(NAME)

$(NAME) : $(OBJS)
	echo "Compiling $(NAME)..."
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)
	echo "DONE"

%.o: %.s $(INCDIR)libasm.h
	$(NASM) $(FLAG) $<

clean:
	rm -rf $(OBJS)
	echo "Object files has been removed!"

fclean: clean
	rm -rf $(NAME)
	rm -rf main_test
	echo "$(NAME) has been removed!"

re: fclean all

test: all
	gcc $(CC_FLAG) -I$(INCDIR) -o $(MAIN) -L. -lasm main.c
	echo "$(MAIN) has been created!"
	./$(MAIN) test

.PHONY: all bonus clean fclean re test