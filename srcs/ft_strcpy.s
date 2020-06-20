# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:15:02 by gbaud             #+#    #+#              #
#    Updated: 2020/06/20 17:00:22 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global ft_strcpy

_inc_val:
	mov r9b, [rsi]
	mov byte [rdi + r8], r9b
	inc rsi
	inc r8
	jmp _loop

ft_strcpy:
	push rbp
	push r8
	push r9
	mov r8, 0
	jmp _loop

_loop:
	cmp byte [rsi], 0
	jne _inc_val
	mov byte [rdi + r8], 0
	mov rax, rdi
	pop r8
	pop r9
	pop rbp
	ret
