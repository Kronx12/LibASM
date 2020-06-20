# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:15:26 by gbaud             #+#    #+#              #
#    Updated: 2020/06/20 17:00:26 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global ft_strcmp

ft_strcmp:
	push rbp
	push r11
	push r10
	push r8
	push r9
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	jmp _comp

_inc_val:
	inc r8
	inc r9

_comp:
	cmp byte [rdi + r8], 0
	je _end
	cmp byte [rsi + r9], 0
	je _end

_loop:
	mov r11b, byte [rsi + r9]
	cmp byte [rdi + r8], r11b
	jne _end
	jmp _inc_val

_end:
	mov r10b, byte [rdi + r8]
	mov r11b, byte [rsi + r9]
	sub r10d, r11d
	cmp r10b, 0
	mov rax, r10
	pop r8
	pop r9
	pop r10
	pop r11
	pop rbp
	ret
