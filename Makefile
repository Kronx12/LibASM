NAME=libasm.a
SRCS=ft_strlen.s \
	 ft_strcpy.s \
	 ft_strcmp.s \
	 ft_write.s \
	 ft_read.s \
	 ft_strdup.s
OBJS=$(SRCS:.s=.o)
RM=rm -f
	
%.o: %.s
	~/.brew/bin/nasm -f macho64 $^

all:		$(NAME)

$(OBJS):	$(INC)

$(NAME): 	$(INC) $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS) $(BNS)

fclean: 	clean
	$(RM) $(NAME)

re:		fclean all

.PHONY: all bonus clean fclean re
