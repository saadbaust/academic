#include <stdio.h>
#include <string.h>

int main()
{
    int i;
    // Array of fixed word to check:
    char keyword[32][10] = {
        "auto", "double", "int", "struct", "break", "long",
        "switch", "case", "enum", "register", "typedef", "char",
        "extern", "return", "union", "const", "float", "short",
        "unsigned", "continue", "signed", "void", "default",
        "sizeof", "voltile", "static"};
    char control[32][10] = {"for", "do", "while"};
    char condition[32][10] = {"if", "else", "else if"};
    char operator[32][10] = {"+", "-", "*", "/", "<", ">", "<=", ">=", "=", "==", "(", ")"};
    char branch[32][10] = {"goto", "jump"};

    // Read from file as word
    FILE *fp;
    char A[255]; // creating char array to store data of file
    fp = fopen("code.txt", "r");

    while (fscanf(fp, "%s", A) != EOF)
    {
        printf("%s ", A);
        // Find length of string:
        int l = strlen(A);
        for (i = 0; i < 32; i++)
        {
            if (strcmp(A, keyword[i]) == 0)
            {
                printf("Keyword!\n");
                goto label;
            }
        }
        for (i = 0; i < 32; i++)
        {
            if (strcmp(A, control[i]) == 0)
            {
                printf("Control!\n");
                goto label;
            }
        }
        for (i = 0; i < 32; i++)
        {
            if (strcmp(A, condition[i]) == 0)
            {
                printf("Condition!\n");
                goto label;
            }
        }
        for (i = 0; i < 32; i++)
        {
            if (strcmp(A, operator[i]) == 0)
            {
                printf("Operator!\n");
                goto label;
            }
        }
        for (i = 0; i < 32; i++)
        {
            if (strcmp(A, branch[i]) == 0)
            {
                printf("Branch!\n");
                goto label;
            }
        }
        for (i = 0; i < l; i++)
        {
            if (A[i] >= 'A' && A[i] <= 'Z' || A[i] >= 'a' && A[i] <= 'z' || A[i] >= '0' && A[i] <= '9' || A[i] == '_')
            {
                if (A[i] >= '0' && A[i] <= '9')
                {
                    printf("Invalid!\n");
                    goto label;
                }
            }
            else
            {
                printf("Invalid!\n");
                break;
            }
        }
        if (i == l)
        {
            printf("Identifier\n");
        }
    label:
        printf("\n");
    }
    fclose(fp);
}
