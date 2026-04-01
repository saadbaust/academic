#include <stdio.h>

int main()
{
    int i, j, k, m, n, s, flag, indx;
    indx = 0;
    int alloc[4][3] = {
        {0, 1, 0},
        {2, 0, 0},
        {3, 0, 2},
        {2, 1, 1},
    };
    int max[4][3] = {
        {7, 5, 3},
        {3, 2, 2},
        {9, 0, 2},
        {2, 2, 2},
    };
    int need[4][3];
    int available[3] = {3, 3, 4};
    int ans[4];
    int com[4];
    for (j = 0; j < 4; j++)
    {
        com[j] = 0;
    }
    // Find Need Matrix:
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 3; j++)
        {
            need[i][j] = max[i][j] - alloc[i][j];
        }
    }
    // Find Safe Sequence:
    for (k = 0; k < 4; k++) // Step 4
    {
        for (i = 0; i < 4; i++) // Step 1
        {
            if (com[i] != 1) // Step 5
            {
                flag = 0;
                for (j = 0; j < 3; j++) // Step 2
                {
                    if (need[i][j] > available[j])
                    {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 0) // Step 3
                {
                    ans[indx++] = i;
                    for (s = 0; s < 3; s++)
                    {
                        available[s] = available[s] + alloc[i][s];
                    }
                    com[i] = 1;
                }
            }
        }
    }
    // Print deadlock or sequence:
    int saad = 0;
    for (i = 0; i < 4; i++)
    {
        if (com[i] == 0)
        {
            saad = 1;
            printf("Deadlock!\n");
            break;
        }
    }
    if (saad != 1)
    {
        for (i = 0; i < 4; i++)
        {
            printf("P:%d-> ", n = ans[i] + 1);
        }
    }

    return 0;
}