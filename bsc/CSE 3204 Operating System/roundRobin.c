// Round Robin in C:
#include <stdio.h>
// Main function:
int main()
{
    int NOP, RNOP, i, sum = 0, Q, saad = 0;
    printf("Enter num of process:");
    scanf("%d", &NOP);
    RNOP = NOP;
    int bt[NOP];
    int at[NOP];
    int tempBT[NOP];
    for (i = 0; i < NOP; i++)
    {
        printf("AT-BT:\n");
        scanf("%d %d", &at[i], &bt[i]);
        tempBT[i] = bt[i];
    }
    printf("Enter Quantam:");
    scanf("%d", &Q);
    // Main calculation:
    i = 0;
    while (RNOP != 0)
    {
        if (tempBT[i] != 0 && tempBT[i] <= Q)
        {
            sum = sum + tempBT[i];
            tempBT[i] = 0;
            saad = 1;
        }
        else if (tempBT[i] != 0)
        {
            sum = sum + Q;
            tempBT[i] = tempBT[i] - Q;
        }

        if (tempBT[i] == 0 && saad == 1)
        {
            printf("%d ", sum - at[i] - bt[i]);
            RNOP--;
            saad = 0;
        }

        if (i == NOP - 1)
        {
            i = 0;
        }
        else if (at[i + 1] <= sum)
        {
            i++;
        }
        else
        {
            i = 0;
        }
    }
    return 0;
}