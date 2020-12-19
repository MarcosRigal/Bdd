alter table votantes add constraint chec_correo check(instr(email,'@')>1 and
(instr(email,'.', instr(email,'@')) - instr(email,'@')) > 1 and
instr(email,'.', instr(email,'@')) < length(email));