#include <stdio.h>

typedef struct Var{
	char *name;
	float value;
	int level;
}Var;

Var create_var(char *name,float value,int level);

Var modify_var(char *name,float value);

float get_var(char *name);

void pop_var(int level_num);

//void print();
