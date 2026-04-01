#include <stdio.h>

int main()
{
    FILE *ptr;
    ptr = fopen("sampleCode.txt", "r");
    char ch;
    int count = 0;

    while ((ch = fgetc(ptr)) != EOF)
    {
        printf("%c", ch);
        if (ch != '\n' && ch != ' '  && ch != '\t' )
        {
            count++;
        }
    }

    printf("\nCounter:%d", count);

    return 0;
}