--show container name
show con_name


--v$pdbs is a dictionary view ie this object belongs to oracle and you dnt have permission to edit it. Stores the names of tables and other objects created by the user
select name, con_id
from v$pdbs;

--Change session from container database to pluggable database
Alter session set container = orclpdb;

--show container name
show con_name


select name, open_mode 
from v$pdbs;

--when database is closed ; run:
--alter PLUGGABLE DATABASE open
select * from all_users;

--Sys user will unloak the hr account..the password is set to hr
ALTER USER hr identified by hr account unlock;