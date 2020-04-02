# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.le-101.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:15:17 by gbaud             #+#    #+#              #
#    Updated: 2020/03/07 13:15:20 by gbaud            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_read
	extern ___error

_ft_read:
	push rbp
	push r10
	mov rax, 0x02000003
	syscall
	jnc end
	mov r10, rax
	call ___error
	mov [rax], r10
	mov rax, -1
end:
	pop r10
	pop rbp
	ret
