CC=clang
FLAGS= -Wall -Wextra -Werror
NAME=libasm.a
SRCS=src/ft_strlen.s \
	 src/ft_strcpy.s \
	 src/ft_strcmp.s \
	 src/ft_write.s \
	 src/ft_read.s \
	 src/ft_strdup.s
OBJS=$(SRCS:.s=.o)
RM=rm -f
	
%.o: %.s
	nasm -f elf64 $< -o $@

all:		$(NAME)

$(OBJS):	$(INC)

$(NAME): 	$(INC) $(OBJS)
	ar rcs $(NAME) $(OBJS)

test:		all
	$(CC) $(FLAGS) -I./includes/libasm.h libasm.a main.c -o tester

clean:
	$(RM) $(OBJS) $(BNS)

fclean: 	clean
	$(RM) $(NAME)

re:		fclean all

.PHONY: all bonus clean fclean re test
