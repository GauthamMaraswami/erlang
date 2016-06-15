-module(erlang_module2).
-export([is_cool_temp/1,to_farenheit/1]).
is_cool_temp({X,Y}) when Y>=25,Y=<35->{X,true};
is_cool_temp({X,Y})->{X,false}.
to_farenheit(Z)->
   ((9/5)*Z)+32.
 



