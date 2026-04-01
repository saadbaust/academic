#include <stdio.h>

int main()
{
    FILE *fptr;
    FILE *fptr2;

    char ch[100];

    fptr = fopen("readfromfile.txt", "r");
    fptr2 = fopen("output.txt", "w");

    while (fgets(ch, 100, fptr) != NULL)
    {
        fprintf(fptr2, "%s", ch);
        printf("%s", ch);
    }

    return 0;
}
