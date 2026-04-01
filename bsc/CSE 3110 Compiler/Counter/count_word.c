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
        if (ch == ' ' || ch == '\n' || ch == '\t')
        {
            count++;
        }
    }

    printf("\nCounter:%d", count+1);

    return 0;
}