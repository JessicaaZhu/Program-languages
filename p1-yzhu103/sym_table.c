#include "sym_table.h"
#include <string.h>
#include <stdlib.h>

#define MAX_SIZE_VAR 50
#define MAX_LENGTH_VAR 20

static Var val_array[MAX_SIZE_VAR];
static int var_num = 0;

Var create_var(char *name,float value,int level)
{
	//printf("create new var-------\n");
	Var newvar = val_array[var_num];
	//printf("111111111-------\n");
	char *newname = malloc(MAX_LENGTH_VAR*sizeof(char));
	//printf("2222222--------\n");
	strcpy(newname,name);
	//printf("33333333-------\n");
	newvar.name = newname;
	newvar.value = value;
	newvar.level = level;
	//printf("44444444-------\n");
	val_array[var_num] = newvar;
	//printf("55555555--------\n");
	var_num++;
	return newvar; 
}

Var modify_var(char *name,float value)
{
	//printf("modify a var-----\n");
	Var oldvar;
	//printf("1111111-----\n");
    int i;
	for(i=var_num-1;i>=0;i--)
	{
		Var temp = val_array[i];
		if(strcmp(temp.name,name) == 0)
		{
			temp.value = value;
			val_array[i] = temp;
			oldvar = temp;
			break;
		}
	}
	return oldvar;
}

float get_var(char *name)
{
	//printf("get the var------\n");
    int i;
	for(i=var_num-1;i>=0;i--)
	{
		//printf("11111111\n");
		Var temp = val_array[i];
		//printf("22222222\n");
		if(strcmp(temp.name,name) == 0)
		{
			//printf("33333333\n");
			return temp.value;
		}
		//printf("44444444\n");
	}
	//printf("55555555\n");
	return 0.0;
}

void pop_var(int level_num)
{
	//printf("delete the var-----\n");
	//printf("print the array------\n");
	//print();
    int i;
	for(i=var_num-1;i>=0;i--)
	{
		if(val_array[i].level == level_num+1)
			var_num--;
		else
			break;
	}
}

/*
void print()
{
	for(int i=var_num-1;i>=0;i--)
	{
		printf("name: %s value: %f level: %d\n",val_array[i].name, val_array[i].value,val_array[i].level );
	}
}*/
