#include <stdio.h>
#define MAX 8
// 7,5,6,4,3,2,1,0 => 7,6,0,4,1,2,3,5,
// 7 6       5 4 3 2 1 0
//應該要7 6   0 1 2 3 4 5
// state 1後 => 1,2,3,4,5,6,7,0
// state 2後 => 0,2,3,4,5,6,7,1
// state 3後 => 7,6,5,4,3,2,0,1
int main()
{
    int nnn = 1;
    int sdsd = 1;
    for (int sd = MAX; sd > 0; sd = sd - 1)
    {
        sdsd = sd * sdsd;
    }

    int a[MAX];
    for (int i = 0; i < MAX; i++)
    {
        a[i] = i;
    }

    // int a[MAX] = {7, 5, 6, 4, 3, 2, 1, 0};

    printf("%d:", nnn++);
    for (int ptr = MAX - 1; ptr >= 0; ptr--)
    {
        printf("%d,", a[ptr]);
    }
    printf("\n");
    while (1)
    {
        int ptr;
        int flag = 0;
        for (ptr = MAX - 2; ptr >= 0; ptr--)
        {
            if (a[ptr] < a[ptr + 1])
            {
                flag = 1;
                break;
            }
        }
        if (flag == 0)
            break;
        int replace_ptr = ptr;
        int min = 9999;
        int min_ptr = 0;
        for (ptr = replace_ptr + 1; ptr < MAX; ptr++)
        {
            if (a[ptr] > a[replace_ptr])
            {
                if (min > a[ptr])
                {
                    min = a[ptr];
                    min_ptr = ptr;
                }
            }
        }
        int temp;
        temp = a[min_ptr];
        a[min_ptr] = a[replace_ptr];
        a[replace_ptr] = temp;
        int tran_ptr_max = MAX - 1, tran_ptr_min;

        for (tran_ptr_min = replace_ptr + 1; tran_ptr_min < tran_ptr_max;)
        {
            temp = a[tran_ptr_max];
            a[tran_ptr_max] = a[tran_ptr_min];
            a[tran_ptr_min] = temp;
            tran_ptr_max = tran_ptr_max - 1;
            tran_ptr_min = tran_ptr_min + 1;
        }
        printf("%d:", nnn++);
        for (ptr = MAX - 1; ptr >= 0; ptr--)
        {
            printf("%d,", a[ptr]);
        }
        printf("\n");
        if (sdsd == nnn)
        {
            break;
        }
        if (nnn - 1 == 5042) // 5040~5041有錯
            break;
    }
    printf("\n");
    printf("sdsd=%d\n", sdsd);
    return 0;
}