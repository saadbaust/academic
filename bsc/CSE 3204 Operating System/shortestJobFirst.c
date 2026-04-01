#include <stdio.h>

int main()
{
    int i, j, process, possition, temp;
    printf("Enter number of process:");
    scanf("%d", &process);
    int pid[process];
    int wt[process];
    int bt[process];

    printf("Enter Burst Time:\n");
    for (i = 0; i < process; i++)
    {
        printf("p%d: B:", i);
        scanf("%d", &bt[i]);
        pid[i] = i;
    }
    for (i = 0; i < process; i++)
    {
        possition = i;
        for (j = i + 1; j < process; j++)
        {
            if (bt[j] < bt[possition])
            {
                possition = j;
            }
        }
        temp = bt[i];
        bt[i] = bt[possition];
        bt[possition] = temp;

        temp = pid[i];
        pid[i] = pid[possition];
        pid[possition] = temp;

    
    }
    for (i = 0; i < process; i++)
    {
        printf("P%d: B:%d\n", pid[i], bt[i]);
    }
    wt[0] = 0;
    for (i = 1; i <= process; i++)
    {
        wt[i] = 0;
        for (j = 0; j < i; j++)
        {
            wt[i] = wt[i] + bt[j];
        }
    }
    for (i = 0; i <= process; i++)
    {
        printf("%d ", wt[i]);
    }

    return 0;
}