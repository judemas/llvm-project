/**
  @file catalog.c
*/
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
/** Multiplier for converting degrees to radians */
#define DEG_TO_RAD ( M_PI / 180 )
/** Radius of the earth in miles. */
#define EARTH_RADIUS 3959.0
#define LINE_LIMIT 3
#define NAME_LIMIT 40
/* max no of counties */
#define COUNTY_NUM_LIMIT 5
/* max no of characters in county */
#define COUNTY_CHAR_LIMIT 12
/** Initial size of line variable */
#define INITIAL_LINE_SIZE 128
/** factor by which line is resized */
#define SIZE_MULTIPLIER 2
/**
  attributes of field Park
*/
typedef struct {
   int id;
   double latitude;
   double longitude;
   int numCounties;
   char name[NAME_LIMIT + 1];
   char counties[COUNTY_NUM_LIMIT][COUNTY_CHAR_LIMIT + 1];

} Park;

/**
  attributes of field Catalog
*/
typedef struct {
   Park **list;
   int count;
   int capacity;
} Catalog;


static double globalDistance( double lat1, double lon1, double lat2, double lon2 );


char *readLine(FILE *fp){
   int size = INITIAL_LINE_SIZE;  
   char *line = (char *)malloc(size * sizeof(char));
   if (line == NULL){
      return NULL;
   }
   int count = 0;
   char c;
   while ((c = fgetc(fp)) != '\n' && c != EOF){
      if (count >= size){
         size *= SIZE_MULTIPLIER;
         line = (char *)realloc( line, size * sizeof( char ) );
      }
      line[count] = c;
      count++;
      
      
   }
   if (count >= size){
         size *= SIZE_MULTIPLIER;
         line = (char *)realloc( line, size * sizeof( char ) );
      }
   if (count == 0){
      free(line);
      return NULL;
   }
   line[count] = '\0';
   
   return line;

}

double distance(  Park const *a, Park const *b ){
   return globalDistance(a->latitude, a->longitude, b->latitude,b->longitude);
   
}

double globalDistance( double lat1, double lon1, double lat2, double lon2 )
{
  // OK, pretend the center of the earth is at the origin, turn these
  // two locations into vectors pointing from the origin.
  // This could be simplified.
   double v1[] = { cos( lon1 * DEG_TO_RAD ) * cos( lat1 * DEG_TO_RAD ),
                  sin( lon1 * DEG_TO_RAD ) * cos( lat1 * DEG_TO_RAD ),
                  sin( lat1 * DEG_TO_RAD ) };

   double v2[] = { cos( lon2 * DEG_TO_RAD ) * cos( lat2 * DEG_TO_RAD ),
                  sin( lon2 * DEG_TO_RAD ) * cos( lat2 * DEG_TO_RAD ),
                  sin( lat2 * DEG_TO_RAD ) };

  // Dot product these two vectors.
   double dp = 0.0;
   for ( int i = 0; i < sizeof( v1 ) / sizeof( v1[ 0 ] ); i++ )
     dp += v1[ i ] * v2[ i ];
  
  // Compute the angle between the vectors based on the dot product.
   double angle = acos( dp );
  
  // Return distance based on the radius of the earth.
   return EARTH_RADIUS * angle;
}

Catalog *makeCatalog() {
  Catalog *catalog = (Catalog *)malloc(sizeof(Catalog));
  if (catalog == NULL) {
      exit(1);
   }
   catalog->capacity = COUNTY_NUM_LIMIT;
   catalog->list = (Park **)malloc( catalog->capacity * sizeof( Park ) );
   catalog->count = 0;
   return catalog;

}

void freeCatalog(Catalog *catalog) {
    
   free(catalog->list);
   free(catalog);
}

void readParks( char const *filename, Catalog *catalog ){
   FILE *fp = fopen(filename, "r");
   if (fp == NULL) {
      fprintf(stderr, "Can't open file: %s\n", filename);
      exit(1);
   }

   char *line;
   
   
   while ((line = readLine(fp)) != NULL){
      int equals = 0;
      if (strcmp(line, "") == 0){
         break;
      }
      if (catalog->count >= catalog->capacity ){
         catalog->capacity += 1;
         catalog->list = (Park **)realloc( catalog->list, catalog->capacity * sizeof( Park ) );
      }
       
      Park *park = (Park *)malloc(sizeof(Park));
      park->id = 0;
      park->latitude = 0;
      park->longitude = 0;
      park->numCounties = 0;
       
      for (int c = 0; c < COUNTY_NUM_LIMIT; c++) {
          park->counties[c][0] = '\0';
       }
       
      equals = sscanf(line, "%d %lf %lf", &park->id, &park->latitude, &park->longitude);
      if (equals != LINE_LIMIT){
          fprintf(stderr, "Invalid park file: %s\n", filename);
          exit(1);
      }
       
      int i = 0;
      while(!isalpha(line[i])){
          i++;
      }
      int k = 0;
      while (isalpha(line[i]) || line[i] == ' ' || line[i] == '\n'){
          if (isalpha(line[i]) && k < COUNTY_CHAR_LIMIT + 1){
              park->counties[park->numCounties][k]=line[i];
              k++;
          }
          if ((line[i] == ' ' || line[i] == '\n') && isalpha(line[i + 1])){
              
              park->counties[park->numCounties][k ]='\0';
              park->numCounties++;
              k = 0;
          }
          i++;
       }
      if (park->numCounties > COUNTY_NUM_LIMIT - 1){
          fprintf(stderr, "Invalid park file: %s\n", filename);
          exit(1);
      }
      park->counties[park->numCounties][k] = '\0';
      park->numCounties++;
      
      free(line);
      line = readLine(fp);
      int a = 0;
      while (line[a] != '\0'){
          park->name[a] = line[a];
          a++;
          if (a > NAME_LIMIT){
              fprintf(stderr, "Invalid park file: %s\n", filename);
              exit(1);
          }
       
      }
      park->name[a] = '\0';
      catalog->list[catalog->count] = park;
      free(line);
          
      catalog->count++;
   }
   free(line);
   fclose(fp);
   for (int i = 0; i < catalog->count - 1; i++){
       for(int j = i + 1; j < catalog->count; j++){
          if (catalog->list[i]->id == catalog->list[j]->id){
             fprintf(stderr, "Invalid park file: %s\n", filename);
             exit(1);
          }
       }
   }
   
   
    
    
   
}
void sortParks( Catalog *catalog, int (* compare) (void const *va, void const *vb )){
    
   qsort(catalog->list, catalog->count, sizeof(catalog->list[0]), compare ); 
 
   
}


int compareParksId(void const *aptr, void const *bptr) {
   const Park *a = *(const Park **)aptr;
   const Park *b = *(const Park **)bptr;
   
   if (a->id < b->id) {
      return -1;
   } else if (a->id > b->id) {
      return 1;
   }
   return 0;

}



int compareParksName(void const *aptr, void const *bptr) {
   Park const *a =  *(const Park **)aptr;
   Park const *b =  *(const Park **)bptr;
   if (strcmp(a->name, b->name) < 0){

      return -1;
   } else if (strcmp(a->name, b->name) > 0){
      return 1;
   }
   return compareParksId(aptr, bptr);

}

void listParks( Catalog *catalog, bool (*test)( Park const *park, char const *str ), char const *str ){
   printf("%-3s %-40s %8s %8s Counties\n", "ID", "Name", "Lat", "Lon");
   for (int i = 0; i < catalog->count; i++){
      
       if (test(catalog->list[i], str)){
           printf("%-3d %-40s %8.3lf %8.3lf ", catalog->list[i]->id, catalog->list[i]->name, catalog->list[i]->latitude, catalog->list[i]->longitude);
           for (int j = 0; j < catalog->list[i]->numCounties; j++) {
              
              printf("%s", catalog->list[i]->counties[j]);
              if (j <  catalog->list[i]->numCounties - 1){
                 printf(",");
              
              }
            }
          
          printf("\n");
       
       }
       
   }
   printf("\n");
   


}

bool compareParksByCounty(Park const *park, char const *str) {
   for (int i = 0; i < park->numCounties; i++){
      if (strcmp(park->counties[i], str) == 0){
          return true;
      }
   
   }
   return false;
}
bool compareParksByNothing(Park const *park, char const *str) {
    return true;
}
