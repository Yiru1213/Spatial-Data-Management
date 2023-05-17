------Primary Keys------
alter table ucesxum.air_condition
add constraint air_condition_pk 
primary key(air_condition_id);

alter table ucesxum.rooms
add constraint rooms_pk 
primary key(room_id);

alter table ucesxum.construction_site_huts
add constraint construction_site_huts_pk 
primary key(construction_site_hut_id);

alter table ucesxum.parameters
add constraint parameter_pk
primary key(parameter_id);

alter table ucesxum.air_condition_health_indicator
add constraint air_condition_health_indicator_pk
primary key(air_condition_health_indicator_id);

------Foreign Keys------
alter table ucesxum.air_condition
add constraint air_condition_fk
foreign key(room_id)
references ucesxum.rooms(room_id);

alter table ucesxum.rooms
add constraint rooms_fk 
foreign key(construction_site_hut_id)
references ucesxum.construction_site_huts(construction_site_hut_id);

------Unique Constraints------
alter table ucesxum.air_condition
add constraint air_condition_unique
unique(location);

alter table ucesxum.rooms
add constraint rooms_unique
unique(location);

alter table ucesxum.construction_site_huts
add constraint construction_site_hut_unique
unique(location);

alter table ucesxum.air_condition_health_indicator
add constraint air_condition_health_indicator_unique
unique(air_condition_health_indicator_description);

alter table ucesxum.parameters
add constraint parameter_unique
unique(parameter_type, parameter_name, date_created);
