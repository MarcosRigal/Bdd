alter table eventos add constraint check_tipo check(substr(tipo,-1,1)='s' and substr(tipo,1,1)=Upper(substr(tipo,1,1)));
