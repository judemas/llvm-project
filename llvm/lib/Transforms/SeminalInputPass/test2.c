#include <stdio.h>
#include <stdlib.h>

int main() {
    char str1[1000];  // Corrected to a single character array
    FILE *fp;  // Use FILE, not File
    fp = fopen("file.txt", "r");
    
    char c;
    int len = 0;
    while (1) {
        if ((c =getc(fp)) == EOF) break;
        if (len >= 1000) break;  // Prevent buffer overflow
        str1[len++] = c;
    }
    str1[len] = '\0';  // Null-terminate the string
    fclose(fp);  // Close the file
    printf("%s\n", str1);  // Use regular quotes for the format string

    return 0;
}

