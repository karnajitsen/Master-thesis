#include<stdio.h>
#include<math.h>
#include <time.h>
int main()
{

   FILE *fp;
   int m; //, n, p, pr = 4, csize = 8;
   //struct timeval tv1, tv2;
   m = 100;
   // gettimeofday(&tv2, NULL);
   fp = fopen("execute.sh", "w+");
   fprintf(fp, "cd data\n");
   fprintf(fp, "mv result.txt result.bk_%d\n",(int)time(NULL));
   
   fprintf(fp, "cd ..\n");

   while ( (m*8.0/1024 ) < 300)
        {
   fprintf(fp, "./kr %d\n", m);
    m +=10;
    }
   //fprintf(fp, "gnuplot plot.in\n");
   fclose(fp);
   return 0;
}