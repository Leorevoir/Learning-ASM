##
## EPITECH PROJECT, 2024
## Learning-ASM
## File description:
## Makefile
##

SRC = sub.asm

OBJECT = sub.o

NAME = sub

all: $(NAME)

$(OBJECT): $(SRC) macros.asm
	@nasm -f elf32 $(SRC) -o $(OBJECT)
	@printf "[\033[1;32mSUCCESS\033[0m] Assembled %s\n" $(OBJECT)

$(NAME): $(OBJECT)
	@ld -m elf_i386 -s -o $(NAME) $(OBJECT)
	@printf "[\033[1;32mSUCCESS\033[0m] Compiled %s\n" $(NAME)

run: $(NAME)
	@printf "[\033[1;32mSUCCESS\033[0m] Executed %s\n" $(NAME)
	@./$(NAME)

clean:
	@printf "[\033[1;32mSUCCESS\033[0m] Removed %s\n" $(OBJECT)
	@rm -f $(OBJECT)

fclean: clean
	@printf "[\033[1;32mSUCCESS\033[0m] Removed %s\n" $(NAME)
	@rm -f $(NAME)

re: fclean all

.PHONY: all run clean fclean re
