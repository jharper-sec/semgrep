val subexprs_of_expr : AST_generic.expr -> AST_generic.expr list

val flatten_substmts_of_stmts :
  AST_generic.stmt list -> (AST_generic.stmt list * AST_generic.stmt) option
