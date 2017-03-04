##
## Makefile for 42sh in /home/VEYSSI_B/rendu/Programmation_Shell/test/test_42tree
##
## Made by Baptiste veyssiere
## Login   <VEYSSI_B@epitech.net>
##
## Started on  Wed May 18 21:26:30 2016 Baptiste veyssiere
##

NAME	= libasm.so

RM	= rm -f

CC	= gcc

ASM	= nasm -f elf64

MKDIR	= mkdir -p

SRC	= srcs/strlen.S

SRCDIR	= srcs

OBJDIR	= objs

OBJ	= $(SRC:$(SRCDIR)/%.S=$(OBJDIR)/%.o)

$(NAME): $(OBJ)
	@$(CC) -shared -o $(NAME) $(OBJ)
	@echo "Linking complete!"

$(OBJ): $(OBJDIR)/%.o : $(SRCDIR)/%.S
	@$(MKDIR) $(OBJDIR)
	@$(ASM) $< -o $@
	@echo "Compiled "$<" successfully!"

all: $(NAME)

clean:
	@$(RM) $(OBJ)
	@echo "Cleanup complete!"

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
