# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/07 13:14:33 by gbaud             #+#    #+#              #
#    Updated: 2020/06/20 17:46:45 by gbaud            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global ft_write
extern __errno_location

ft_write:
    mov rax, 1
    syscall
    test rax, rax
    jnl _end

_err:
	push r10
    neg rax
    mov r10, rax
    call __errno_location
    mov [rax], r10
    mov rax, -1
	pop r10

_end:
    ret
