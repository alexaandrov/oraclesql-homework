-- Создание таблицы "Автобусы"

create table buses
    (id  number(6),
    name varchar2(25),
    capacity number(6) not null,
    constraint bus_id_pk primary key(id));

-- Создание таблицы "Города"

create table towns
    (id number(6) not null,
    name varchar2(25),
    constraint tws_id_pk primary key(id),
    constraint tws_nam_uk unique(name));

-- Создание таблицы "Туры"

create table tours
    (id number(6),
    name varchar2(25),
    bus_id number(6) not null,
    start_date date,
    end_date date,
    description varchar2(50),
    constraint tou_id_pk primary key(id),
    constraint tou_bus_id_fk foreign key(bus_id)
    references buses(id));

-- Создание таблицы "Routes"

create table routes
    (id number(6),
    town_id number(6) not null,
    tour_id number(6) not null,
    arrival_date date,
    departure_date date,
    constraint rou_id_pk primary key(id),
    constraint rou_tow_id_fk foreign key(town_id)
        references towns(id),
    constraint rou_tou_id_fk foreign key(tour_id)
        references tours(id));

-- Создание индесов для дат начала и окончания тура

create index tou_start_date_idx
on tours(start_date, end_date);

-- Создание последовательности для "Города"

create sequence tws_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 9999
    nocache
    nocycle;

-- Создание последовательности для "Автобусы"

create sequence bus_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 9999
    nocache
    nocycle;

-- Создание последовательности для "Туры"

create sequence tou_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 9999
    nocache
    nocycle;

-- Создание последовательности для "Маршруты"

create sequence rou_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 9999
    nocache
    nocycle;

-- Создание синонима для "Города"

create synonym user_towns
for towns;

-- Создание синонима для "Автобусы"

create synonym user_buses
for buses;

-- Создание синонима для "Туры"

create synonym user_tours
for tours;

-- Создание синонима для "Маршруты"

create synonym user_routes
for routes;

-- Добавление записей в таблицу "Города"

insert into towns
values(tws_seq.nextval, :new_name);

-- Добавление записей в таблицу "Автобусы"

insert into buses
values(bus_seq.nextval, :new_name, :capacity);

-- Добавление записей в таблицу "Туры"

insert into tours
values(tou_seq.nextval,
    :new_name,
    :new_bus_id,
    to_date(:new_start_date),
    to_date(:new_end_date),
    :new_description);

-- Добавление записей в таблицу "Маршруты"

insert into routes
values(rou_seq.nextval,
    :new_town_id,
    :new_tour_id,
    to_date(:new_ariv_date),
    to_date(:new_depar_date));

-- Задание номер 1

create view exc_1
as select *
from buses
where capacity > 10;

-- Задание номер 2

create view exc_2
as select name || ' Начало : ' || to_char(start_date, 'dd month yyyy') ||
    ', окончание : ' || to_char(start_date, 'dd month yyyy') as tour
from tours;

-- Задание номер 3

select bus_id, count(id)
from tours;
group by bus_id
order by count(bus_id);

-- Задание номер 4

create view exc_4
as select t.name, t.start_date, t.end_date, b.capacity
from tours t join buses b on (t.bus_id = b.id);

--Задание номер 5

select t.id, t.name, tr.name, tr.start_date, tr.end_date
from towns t full outer join routes r
    on(t.id = r.town_id) join tours tr
    on(r.tour_id = tr.id)
union
select id, name, null, null, null
from towns
where id not in (
    select distinct town_id
    from routes);

-- Задание номер 7

create view exc_7
as select *
from towns
where id not in(
    select distinct town_id
    from routes);