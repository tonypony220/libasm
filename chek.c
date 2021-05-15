#include <stdio.h>
#include <errno.h>

//int	ft_strlen(char *str);
//int	ft_strcmp(char *s1, char *s2);
//char	*ft_strcpy(char *dest, char *src);

//ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
//ssize_t read(int fildes, void *buf, size_t nbyte);
char		*ft_strdup(const char *src);

int main()
{
	char *str = "String_";
	char *str2 = "String";
//	printf("%s\n", str);
	printf("%d\n", ft_strdub(str));
//	printf("%d\n", ft_strcmp(str, str2));
	char empty[10];
	//printf("default %s\n", strcpy(empty, str));
	//printf("asm     %s\n", ft_strcpy(empty, str));
//	printf("write ret %zu\n", ft_read(0, empty, 4));//strerror(errno));
//	printf("write ret %zu\n", ft_read(8, empty, 4));//strerror(errno));
//	//printf("write ret %zu\n", ft_write(1, "Ok!\n", 4));//strerror(errno));
//	printf("%s\n", strerror(errno));
}

