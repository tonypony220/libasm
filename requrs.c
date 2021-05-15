#include <stdio.h>
int main()
{
   int x = 2;
   switch (x)
   {
       case 1: printf("Choice is 1\n");
               break;
       case 2: 
			   printf("Choice is 2\n");
			   return 0;
       case 3: printf("Choice is 3\n");
       default: printf("Choice other than 1, 2 and 3\n");
                break; 
   }
   printf("dddddddddddddd");
   return 0;
}
