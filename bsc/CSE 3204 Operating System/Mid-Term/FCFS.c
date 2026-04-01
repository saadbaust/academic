#include <stdio.h>

int main()
{
    int process, i, j, n, m;
    i = j = n = m = 0;
    scanf("%d", &process);
    int PID[process];
    int AT[process];
    int BT[process];
    int ATnew[process];
    int CT[process];
    int TAT[process];
    int WT[process];
    int RT[process];
    int GF[process];
    for (i = 0; i < process; i++)
    {
        scanf("%d %d %d", &PID[i], &AT[i], &BT[i]);
    }
    for (i = 0; i < process; i++)
    {
        ATnew[i] = AT[i];
    }
    int counter = 0;
    while (n != process)
    {
        counter = 0;
        for (i = 0; i < process; i++)
        {
            if (AT[i] <= m && AT[i] != -1)
            {
                AT[i] = -1;
                GF[j] = m;
                j++;
                m = m + BT[i];
                CT[n] = m;
                n++;
                counter++;
            }
            if (counter == 0)
            {
                m++;
            }
        }
    }
    for (i = 0; i < process; i++)
    {
        printf("%d ", CT[i]);
    }
    for (i = 0; i < process; i++)
    {
        TAT[i] = CT[i] - ATnew[i];
    }
    for (i = 0; i < process; i++)
    {
        printf("%d ", TAT[i]);
    }
    for (i = 0; i < process; i++)
    {
        WT[i] = TAT[i] - BT[i];
    }
    for (i = 0; i < process; i++)
    {
        printf("%d ", WT[i]);
    }
    for (i = 0; i < process; i++)
    {
        RT[i] = GF[i] - ATnew[i];
    }
    for (i = 0; i < process; i++)
    {
        printf("%d ", RT[i]);
    }

    return 0;
}