------Air Condition Health Indicator------
insert into ucesxum.air_condition_health_indicator(
air_condition_health_indicator_description)
values
('Brand new');

insert into ucesxum.air_condition_health_indicator(
air_condition_health_indicator_description)
values
('Regularly maintained and in good service');

insert into ucesxum.air_condition_health_indicator(
air_condition_health_indicator_description)
values
('Frequently maintained or broken down');


------Parameters------
insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','air_condition_installation_fee', 75, '£ per air condition', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','room_material_fee', 400, '£ per room', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','room_assembling_fee', 50, '£ per room', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_stairs_installation_fee', 200, '£ per hut', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_brackets_installation_fee', 200, '£ per hut', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_assembling_fee', 150, '£ per hut', '20220607');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('energy_emission','air_condition_energy_emission', 8, 'kwh per air condition per day', '20210701');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','air_condition_installation_fee', 60, '£ per air condition', '20210520');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','room_material_fee',300, '£ per room', '20210520');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','room_assembling_fee', 50, '£ per room', '20210417');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_stairs_installation_fee', 150, '£ per hut', '20210523');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_brackets_installation_fee', 150, '£ per hut', '20210707');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('cost','hut_assembling_fee', 100, '£ per hut', '20210520');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('energy_emission','air_condition_energy_emission', 4, 'kwh per air condition per day', '20200605');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('space','accommodation_space', 7, 'square meters per person', '20220403');

insert into ucesxum.parameters(
parameter_type, parameter_name, parameter_value, parameter_units, date_created)
values
('space','meeting_space', 3, 'square meters per person', '20220403');


------Construction Site Huts------
insert into ucesxum.construction_site_huts(location, project_name, building_time)
values
(st_extrude(st_geomfromtext('Polygon((530000 180000 0,530000 180010 0,530016 180010 0,530016 180000 0,530000 180000 0))',27700),0,0,5),
'A.1','20210412');

insert into ucesxum.construction_site_huts(location, project_name, building_time)
values
(st_extrude(st_geomfromtext('Polygon((530018 180000 0,530018 180010 0,530034 180010 0,530034 180000 0,530018 180000 0))',27700),0,0,5),
'A.1','20210412');


------Rooms------
------Hut_1--Floor_0----
insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530002 180002 0,530002 180005 0,530007 180005 0,530007 180002 0,530002 180002 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530002 180002 0,530002 180005 0,530007 180005 0,530007 180002 0,530002 180002 0))',27700)))),
0,'Accommodation','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530002 180005 0,530002 180008 0,530007 180008 0,530007 180005 0,530002 180005 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530002 180005 0,530002 180008 0,530007 180008 0,530007 180005 0,530002 180005 0))',27700)))),
0,'Accommodation','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530007 180002 0,530007 180005 0,530014 180005 0,530014 180002 0,530007 180002 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530007 180002 0,530007 180005 0,530014 180005 0,530014 180002 0,530007 180002 0))',27700)))),
0,'Canteen','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530007 180005 0,530007 180008 0,530014 180008 0,530014 180005 0,530007 180005 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530007 180005 0,530007 180008 0,530014 180008 0,530014 180005 0,530007 180005 0))',27700)))),
0,'Bathroom','20210320');

------Hut_1--Floor_1----
insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530002 180002 2.5,530002 180005 2.5,530007 180005 2.5,530007 180002 2.5,530002 180002 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530002 180002 2.5,530002 180005 2.5,530007 180005 2.5,530007 180002 2.5,530002 180002 2.5))',27700)))),
1,'Accommodation','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530002 180005 2.5,530002 180008 2.5,530007 180008 2.5,530007 180005 2.5,530002 180005 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530002 180005 2.5,530002 180008 2.5,530007 180008 2.5,530007 180005 2.5,530002 180005 2.5))',27700)))),
1,'Accommodation','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530007 180002 2.5,530007 180005 2.5,530014 180005 2.5,530014 180002 2.5,530007 180002 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530007 180002 2.5,530007 180005 2.5,530014 180005 2.5,530014 180002 2.5,530007 180002 2.5))',27700)))),
1,'Accommodation','20210320');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530007 180005 2.5,530007 180008 2.5,530014 180008 2.5,530014 180005 2.5,530007 180005 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
 st_3dintersects(b.location, (st_geomfromtext('Polygon((530007 180005 2.5,530007 180008 2.5,530014 180008 2.5,530014 180005 2.5,530007 180005 2.5))',27700)))),
1,'Bathroom','20210320');

------Hut_2--Floor_0----
insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530020 180002 0,530020 180005 0,530025 180005 0,530025 180002 0,530020 180002 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530020 180002 0,530020 180005 0,530025 180005 0,530025 180002 0,530020 180002 0))',27700)))),
0,'Accommodation','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530020 180005 0,530020 180008 0,530025 180008 0,530025 180005 0,530020 180005 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530020 180005 0,530020 180008 0,530025 180008 0,530025 180005 0,530020 180005 0))',27700)))),
0,'Accommodation','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530025 180002 0,530025 180005 0,530032 180005 0,530032 180002 0,530025 180002 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530025 180002 0,530025 180005 0,530032 180005 0,530032 180002 0,530025 180002 0))',27700)))),
0,'Canteen','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530025 180005 0,530025 180008 0,530032 180008 0,530032 180005 0,530025 180005 0))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530025 180005 0,530025 180008 0,530032 180008 0,530032 180005 0,530025 180005 0))',27700)))),
0,'Bathroom','20210328');

------Hut_2--Floor_1----
insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530020 180002 2.5,530020 180005 2.5,530025 180005 2.5,530025 180002 2.5,530020 180002 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530020 180002 2.5,530020 180005 2.5,530025 180005 2.5,530025 180002 2.5,530020 180002 2.5))',27700)))),
1,'Accommodation','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530020 180005 2.5,530020 180008 2.5,530025 180008 2.5,530025 180005 2.5,530020 180005 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530020 180005 2.5,530020 180008 2.5,530025 180008 2.5,530025 180005 2.5,530020 180005 2.5))',27700)))),
1,'Accommodation','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530025 180002 2.5,530025 180005 2.5,530032 180005 2.5,530032 180002 2.5,530025 180002 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530025 180002 2.5,530025 180005 2.5,530032 180005 2.5,530032 180002 2.5,530025 180002 2.5))',27700)))),
1,'Accommodation','20210328');

insert into ucesxum.rooms(location,construction_site_hut_id, room_floor,room_use, room_building_date)
values
(st_geomfromtext('Polygon((530025 180005 2.5,530025 180008 2.5,530032 180008 2.5,530032 180005 2.5,530025 180005 2.5))',27700), 
(select construction_site_hut_id from ucesxum.construction_site_huts b WHERE
st_3dintersects(b.location, (st_geomfromtext('Polygon((530025 180005 2.5,530025 180008 2.5,530032 180008 2.5,530032 180005 2.5,530025 180005 2.5))',27700)))),
1,'Bathroom','20210328');


----Air Condition------
------Hut_1--Floor_0------
insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530004 180003 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530004 180003 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530004 180003 0)',27700)))),
'Portable',3,'20150406');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530004 180006 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530004 180006 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530004 180006 0)',27700)))),
'Portable',3,'20160324');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530010 180003 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530010 180003 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530010 180003 0)',27700)))),
'Portable',1,'20210324');

------Hut_1--Floor_1------
insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530004 180003 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530004 180003 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530004 180003 2.5)',27700)))),
'Portable',2,'20150518');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530004 180006 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530004 180006 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530004 180006 2.5)',27700)))),
'Portable',1,'20190708');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530010 180003 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530010 180003 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530010 180003 2.5)',27700)))),
'Portable',1,'20200812');

------Hut_2--Floor_0------
insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530022 180003 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530022 180003 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530022 180003 0)',27700)))),
'Portable',2,'20170628');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530022 180006 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530022 180006 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530022 180006 0)',27700)))),
'Portable',3,'20150520');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530028 180003 0)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530028 180003 0)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530028 180003 0)',27700)))),
'Portable',1,'20210324');

------Hut_2--Floor_1------
insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530022 180003 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530022 180003 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530022 180003 2.5)',27700)))),
'Portable',3,'20140730');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530022 180006 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530022 180006 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530022 180006 2.5)',27700)))),
'Portable',1,'20190708');

insert into ucesxum.air_condition(location,room_id,construction_site_hut_id,air_condition_type,air_condition_health,purchase_date)
values
(st_geomfromtext('Point(530028 180003 2.5)',27700),
(select room_id from ucesxum.rooms c where 
st_3dintersects(c.location, (st_geomfromtext('Point(530028 180003 2.5)',27700)))),
(select construction_site_hut_id from ucesxum.construction_site_huts d WHERE
st_3dintersects(d.location,(st_geomfromtext('Point(530028 180003 2.5)',27700)))),
'Portable',1,'20210726');







