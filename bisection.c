#include <stdio.h>
#include <math.h>

/* Sample function */
float f(float x){
    float result;
    result = 2*x -tan(x);
    return result;
}

void BisectionMethod(float x_min, float x_max, float tolerance){
    float x_med;
    int i, max_iterations;
    if(f(x_min) * f(x_max) > 0){
        printf("\n Wrong range");
    }
    else{
        x_med = x_max;
        do{
            if(f(x_min) * f(x_med) < 0){
                x_max = x_med;
            }
            else{
                x_min = x_med;
            }
            x_med = (x_min + x_max) / 2;
            printf("%d, %f, %f \n",i, x_med, f(x_med));
            i++;
        }while(f(x_med) > tolerance || f(x_med) < -tolerance);
    }

}

int main(){
    float x_min, x_max, x_med, tolerance;
    int i = 1, max_iterations;
    x_min = 0.8;
    x_max = 1.4;
    tolerance = 10e-5;
    BisectionMethod(x_min, x_max, tolerance);
    return 0;
}