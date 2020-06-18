# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.le-101.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:16:35 by gbaud             #+#    #+#              #
#    Updated: 2020/03/07 13:16:35 by gbaud            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

section .data
	tab dd 0

section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	push rdi
	call _ft_strlen
	inc rax
	mov rdi, rax
	call _malloc
	cmp rax, 0
	je _end

	pop rsi
	mov rdi, rax
	call _ft_strcpy
	ret

_end:
	pop rdi
	ret
