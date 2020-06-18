# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:15:17 by gbaud             #+#    #+#              #
#    Updated: 2020/06/18 18:43:24 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_read
	extern __errno_location

_ft_read:
	push rbp
	push r10
	mov rax, 0x02000003
	syscall
	jnc end
	mov r10, rax
	call __errno_location
	mov [rax], r10
	mov rax, -1
end:
	pop r10
	pop rbp
	ret
