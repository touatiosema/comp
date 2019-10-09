#include "Attribute.h"

#include <stdlib.h>

attribute new_attribute () {
  attribute r;
  r  = malloc (sizeof (struct ATTRIBUTE));
  return r;
};


attribute plus_attribute(attribute x, attribute y) {
  attribute r = new_attribute();
  /* unconditionally adding integer values */
  r -> type_val = FLOAT;
  if (x->type_val == FLOAT) {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> float_val + y -> float_val;
    else
      r -> float_val = x -> float_val + y -> int_val;
  }
  else {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> int_val + y -> float_val;
    else {
      r -> type_val = INT;
      r -> int_val = x -> int_val + y -> int_val;
    }
  }

  return r;
};

attribute mult_attribute(attribute x, attribute y){
  attribute r = new_attribute();
  r -> type_val = FLOAT;
  if (x->type_val == FLOAT) {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> float_val * y -> float_val;
    else
      r -> float_val = x -> float_val * y -> int_val;
  }
  else {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> int_val * y -> float_val;
    else {
      r -> type_val = INT;
      r -> int_val = x -> int_val * y -> int_val;
    }
  }

  return r;
};

attribute minus_attribute(attribute x, attribute y){
  attribute r = new_attribute();
  r -> type_val = FLOAT;

if (x->type_val == FLOAT) {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> float_val - y -> float_val;
    else
      r -> float_val = x -> float_val - (float) y -> int_val;
  }
  else {
    if (y->type_val == FLOAT) 
      r -> float_val = (float) x -> int_val - y -> float_val;
    else {
      r -> type_val = INT;
      r -> int_val = x -> int_val - y -> int_val;
    }
  }

  return r;
  /* unconditionally adding integer values */
};

attribute div_attribute(attribute x, attribute y){
  attribute r = new_attribute();
  r -> type_val = FLOAT;
  
  if (x->type_val == FLOAT) {
    if (y->type_val == FLOAT) 
      r -> float_val = x -> float_val / y -> float_val;
    else
      r -> float_val = x -> float_val / (float) y -> int_val;
  }
  else {
    if (y->type_val == FLOAT) 
      r -> float_val = (float) x -> int_val / y -> float_val;
    else {
      r -> type_val = INT;
      r -> int_val = x -> int_val / y -> int_val;
    }
  }
  return r;
};

attribute neg_attribute(attribute x){
  attribute r = new_attribute();
  /* unconditionally adding integer values */
  r -> int_val = -(x -> int_val);
  return r;
};

