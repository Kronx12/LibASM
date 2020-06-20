# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:16:35 by gbaud             #+#    #+#              #
#    Updated: 2020/06/20 17:51:26 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
global ft_strdup
tab dd 0

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	push rdi
	call ft_strlen
	inc rax
	mov rdi, rax
	call malloc
	cmp rax, 0
	je _end

	pop rsi
	mov rdi, rax
	call ft_strcpy
	ret

_end:
	pop rdi
	ret
