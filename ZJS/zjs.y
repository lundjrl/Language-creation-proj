%{
    #include "lang.tab.h"
    #include <stdio.h>
%}

%%

ZERO      return 0;
[0-9]+    return INT;
X         return X;
Y         return Y;
Z         return Z;
G         return G;
END       return END;
;         return EOL;
[ |\t|\n] ;
.         printf("ERROR");

%%
