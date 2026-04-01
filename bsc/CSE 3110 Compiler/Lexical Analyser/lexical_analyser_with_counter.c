#include <stdio.h>
#include <string.h>

int main()
{
    char c;
    char ar[5000];
    char temp[100];
    int count = 0;
    int count2 = 0;
    int count3 = 0;
    int count4 = 0;
    int count5 = 0;
    int n = 0, i;
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
    // File type pointer is needed to communicate with file:
    FILE *ptr;
    FILE *ptr2;
    // Opening files with mode:
    ptr = fopen("code.txt", "r");
    ptr2 = fopen("output.txt", "w");
    // Reading from file and putting in an array:
    while ((c = getc(ptr)) != EOF)
    {
        ar[n] = c; // Putting in array
        n++;
        putc(c, ptr2); // Putting in output file *****
    }
    // TRAVARSING ARRAY by character:
    for (i = 0; i < n; i++)
    {
        // CHARACTER COUNT:
        if (ar[i] != '\n' && ar[i] != ' ') // Ignoring line break and whitespace **
        {
            count++;
        }
        // LINE COUNT:
        if (ar[i] == '\n' && ar[i + 1] != '\n') // Counting line break but ignoring double line break **
        {
            count2++;
        }
        // SINGLE COMMENT COUNT:
        if (ar[i] == '/' && ar[i + 1] == '/')
        {
            count3++;
        }
        // MULTI COMMENT COUNT:
        if (ar[i] == '/' && ar[i + 1] == '*')
        {
            count4++;
            i = i + 2;
            while (ar[i] != '*' && ar[i + 1] != '/')
            {
                i++;
            }
        }
        // Print array
        printf("%c", ar[i]);
    }
    // Read word by word
    ptr = fopen("code.txt", "r");
    while (fscanf(ptr, "%s", temp) != EOF)
    {
        count5++;
        int l = strlen(temp);
        // Printf("%s ", temp);
        // CHECK KEYWORD:
        for (i = 0; i < 32; i++)
        {
            if (strcmp(temp, keyword[i]) == 0)
            {
                printf("%s ", temp);
                printf("Keyword!\n");
                goto label;
            }
        }
        // CHECK CONTROL:
        for (i = 0; i < 32; i++)
        {
            if (strcmp(temp, control[i]) == 0)
            {
                printf("%s ", temp);
                printf("Control!\n");
                goto label;
            }
        }
        // CHECK CONDITION:
        for (i = 0; i < 32; i++)
        {
            if (strcmp(temp, control[i]) == 0)
            {
                printf("%s ", temp);
                printf("Control!\n");
                goto label;
            }
        }
        // CHECK OPERATOR:
        for (i = 0; i < 32; i++)
        {
            if (strcmp(temp, operator[i]) == 0)
            {
                printf("%s ", temp);
                printf("Operator!\n");
                goto label;
            }
        }
        // CHECK BRANCH:
        for (i = 0; i < 32; i++)
        {
            if (strcmp(temp, branch[i]) == 0)
            {
                printf("%s ", temp);
                printf("Branch!\n");
                goto label;
            }
        }
        // IDENTIFIER CHECK
        for (i = 0; i < l; i++)
        {
            if (temp[i] >= 'A' && temp[i] <= 'Z' || temp[i] >= 'a' && temp[i] <= 'z' || temp[i] >= '0' && temp[i] <= '9' || temp[i] == '_')
            {
                if (temp[0] >= '0' && temp[0] <= '9')
                {
                    goto label;
                }
            }
            else
            {
                break;
            }
        }
        if (i == l)
        {
            for (i = 0; i < l; i++)
            {
                printf("%c", temp[i]);
            }

            printf("Identifier\n");
        }
    label:
        printf("");
    }
    printf("Char:%d\n", count);
    printf("Line:%d\n", count2);
    printf("SingleComment:%d\n", count3);
    printf("MultiComment:%d\n", count4);
    printf("Word:%d\n", count5);
    fclose(ptr);

    return 0;
}
