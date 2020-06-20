# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:16:58 by gbaud             #+#    #+#              #
#    Updated: 2020/06/20 17:00:37 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global ft_strlen

_inc_val:
	inc rax
	inc rdi
	jmp _loop

ft_strlen:
	push rbp
	mov rax, 0
	jmp _loop

_loop:
	cmp byte [rdi], 0
	jne _inc_val
	pop rbp
	ret
