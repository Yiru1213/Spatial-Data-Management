```sql
drop schema if exists ucesxum cascade;
create schema ucesxum;

drop table if exists ucesxum.air_condition;
create table ucesxum.air_condition(
air_condition_id serial not null,
room_id int not null,
construction_site_hut_id int not null,
air_condition_type character varying(100) not null,
air_condition_health int not null,
purchase_date date not null  
);
select AddGeometryColumn
('ucesxum','air_condition','location',27700,'geometry',3);

drop table if exists ucesxum.rooms;
create table ucesxum.rooms(
room_id serial not null,
construction_site_hut_id int not null,
room_floor int not null,
room_use character varying(100) not null,
room_building_date date not null
);
select AddGeometryColumn
('ucesxum','rooms','location',27700,'geometry',3);



drop table if exists ucesxum.construction_site_huts;
create table ucesxum.construction_site_huts(
construction_site_hut_id serial not null,
project_name character varying(100) not null,
building_time date not null
);
select AddGeometryColumn
('ucesxum','construction_site_huts','location',27700,'geometry',3);


drop table if exists ucesxum.parameters;
create table ucesxum.parameters(
parameter_id serial not null,
parameter_type character varying(100) not null,
parameter_name character varying(200) not null,
parameter_value double precision not null,
parameter_units character varying(100) not null,
date_created date not null
);

drop table if exists ucesxum.air_condition_health_indicator;
create table ucesxum.air_condition_health_indicator(
air_condition_health_indicator_id serial not null,
air_condition_health_indicator_description character varying(100) not null
);

