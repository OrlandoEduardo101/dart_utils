#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>

int main(){
}

int sum(int a, int b){
    return a+b;
}

int *multiply(int a, int b){
    int *multi = (int *)malloc(sizeof(int));
    *multi = a * b;
    return multi;
}

void free_pointer(int *int_pointer){
    free(int_pointer);
}

int subtract(int *a, int b){
    return *a - b;
}

int multi_sum(int nr_count, ...){
    va_list(nums);
    va_start(nums, nr_count);
    int sum = 0;
    for(int i = 0; i < nr_count; i++) {
      sum += va_arg(nums, int);
    }
    va_end(nums);
     return sum;
}