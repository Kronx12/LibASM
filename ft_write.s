# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.le-101.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:14:33 by gbaud             #+#    #+#              #
#    Updated: 2020/03/07 13:17:05 by gbaud            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_write
	extern ___error

_ft_write:
	push rbp
	push r10
	mov rax, 0x02000004
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
