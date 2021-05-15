#include <stdio.h>
#include <errno.h>

//int	ft_strlen(char *str);
//int	ft_strcmp(char *s1, char *s2);
char	*ft_strcpy(char *dest, char *src);

int main()
{
	char *str = "String_";
	char *str2 = "String";
	printf("%s\n", str);
//	printf("%d\n", ft_strlen(str));
//	printf("%d\n", ft_strcmp(str, str2));
	char empty[10];
	//printf("default %s\n", strcpy(empty, str));
	printf("asm     %s\n", ft_strcpy(empty, str));
	printf("errno %s\n", strerror(errno));
}

