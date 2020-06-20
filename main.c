/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gbaud <gbaud@student.42lyon.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/07 05:01:40 by gbaud             #+#    #+#             */
/*   Updated: 2020/06/20 18:09:08 by gbaud            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./includes/libasm.h"

int main()
{
	int res;
	int fd;
	char str[5];
	char ft_str[5];
	char buff[100];
	char *str_dup;
	
	// STRLEN =================
	printf("\033[1;32m\nSTRLEN TEST 1 :\n\n\033[0m");
	printf("\033[0;32m>   strlen len: %lu\n\033[0m", strlen("test_basic"));
	printf("\033[0;32m>ft_strlen len: %lu\n", ft_strlen("test_basic"));
	
	printf("\033[1;32m\nSTRLEN TEST 2 :\n\n\033[0m");
	printf("\033[0;32m>   strlen len: %lu\n\033[0m", strlen(""));
	printf("\033[0;32m>ft_strlen len: %lu\n", ft_strlen(""));
	
	// STRCPY =================
	printf("\033[1;32m\nSTRCPY TEST 1 :\n\n\033[0m");
	printf("\033[0;32m>   strcpy ret: %s cpy:%s\033[0m\n", strcpy(str, "test"), str);
	printf("\033[0;32m>ft_strcpy ret: %s cpy:%s\033[0m\n", ft_strcpy(ft_str, "test"), ft_str);
	
	printf("\033[1;32m\nSTRCPY TEST 2 :\n\n\033[0m");
	printf("\033[0;32m>   strcpy ret: %s cpy:%s\033[0m\n", strcpy(str, "ab\0cd"), str);
	printf("\033[0;32m>ft_strcpy ret: %s cpy:%s\033[0m\n", ft_strcpy(ft_str, "ab\0cd"), ft_str);
	
	// STRCMP =================
	printf("\033[1;32m\nSTRCMP TEST 1 :\n\n\033[0m");
	printf("\033[0;32m>   strcmp ret: %d\033[0m\n", strcmp("abc", "bcd"));
	printf("\033[0;32m>ft_strcmp ret: %d\033[0m\n", ft_strcmp("abc", "bcd"));
	
	printf("\033[1;32m\nSTRCMP TEST 2 :\n\n\033[0m");
	printf("\033[0;32m>   strcmp ret: %d\033[0m\n", strcmp("abc", "abc"));
	printf("\033[0;32m>ft_strcmp ret: %d\033[0m\n", ft_strcmp("abc", "abc"));
	
	printf("\033[1;32m\nSTRCMP TEST 3 :\n\n\033[0m");
	printf("\033[0;32m>   strcmp ret: %d\033[0m\n", strcmp("bcd", "abc"));
	printf("\033[0;32m>ft_strcmp ret: %d\033[0m\n", ft_strcmp("bcd", "abc"));
	
	printf("\033[1;32m\nSTRCMP TEST 4 :\n\n\033[0m");
	printf("\033[0;32m>   strcmp ret: %d\033[0m\n", strcmp("", ""));
	printf("\033[0;32m>ft_strcmp ret: %d\033[0m\n", ft_strcmp("", ""));
	
	// WRITE =================
	printf("\033[1;32m\nWRITE TEST 1 :\033[0m\n\n");
	errno = 0;
	res = write(0, "[str]\n", 6);
	printf("\033[0;32m>   write len: %d errno: %d\033[0m\n", res, errno);
	errno = 0;
	res = ft_write(0, "[str]\n", 6);
	printf("\033[0;32m>ft_write len: %d errno: %d\033[0m\n", res, errno);
	
	printf("\033[1;32m\nWRITE TEST 2 :\n\n\033[0m");
	errno = 0;
	res = write(0, (char *)(1), 1);
	printf("\033[0;32m>   write len: %d errno: %d\033[0m\n", res, errno);	
	errno = 0;
	res = ft_write(0, (char *)(1), 1);
	printf("\033[0;32m>ft_write len: %d errno: %d\033[0m\n", res, errno);
	
	// READ =================
	printf("\033[1;32m\nREAD TEST 1 :\n\n\033[0m");
	errno = 0;
	res = read(-1, buff, 5);
	printf("\033[0;32m>   read len: %d errno: %d buff: %s\033[0m\n", res, errno, buff);
	errno = 0;
	res = ft_read(-1, buff, 5);
	printf("\033[0;32m>ft_read len: %d errno: %d buff: %s\033[0m\n", res, errno, buff);
	
	printf("\033[1;32m\nREAD TEST 2 :\n\n\033[0m");
	errno = 0;
	fd = open("libasm.h", O_RDONLY);
	res = read(fd, buff, 5);
	printf("\033[0;32m>   read len: %d errno: %d buff: %s\033[0m\n", res, errno, buff);
	close(fd);
	errno = 0;
	fd = open("libasm.h", O_RDONLY);
	res = ft_read(fd, buff, 5);
	printf("\033[0;32m>ft_read len: %d errno: %d buff: %s\033[0m\n", res, errno, buff);
	close(fd);
	
	// STRDUP =================
	printf("\033[1;32m\nSTRDUP TEST 1 :\n\n\033[0m");
	printf("\033[0;32m>   strdup (free juste apres) str: [%s]\033[0m\n", str_dup = strdup("balibalo"));
	free(str_dup);
	printf("\033[0;32m>ft_strdup (free juste apres) str: [%s]\033[0m\n", str_dup = ft_strdup("balibalo"));
	free(str_dup);
	
	printf("\033[1;32m\nSTRDUP TEST 2 :\n\n\033[0m");
	printf("\033[0;32m>   strdup (free juste apres) str: [%s]\033[0m\n", str_dup = strdup(""));
	free(str_dup);
	printf("\033[0;32m>ft_strdup (free juste apres) str: [%s]\033[0m\n", str_dup = ft_strdup(""));
	free(str_dup);
	return (0);
}