use sprint2;

create user 'Desenvolvedor'@'localhost'
identified by 'sptech';
-- Dando permissões para o usuario Desenvolvedor
grant select, insert, update, delete, create, drop
on sprint2.*
to 'Desenvolvedor'@'localhost';


-- Removendo permissões para o usuario Desenvolvedor
revoke select, insert, update, delete, create, drop
on sprint2.*
from 'Desenvolvedor'@'localhost';

-- Removendo usuario 
drop user 'Desenvolvedor'@'localhost';
