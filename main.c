/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbaud <gbaud@student.le-101.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/07 05:01:40 by gbaud             #+#    #+#             */
/*   Updated: 2020/04/22 12:50:05 by gbaud            ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include "libasm.h"

int main()
{
	int res;
	int fd;
	char str[5];
	char ft_str[5];
	char buff[100];
	char *str_dup;
	
	// STRLEN =================
	printf("\nSTRLEN TEST 1 :\n\n");
	printf(">   strlen len: %lu\n", strlen("test_basic"));
	printf(">ft_strlen len: %lu\n", ft_strlen("test_basic"));
	
	printf("\nSTRLEN TEST 2 :\n\n");
	printf(">   strlen len: %lu\n", strlen(""));
	printf(">ft_strlen len: %lu\n", ft_strlen(""));
	
	// STRCPY =================
	printf("\nSTRCPY TEST 1 :\n\n");
	printf(">   strcpy ret: %s cpy:%s\n", strcpy(str, "test"), str);
	printf(">ft_strcpy ret: %s cpy:%s\n", ft_strcpy(ft_str, "test"), ft_str);
	
	printf("\nSTRCPY TEST 2 :\n\n");
	printf(">   strcpy ret: %s cpy:%s\n", strcpy(str, "ab\0cd"), str);
	printf(">ft_strcpy ret: %s cpy:%s\n", ft_strcpy(ft_str, "ab\0cd"), ft_str);
	
	// STRCMP =================
	printf("\nSTRCMP TEST 1 :\n\n");
	printf(">   strcmp ret: %d\n", strcmp("abc", "bcd"));
	printf(">ft_strcmp ret: %d\n", ft_strcmp("abc", "bcd"));
	
	printf("\nSTRCMP TEST 2 :\n\n");
	printf(">   strcmp ret: %d\n", strcmp("abc", "abc"));
	printf(">ft_strcmp ret: %d\n", ft_strcmp("abc", "abc"));
	
	printf("\nSTRCMP TEST 3 :\n\n");
	printf(">   strcmp ret: %d\n", strcmp("bcd", "abc"));
	printf(">ft_strcmp ret: %d\n", ft_strcmp("bcd", "abc"));
	
	printf("\nSTRCMP TEST 4 :\n\n");
	printf(">   strcmp ret: %d\n", strcmp("", ""));
	printf(">ft_strcmp ret: %d\n", ft_strcmp("", ""));
	
	// WRITE =================
	printf("\nWRITE TEST 1 :\n\n");
	errno = 0;
	res = write(0, "[str]\n", 6);
	printf(">   write len: %d errno: %d\n", res, errno);
	errno = 0;
	res = ft_write(0, "[str]\n", 6);
	printf(">ft_write len: %d errno: %d\n", res, errno);
	
	printf("\nWRITE TEST 2 :\n\n");
	errno = 0;
	res = write(0, (char *)(1), 1);
	printf(">   write len: %d errno: %d\n", res, errno);	
	errno = 0;
	res = ft_write(0, (char *)(1), 1);
	printf(">ft_write len: %d errno: %d\n", res, errno);
	
	// READ =================
	printf("\nREAD TEST 1 :\n\n");
	errno = 0;
	res = read(-1, buff, 5);
	printf(">   read len: %d errno: %d buff: %s\n", res, errno, buff);
	errno = 0;
	res = ft_read(-1, buff, 5);
	printf(">ft_read len: %d errno: %d buff: %s\n", res, errno, buff);
	
	printf("\nREAD TEST 2 :\n\n");
	errno = 0;
	fd = open("libasm.h", O_RDONLY);
	res = read(fd, buff, 5);
	printf(">   read len: %d errno: %d buff: %s\n", res, errno, buff);
	close(fd);
	errno = 0;
	fd = open("libasm.h", O_RDONLY);
	res = ft_read(fd, buff, 5);
	printf(">ft_read len: %d errno: %d buff: %s\n", res, errno, buff);
	close(fd);
	
	// STRDUP =================
	printf("\nSTRDUP TEST 1 :\n\n");
	printf(">   strdup (free juste apres) str: %s\n", str_dup = ft_strdup("balibalo"));
	free(str_dup);
	printf(">ft_strdup (free juste apres) str: %s\n", str_dup = ft_strdup("balibalo"));
	free(str_dup);
	
	printf("\nSTRDUP TEST 2 :\n\n");
	printf(">   strdup (free juste apres) str: %s\n", str_dup = ft_strdup(""));
	free(str_dup);
	printf(">ft_strdup (free juste apres) str: %s\n", str_dup = ft_strdup(""));
	free(str_dup);
	return (0);
}