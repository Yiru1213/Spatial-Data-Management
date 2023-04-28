--Decision 1
--Information: air conditions that are frequently maintained or broken down
--Information: details of air conditions and rooms and hut that those air conditions are located in
--Decision: which rooms in which huts need to install new air conditions 
with 
air_condition_for_replacement as
(select * from ucesxum.air_condition where air_condition_health = 3)
select a.air_condition_id, a.air_condition_type, a.purchase_date, 
b.room_id, b.room_floor, b.room_use, b.room_building_date, 
c.construction_site_hut_id, c.project_name, c.building_time from air_condition_for_replacement a 
inner join ucesxum.rooms b on a.room_id = b.room_id 
inner join ucesxum.construction_site_huts c on b.construction_site_hut_id = c.construction_site_hut_id;



--Decision 2(Using view)
--Information: the cost of installing air conditions with the latest installation fee
--Usage: compare to the cost of last project
--Decision: whether the constructor should find another air condition installer with lower charging fee to control the cost for the new project 
select * from ucesxum.total_air_condition_installation_fee;



--Decision 3
--Information: the total energy emission of air conditions
--Usage: compare it to the energy emission cap and check if that project had over-emitted carbon
--Decision: whether offset should be paid for the extra emission and how much we should pay
with
air_condition_number as 
(select count(*) from ucesxum.air_condition),
air_condition_energy_emission as
(select parameter_value from ucesxum.latest_parameters where parameter_name like '%energy_emission%')
select ((select * from air_condition_number)*(select * from air_condition_energy_emission)) 
as ac_total_emergy_emission;



--Decision 4
--Information: full capacity of all of the accommodation rooms 
--Usage: compare to the number of workers of a new project
--Decision: whether we can directly reuse these huts or we need to build a new hut
with 
accommodation_rooms_area as 
(select sum(st_3darea(location)) as room_area from ucesxum.rooms where room_use='Accommodation'),
accommodation_space_per_person as 
(select parameter_value from ucesxum.parameters where parameter_name='accommodation_space')
select ((select * from accommodation_rooms_area)/(select * from accommodation_space_per_person ))
as full_accommodation_capacity;



--Decision 5(Using view and is build on information provided by a lower level query(Decision2))
--Information: the cost of building the rooms
--Usage: compare to the cost of last project
--Decision: whether the constructor should contact another material supplier with lower material fee or change the material to control the cost for the new project
select * from ucesxum.total_rooms_fee;



--Decision 6
--Information: datails of the largest room(s)
--Usage: check out its eligibility for a conference 
--Decision: which room can be used or whether it is necessary to build and furbish a new small hut for this conference
select * from ucesxum.rooms where 
st_3darea(location)= (select max(st_3darea(location)) as largest_room_area from ucesxum.rooms);



--Decision 7(Using view and is build on information provided by a middle level query(Decision5))
--Information: the total cost of building the huts
--Usage: compare it to the original budget 
--Decision: whether the manager should apply for more budget to build huts for a new project
select * from ucesxum.total_huts_fee;