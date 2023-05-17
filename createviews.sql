```sql
------Latest_Parameters------
create view ucesxum.latest_parameters as 
(select distinct on(parameter_name)parameter_name, parameter_value, parameter_units, date_created
from ucesxum.parameters order by parameter_name, date_created desc);

------A view for the decision corresponding to the bottom level------
------Air Condition Installation Fee-------
create view ucesxum.total_air_condition_installation_fee as
with 
air_condition_number as 
(select count(*)from ucesxum.air_condition),
installation_fee as
(select parameter_value from ucesxum.latest_parameters where parameter_name = 'air_condition_installation_fee')
select ((select * from air_condition_number)*(select * from installation_fee)) 
as total_air_condition_installation_fee;

------Views for the decision corresponding to the middle level------
------Rooms Fee------
create view ucesxum.total_rooms_material_fee as 
with 
rooms_number as 
(select count(*) from ucesxum.rooms),
one_room_material_fee as
(select parameter_value from ucesxum.latest_parameters
where parameter_name = 'room_material_fee')
select ((select * from rooms_number)*(select * from one_room_material_fee)) 
as total_rooms_material_fee;

create view ucesxum.total_rooms_assembing_fee as
with 
rooms_number as 
(select count(*) from ucesxum.rooms),
one_room_assembling_fee as
(select parameter_value from ucesxum.latest_parameters
where parameter_name = 'room_assembling_fee')
select ((select * from rooms_number)*(select * from one_room_assembling_fee)) 
as total_rooms_assembling_fee;

------The view that includes data from the bottom level------
create view ucesxum.total_rooms_fee as 
select 
((select * from ucesxum.total_air_condition_installation_fee)+
 (select * from ucesxum.total_rooms_material_fee)+
 (select * from ucesxum.total_rooms_assembing_fee)) as total_rooms_fee;


------Views for the decision corresponding to the top level------
------Huts Building Fee------
create view ucesxum.total_huts_brackets_fee as 
with 
huts_number as 
(select count(*) from ucesxum.construction_site_huts),
one_hut_brackets_fee as
(select parameter_value from ucesxum.latest_parameters
where parameter_name = 'hut_brackets_installation_fee')
select ((select * from huts_number)*(select * from one_hut_brackets_fee)) 
as total_huts_brackets_fee;

create view ucesxum.total_huts_stairs_fee as
with 
huts_number as 
(select count(*) from ucesxum.construction_site_huts),
one_hut_stairs_fee as
(select parameter_value from ucesxum.latest_parameters
where parameter_name = 'hut_stairs_installation_fee')
select ((select * from huts_number)*(select * from one_hut_stairs_fee)) 
as total_huts_stairs_fee;

create view ucesxum.total_huts_assembling_fee as
with 
huts_number as 
(select count(*) from ucesxum.construction_site_huts),
one_hut_assembling_fee as
(select parameter_value from ucesxum.latest_parameters
where parameter_name = 'hut_assembling_fee')
select ((select * from huts_number)*(select * from one_hut_assembling_fee)) 
as total_huts_assembling_fee;

------The view that includes data from the middle level------
create view ucesxum.total_huts_fee as 
select 
((select * from ucesxum.total_rooms_fee)+
 (select * from ucesxum.total_huts_assembling_fee)+
 (select * from ucesxum.total_huts_brackets_fee)+
 (select * from ucesxum.total_huts_stairs_fee)) as total_huts_fee;
