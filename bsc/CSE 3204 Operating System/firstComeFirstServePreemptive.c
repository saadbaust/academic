#include <stdio.h>

int main()
{
    int i, j, n, m, process;
    int avgWT = 0;
    int avgTAT = 0;

    printf("Enter numer of process:");
    scanf("%d", &process);

    int burst_time[process];
    int waiting_time[process];
    int turn_around_time[process];

    for (i = 0; i < process; i++)
    {
        printf("BT of P-%d:", i);
        scanf("%d", &burst_time[i]);
    }
    // Calculate WT:
    waiting_time[0] = 0;
    for (i = 1; i < process; i++)
    {
        waiting_time[i] = 0;
        for (j = 0; j < i; j++)
        {
            waiting_time[i] = waiting_time[i] + burst_time[j];
        }
    }
    // Calculate TAT:
    for (i = 0; i < process; i++)
    {
        turn_around_time[i] = burst_time[i] + waiting_time[i];
    }

    for (i = 0; i < process; i++)
    {
        printf("WT:%d TAT:%d\n", waiting_time[i], turn_around_time[i]);
        // For average:
        avgWT = avgWT + waiting_time[i];
        avgTAT = avgTAT + turn_around_time[i];
    }

    avgWT = avgWT / process;
    avgTAT = avgTAT / process;

    printf("avgWT:%d avgTAT:%d", avgWT, avgTAT);

    return 0;
}