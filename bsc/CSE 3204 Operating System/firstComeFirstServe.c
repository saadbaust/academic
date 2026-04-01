// FCFS code in C:
#include <stdio.h>
// Main function:
int main()
{
    // Declaration:
    int processNum, i, j, m, n;
    i = j = m = n = 0;
    // Take number of process:
    printf("Enter number of process:\n");
    scanf("%d", &processNum);
    // Declare array with process size:
    int PID[processNum];
    int AT[processNum];
    int ATnew[processNum];
    int BT[processNum];
    int CT[processNum];
    int TAT[processNum];
    int WT[processNum];
    int RT[processNum];
    int GFrist[processNum];
    // Take PID, AT and BT:
    for (i = 0; i < processNum; i++)
    {
        scanf("%d %d %d", &PID[i], &AT[i], &BT[i]);
    }
    // Storing in temp for modify:
    for (i = 0; i < processNum; i++)
    {
        ATnew[i] = AT[i];
    }
    // Main calculation:
    int count = 0;
    while (n != processNum)
    {
        count = 0;
        for (i = 0; i < processNum; i++)
        {
            if (AT[i] <= m && AT[i] != -1)
            {
                AT[i] = -1;
                GFrist[j] = m;
                j++;
                m = m + BT[i];
                CT[n] = m;
                n++;
                count++;
            }
        }
        if (count == 0)
        {
            m++;
        }
    }
    printf("\nCompletion Time: ");
    for (i = 0; i < processNum; i++)
    {
        printf("%d ", CT[i]);
    }
    // Calculate TAT:
    for (i = 0; i < processNum; i++)
    {
        TAT[i] = CT[i] - ATnew[i];
    }
    printf("\nTurn Around Time: ");
    for (i = 0; i < processNum; i++)
    {
        printf("%d ", TAT[i]);
    }
    // Calculate WT:
    for (i = 0; i < processNum; i++)
    {
        WT[i] = TAT[i] - BT[i];
    }
    printf("\nWaiting Time: ");
    for (i = 0; i < processNum; i++)
    {
        printf("%d ", WT[i]);
    }
    // Calculate RT:
    for (i = 0; i < processNum; i++)
    {
        RT[i] = GFrist[i] - ATnew[i];
    }
    printf("\nWaiting Time: ");
    for (i = 0; i < processNum; i++)
    {
        printf("%d ", RT[i]);
    }
    // End of pera:

    return 0;
}