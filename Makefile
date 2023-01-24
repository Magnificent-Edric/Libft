# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: medric <medric@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/13 18:02:43 by medric            #+#    #+#              #
#    Updated: 2021/10/18 17:42:15 by medric           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME  = libft.a
CFLAGS = -Wall -Wextra -Werror
FUNCS = ft_isalnum.c ft_atoi.c ft_isalpha.c  ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_striteri.c ft_isascii.c ft_strmapi.c ft_isdigit.c ft_itoa.c ft_split.c ft_isprint.c ft_strlen.c ft_tolower.c ft_strtrim.c ft_toupper.c ft_atoi.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_strnstr.c ft_strlcat.c ft_strlcpy.c ft_strdup.c ft_calloc.c ft_substr.c ft_strjoin.c ft_strcmp.c 	
FUNCS_B	= ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

OBJ = ${FUNCS:.c=.o}
OBJ_B = $(FUNCS_B:.c=.o)
HDR = libft.h
RM = rm -f
CC = gcc
AR = ar rcs

all: $(NAME)

$(OBJ) : $(HDR) Makefile
$(OBJ_B) :$(HDR) Makefile

.c.o:
	$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

bonus: $(OBJ) $(OBJ_B)
	$(AR) $(NAME) $(OBJ) $(OBJ_B)

clean:
	$(RM) $(OBJ) $(OBJ_B)

fclean: clean
	$(RM) $(NAME)

so:
	$(CC) -nostartfiles -fPIC $(CFLAGS) $(FUNCS)
	gcc -nostartfiles -shared -o libft.so $(OBJ)

re: fclean all

.PHONY: all clean fclean re bonus