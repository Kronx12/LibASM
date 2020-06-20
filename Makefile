# Name of file
NAME        =    libasm.a

# Name directory
PATH_INC    =    includes
PATH_SRC    =    srcs
PATH_OBJ    =    objs
PATH_LOG    =    logs

# List of sources
SRCS        =    $(wildcard $(PATH_SRC)/*.s)
OBJS        =    $(addprefix $(PATH_OBJ)/, $(notdir $(SRCS:.s=.o)))
INCS        =    $(wildcard $(PATH_INC)/*.h)
LOG         =    $(addprefix $(PATH_LOG)/, $(patsubst %.a.log,%.log,$(NAME).log))

# Commands of compilation
COMP        =    nasm
COMP_FLAG   =    -f elf64
COMP_ADD    =    -I$(PATH_INC)

# Others Command
RM          =    /bin/rm

# Color Code and template code
_YELLOW     =    \e[38;5;184m
_GREEN      =    \e[38;5;46m
_RESET      =    \e[0m
_INFO       =    [$(_YELLOW)INFO$(_RESET)]
_SUCCESS    =    [$(_GREEN)SUCCESS$(_RESET)]

# Functions
all:				init $(NAME)
	@ echo "$(_SUCCESS) Compilation done in $$(($$(date +%S)-$$(cat logs/time.log)))s"
	@ $(RM) -rf $(PATH_LOG)/time.log

init:
	@ date +%S > $(addprefix $(PATH_LOG)/, time.log)
	@ $(shell mkdir -p $(PATH_OBJ) $(PATH_LOG))

$(NAME):			$(OBJS) $(INCS)
	@ (set -x; ar rcs $(NAME) $(OBJS)) >> $(LOG) 2>&1

$(PATH_OBJ)/%.o :	$(PATH_SRC)/%.s $(INCS)
	@ (set -x; $(COMP) $(COMP_FLAG) $(COMP_ADD) $< -o $@) >> $(LOG) 2>&1
	@ echo "$(_INFO) Compilation of $*"

clean:
	@ $(RM) -rf $(PATH_OBJ)
	@ echo "$(_INFO) Deleted files and directory"

fclean:				clean
	@ $(RM) -rf $(NAME)
	@ $(RM) -rf $(PATH_LOG)
	@ $(RM) -rf libasm

re:					fclean all

run:				$(NAME)
	@ (set -x; gcc -Wall -Werror -Wextra -no-pie $(COMP_ADD) -o libasm main.c -L. -lasm) >> $(LOG) 2>&1

.PHONY: all clean fclean re run init