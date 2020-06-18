# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.le-101.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:16:58 by gbaud             #+#    #+#              #
#    Updated: 2020/03/07 13:16:58 by gbaud            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_inc_val:
	inc rax
	inc rdi
	jmp _loop

_ft_strlen:
	push rbp
	mov rax, 0
	jmp _loop

_loop:
	cmp byte [rdi], 0
	jne _inc_val
	pop rbp
	ret
