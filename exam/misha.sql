--////////////////////////////////////////////////////////////////////////////////////
--/// TYPES
--////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE db_types (id_type NUMBER(7), name_type VARCHAR2(80))
DESCRIBE db_types;

CREATE SEQUENCE db_types_id_seq
INCREMENT BY 10
start with 10

CREATE SYNONYM d_types
FOR db_types;

INSERT INTO db_types(id_type, name_type) VALUES( db_types_id_seq.nextval, 'Apple tree');
INSERT INTO db_types(id_type, name_type) VALUES( db_types_id_seq.nextval, 'Cherry tree');
INSERT INTO db_types(id_type, name_type) VALUES( db_types_id_seq.nextval, 'Pear tree');
INSERT INTO db_types(id_type, name_type) VALUES( db_types_id_seq.nextval, 'Briar tree');
INSERT INTO db_types(id_type, name_type) VALUES( db_types_id_seq.nextval, 'Gooseberry tree');

SELECT *
FROM db_types;


--////////////////////////////////////////////////////////////////////////////////////
--/// SORT
--////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE db_sort (id_sort NUMBER(7), id_type NUMBER(7), name_sort VARCHAR2(80))
DESCRIBE db_sort;

CREATE SEQUENCE db_sort_id_seq
INCREMENT BY 10
start with 10

CREATE SYNONYM d_sort
FOR db_sort;

INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'White filling');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Melba');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Mantet');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Grushovka Moscow');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Candy');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Mac');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Shtreyfling');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Glory to the winners');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 10, 'Cinnamon striped');

INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Sakura');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Alyaevskaya');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Lada');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Lebedyanskaya');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Livenskaya');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Leadsman');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 20, 'Lyubimitsa');

INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 30, 'Bere Bosc');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 30, 'Pear memory Yakovleva');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 40, 'Besshipny');
INSERT INTO db_sort(id_sort, id_type, name_sort) VALUES( db_sort_id_seq.nextval, 50, 'Gingerbread Man');




SELECT *
FROM db_sort;




--////////////////////////////////////////////////////////////////////////////////////
--/// TRADE
--////////////////////////////////////////////////////////////////////////////////////


CREATE TABLE db_trade (id_operation NUMBER(7), data_trade DATE, trade_count NUMBER(7), id_sort NUMBER(7), id_organisation NUMBER(7))
DESCRIBE db_trade;

CREATE INDEX db_trade_sort_idx
ON db_trade(id_sort);


CREATE SEQUENCE db_trade_id_seq
INCREMENT BY 10
start with 10

CREATE SYNONYM d_trade
FOR db_trade;


INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2004.03.14 14:40:00', 3, 10, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2001.09.11 14:08:01', 2, 100, 20);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2016.03.31 13:33:37', 31, 100, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2013.01.5 14:00:00', 1, 50, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2007.01.12 12:03:21', 4, 40, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2010.01.12 12:03:21', 6, 20, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2009.06.21 17:42:33', 1, 60, 20);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2003.02.11 11:54:20', 1, 30, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2015.02.11 11:54:20', 6, 110, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2013.04.21 10:34:31', 6, 110, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2008.06.13 13:24:13', 18, 150, 30);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2005.01.23 23:00:00', 11, 200, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2004.01.23 13:03:01', 12, 180, 20);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2000.01.23 13:03:01', 2, 160, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '2009.09.16 16:02:11', 2, 160, 10);
INSERT INTO db_trade(id_operation, data_trade, trade_count, id_sort, id_organisation) VALUES( db_trade_id_seq.nextval, '1997.03.31 13:33:37', 31, 100, 30);

delete db_trade
where data_trade = '1997.03.31 13:33:37';

SELECT *
FROM db_trade;



--////////////////////////////////////////////////////////////////////////////////////
--/// ORGANISATION
--////////////////////////////////////////////////////////////////////////////////////


CREATE TABLE db_organisation (id_organisation NUMBER(7), addres VARCHAR2(100), contact_face VARCHAR2(100))
DESCRIBE db_organisation;

CREATE SEQUENCE db_organisation_id_seq
INCREMENT BY 10
start with 10

CREATE SYNONYM d_organisation
FOR db_organisation;

INSERT INTO db_organisation(id_organisation, addres, contact_face) VALUES( db_organisation_id_seq.nextval, 'Moscow, Avtosavodskaya d3', 'Ivan Petrovich');
INSERT INTO db_organisation(id_organisation, addres, contact_face) VALUES( db_organisation_id_seq.nextval, 'Moscow, Lenina d14', 'Vitali Valerievich');
INSERT INTO db_organisation(id_organisation, addres, contact_face) VALUES( db_organisation_id_seq.nextval, 'Moscow, Baumanskaya d5', 'Mihail Medvedev');


SELECT *
FROM db_organisation;

--////////////////////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 1
--////////////////////////////////////////////////////////////////////////////////////

CREATE VIEW Request1
AS SELECT data_trade
FROM db_trade;

CREATE OR REPLACE VIEW Request1 (data_trade)
AS SELECT data_trade
FROM db_trade
WHERE trade_count > 10
ORDER BY data_trade DESC

SELECT *
FROM Request1;

--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 2
--////////////////////////////////////////////////////////////////////////////////////

--SELECT id_operation, TO_CHAR(data_trade, 'DD MONTH YYYY'), trade_count, id_sort, id_organisation
--FROM db_trade;

CREATE VIEW Request2
AS SELECT id_operation, data_trade, trade_count, id_sort, id_organisation
FROM db_trade;

CREATE OR REPLACE VIEW Request2 (id_operation, data_trade, trade_count, id_sort, id_organisation)
AS SELECT id_operation, TO_CHAR(data_trade, 'DD MONTH YYYY'), trade_count, id_sort, id_organisation
FROM db_trade;

SELECT *
FROM Request2;



--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 3
--////////////////////////////////////////////////////////////////////////////////////

--SELECT data_trade, SUM(trade_count)
--FROM db_trade
--GROUP BY data_trade;

CREATE VIEW Request3
AS SELECT data_trade, trade_count
FROM db_trade;

CREATE OR REPLACE VIEW Request3 (data_trade, trade_count)
AS SELECT data_trade, SUM(trade_count)
FROM db_trade
GROUP BY data_trade;

SELECT*
FROM Request3;

--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 4
--/// название организации отсутствует по условию, вывел дрес и контактное лицо.
--////////////////////////////////////////////////////////////////////////////////////

--SELECT do.addres, do.contact_face, dt.id_sort
--FROM db_trade dt JOIN db_organisation do ON dt.id_organisation = do.id_organisation;

CREATE VIEW Request4
AS SELECT do.addres, do.contact_face, dt.id_sort
FROM db_trade dt JOIN db_organisation do ON dt.id_organisation = do.id_organisation;

SELECT*
FROM Request4;

--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 5
--/// название организации отсутствует по условию, вывел дрес и контактное лицо.
--////////////////////////////////////////////////////////////////////////////////////

--SELECT dtype.name_type, dsort.name_sort, dtrade.data_trade, dorg.addres, dorg.contact_face
--FROM db_types dtype JOIN db_sort dsort ON (dtype.id_type = dsort.id_type)
--JOIN db_trade dtrade ON (dtrade.id_sort = dsort.id_sort)
--JOIN db_organisation dorg ON (dorg.id_organisation = dtrade.id_organisation);
CREATE VIEW Request5
AS SELECT dtype.name_type, dsort.name_sort, dtrade.data_trade, dorg.addres, dorg.contact_face
FROM db_types dtype JOIN db_sort dsort ON (dtype.id_type = dsort.id_type)
JOIN db_trade dtrade ON (dtrade.id_sort = dsort.id_sort)
JOIN db_organisation dorg ON (dorg.id_organisation = dtrade.id_organisation);

SELECT*
FROM Request5;

--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 6
--////////////////////////////////////////////////////////////////////////////////////



--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 7
--////////////////////////////////////////////////////////////////////////////////////
CREATE VIEW Request7
AS SELECT name_sort
FROM db_sort
MINUS
SELECT dsort.name_sort
FROM db_sort dsort
JOIN db_trade dtrade ON(dsort.id_sort = dtrade.id_sort)
JOIN db_organisation dorg ON(dtrade.id_organisation = dorg.id_organisation);

SELECT *
FROM Request7;

--////////////////////////////////////////////////////////////////////////////////////
--/// ЗАПРОС 8
--////////////////////////////////////////////////////////////////////////////////////