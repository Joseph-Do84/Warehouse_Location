/*********************************************
 * Author: dktoa
 * Creation Date: Jan 6, 2024 at 12:17:53 AM
 *********************************************/
 //parematers
 int n=...;//number of cities 
 int p =...; // number of warehouses
 int high_service_distance =...;
 range cities = 1..n;
 int d[cities][cities]=...; //distance matrix
 float demand[cities]=...;
 //decision variables
 dvar boolean x[cities][cities];//1 if city j is supplied by a warehouse  , 0 otherwise
 dvar boolean y[cities]; //1 if a warehouse is built in city i, 0 otherwise
 dvar boolean z[cities][cities]; //1 if distance to a warehouse smaller than 200
//objective
maximize sum(j,i in cities) z[i][j]*demand[j];
//constraint
subject to{
 forall(j in cities)
    sum(i in cities) x[i][j] == 1;
    
 sum(i in cities) y[i] == p;
  
 forall(i,j in cities)
           x[i][j] <= y[i];
 forall(i,j in cities)
   		   y[i]*d[i][j]*x[i][j] <=500;
 forall(i,j in cities)
   		   z[i][j] <= x[i][j] *y[i] * (d[i][j] <= high_service_distance);
}
