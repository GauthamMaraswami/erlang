-module(gauthamm3).
-export([for/4,indexInListbypredicate/3,forAll/2,thereExists/2,thereExists1/2,foldl/3,remdups/1,foldr/3,remdupsr/1]).

for(I,Pred,Update,Body)->
    case Pred(I) of
  true->
     Body(I),
	 J=Update(I),
	for(J,Pred,Update,Body);
	false -> ok end.
	
indexInListbypredicate([H|T],M,Pred)->  chep([H|T],M,Pred,0).
chep([],M,Pred,I)->not_found;
chep([H|T],M,Pred,I)->
   case Pred(M,H) of
   true->I;
   false->chep(T,M,Pred,I+1)
   end.
	   
forAll([H|T],Pred)->chep1([H|T],Pred,false).
chep1([],Pred,Bo)->Bo;
chep1([H|T],Pred,Bo)->
   case Pred(H) of
   true->chep1(T,Pred,true);
   false->false
   end.
thereExists([H|T],Pred)->chep2([H|T],Pred,false).
chep2([],Pred,Bo)->Bo;
chep2([H|T],Pred,Bo)->
   case Pred(H) of
   true->chep2(T,Pred,true);
   false->chep2(T,Pred,Bo)
   end.
thereExists1(List,Pred)->chep3(List,Pred,0).
chep3([],Pred,1)->true;
chep3([],Pred,_)->false;
chep3([H|T],Pred,N)->
   case Pred(H) of
   true->chep3(T,Pred,N+1);
   false->chep3(T,Pred,N)
   end.
   
 foldl(F,Acc,[])->Acc;
 foldl(F,Acc,[H|T])->foldl(F,F(H,Acc),T).
 
 foldr(F,Acc,[])->Acc;
 foldr(F,Acc,[H|T])->T1=lists:last([H|T]),L2=lists:droplast([H|T]),foldr(F,F(T1,Acc),L2).
 
 remdups([H|T])->  foldlr(fun(X,Y)->X=:=Y end,H,[H|T],[H]).
 
 foldlr(F,Ch,[],L)->L;
 foldlr(F,Ch,[H|T],L)->
    case F(H,Ch) of
	true->foldlr(F,Ch,T,L);
	false->C=H,L1=L++[H],foldlr(F,C,T,L1)
	end.
	
  remdupsr([H|T])->Ch=lists:last([H|T]),foldrr(fun(X,Y)->X=:=Y end,Ch,[H|T],[Ch]).
  foldrr(F,Ch,[],L)->L;
  foldrr(F,Ch,[H|T],L)->
    C1=lists:last([H|T]),
    case F(C1,Ch) of
	true->T1=lists:droplast([H|T]),foldrr(F,Ch,T1,L);
	false->C=lists:last([H|T]),L1=L++[C],T1=lists:droplast([H|T]),foldrr(F,C,T1,L1) end.