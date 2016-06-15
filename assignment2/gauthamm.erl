-module(gauthamm).
-export([is_prime/1,is_prime/2,prime_factors/1,decomp/1,decomp1/3,my_nonDuplicate_list1/1,is_square_multiple/1,check1/2,gbr/5,g11/4,checkcond/3,find_square_multiples/2]).
is_prime(N)->is_prime(N,2).
is_prime(N,I) when I*I>=N,N rem I=/=0->true;
is_prime(N,I) when N rem I=/=0->is_prime(N,I+1);
is_prime(N,I) when N rem I=:=0 ->false.

prime_factors(N)->decomp(N).

decomp(N) when is_integer(N), (N > 0) -> 
    lists:reverse(decomp1(N,[],2)).

decomp1(N,R,I) when I*I > N -> [N|R];
decomp1(N,R,I) when (N rem I) =:= 0 -> decomp1(N div I,[I|R],I);
decomp1(N,R,2) -> decomp1(N,R,3);
decomp1(N,R,I) -> decomp1(N,R,I+2).

my_nonDuplicate_list1(List) ->
    Set = sets:from_list(List),
    sets:to_list(Set).

is_square_multiple(N)->
  L1=decomp(N),
  L2=my_nonDuplicate_list1(L1),
 check1(length(L1),length(L2)).
 
 check1(I,J) when I=:=J->false;
 check1(I,J)->true.
 
 
 find_square_multiples(Count, MaxN)->L211=my_nonDuplicate_list1(g11(Count,1,3,[])),Len1=length(L211),Ch1=lists:member(true,L211),Bo=checkcond(L211,Len1,Ch1) ,gbr(Count,MaxN,1,[],Bo).
 gbr(Ct,Maxn,Cas,L21,Bo) when Cas=<Maxn,Bo=:=true->L211=my_nonDuplicate_list1(g11(Ct,1,Cas,[])),Len1=length(L211),Ch1=lists:member(true,L211),TBo=checkcond(L211,Len1,Ch1),Cas-1;
 gbr(Ct,Maxn,Cas,L21,Bo) when Cas=<Maxn,Bo=:=false->L211=my_nonDuplicate_list1(g11(Ct,1,Cas,[])),Len1=length(L211),Ch1=lists:member(true,L211),TBo=checkcond(L211,Len1,Ch1),gbr(Ct,Maxn,Cas+1,L21,TBo);
 gbr(Ct,Maxn,Cas,L21,Bo) when Bo=:= true->Cas-1;
 gbr(Ct,Maxn,Cas,L21,Bo) when Bo=:= false->"fail".
 
 g11(Ct,I,Cas,List) when I=<Ct->Li=List++[is_square_multiple(Cas)],g11(Ct,I+1,Cas+1,Li);
 g11(Ct,I,Cas,List)->Li=List++[is_square_multiple(Cas)],List.
 
 
 checkcond(L2,Len2,Ch1) when Len2=:=1,Ch1=:=true->true;
 checkcond(L2,Len2,Ch1)->false.