-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2020-10-14 22:39:58 AEDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

--Student Name: Jason Setiawan
--Student ID: 28083148
set echo on
SPOOL fdas_schema_output.txt

DROP TABLE assessor CASCADE CONSTRAINTS;

DROP TABLE building CASCADE CONSTRAINTS;

DROP TABLE building_damage CASCADE CONSTRAINTS;

DROP TABLE building_history CASCADE CONSTRAINTS;

DROP TABLE fire_caused CASCADE CONSTRAINTS;

DROP TABLE fire_event CASCADE CONSTRAINTS;

DROP TABLE insurance CASCADE CONSTRAINTS;

DROP TABLE lga CASCADE CONSTRAINTS;

DROP TABLE owner CASCADE CONSTRAINTS;

DROP TABLE property CASCADE CONSTRAINTS;

DROP TABLE property_type CASCADE CONSTRAINTS;

DROP TABLE visit_date CASCADE CONSTRAINTS;

DROP TABLE work_history CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE assessor (
    assessor_id     NUMBER(7) NOT NULL,
    assessor_phone  CHAR(10),
    assessor_fname  VARCHAR2(50) NOT NULL,
    assessor_lname  VARCHAR2(50),
    insurance_code  NUMBER(7) NOT NULL
);

COMMENT ON COLUMN assessor.assessor_id IS
    'id number for assessor';

COMMENT ON COLUMN assessor.assessor_phone IS
    'phone number for the assessor';

COMMENT ON COLUMN assessor.assessor_fname IS
    'first name of the assessor';

COMMENT ON COLUMN assessor.assessor_lname IS
    'last name of the assessor';

COMMENT ON COLUMN assessor.insurance_code IS
    'id for insurance company';

ALTER TABLE assessor ADD CONSTRAINT assessor_pk PRIMARY KEY ( assessor_id );

CREATE TABLE building (
    building_no      NUMBER(7) NOT NULL,
    building_size    VARCHAR2(50) NOT NULL,
    building_permit  VARCHAR2(50),
    property_id      NUMBER(7) NOT NULL,
    building_status  CHAR(1)
);

ALTER TABLE building
    ADD CONSTRAINT chk_buildingstatus CHECK ( building_status IN ( 'D',
                                                                   'O',
                                                                   'R' ) );

COMMENT ON COLUMN building.building_no IS
    'id for building';

COMMENT ON COLUMN building.building_size IS
    'size of a building';

COMMENT ON COLUMN building.building_permit IS
    'class of a building (type)';

COMMENT ON COLUMN building.property_id IS
    'id for property';

COMMENT ON COLUMN building.building_status IS
    'whether the building is destroyed , repaired, or original.';

ALTER TABLE building ADD CONSTRAINT building_pk PRIMARY KEY ( building_no,
                                                              property_id );

CREATE TABLE building_damage (
    damage_cost         VARCHAR2(50) DEFAULT '0' NOT NULL,
    totally_destroyed   CHAR(1) DEFAULT 'N' NOT NULL,
    insurance_coverage  CHAR(1) NOT NULL,
    building_no         NUMBER(7) NOT NULL,
    property_id         NUMBER(7) NOT NULL,
    fevent_id           NUMBER(7) NOT NULL,
    lga_building_value  VARCHAR2(50) NOT NULL,
    lga_code            NUMBER(7) NOT NULL
);

ALTER TABLE building_damage
    ADD CONSTRAINT chk_tdestroyed CHECK ( totally_destroyed IN ( 'N',
                                                                 'Y' ) );

ALTER TABLE building_damage
    ADD CONSTRAINT chk_insurancecov CHECK ( insurance_coverage IN ( 'N',
                                                                    'Y' ) );

COMMENT ON COLUMN building_damage.damage_cost IS
    'damage cost to the building caused by fire event';

COMMENT ON COLUMN building_damage.totally_destroyed IS
    'is the building totally destroyed (Y/N)';

COMMENT ON COLUMN building_damage.insurance_coverage IS
    'is the building insured (Y/N)';

COMMENT ON COLUMN building_damage.building_no IS
    'id for building';

COMMENT ON COLUMN building_damage.property_id IS
    'id for property';

COMMENT ON COLUMN building_damage.fevent_id IS
    'id for the fire event';

COMMENT ON COLUMN building_damage.lga_building_value IS
    'building value according to lga';

COMMENT ON COLUMN building_damage.lga_code IS
    'ID for lga';

ALTER TABLE building_damage
    ADD CONSTRAINT building_damage_pk PRIMARY KEY ( building_no,
                                                    property_id,
                                                    fevent_id );

CREATE TABLE building_history (
    oldbuilding_no  NUMBER(7) NOT NULL,
    building_no     NUMBER(7) NOT NULL,
    property_id     NUMBER(7) NOT NULL
);

COMMENT ON COLUMN building_history.oldbuilding_no IS
    'previoud building number before rebuild';

COMMENT ON COLUMN building_history.building_no IS
    'id for building';

COMMENT ON COLUMN building_history.property_id IS
    'id for property';

ALTER TABLE building_history ADD CONSTRAINT building_history_pk PRIMARY KEY ( building_no,
                                                                              property_id );

CREATE TABLE fire_caused (
    event_caused  VARCHAR2(50) NOT NULL,
    fevent_id     NUMBER(7) NOT NULL
);

COMMENT ON COLUMN fire_caused.event_caused IS
    'fire event that was caused by this particular fire event';

COMMENT ON COLUMN fire_caused.fevent_id IS
    'id for the fire event';

ALTER TABLE fire_caused ADD CONSTRAINT fire_cause_pk PRIMARY KEY ( fevent_id );

CREATE TABLE fire_event (
    fevent_id          NUMBER(7) NOT NULL,
    fevent_name        VARCHAR2(50) NOT NULL,
    fevent_date        DATE NOT NULL,
    fevent_latitude    VARCHAR2(50) NOT NULL,
    fevent_longtitude  VARCHAR2(50) NOT NULL,
    fevent_area        VARCHAR2(50) DEFAULT '0' NOT NULL,
    fevent_livelost    VARCHAR2(50) DEFAULT '0' NOT NULL,
    fevent_tdamage     VARCHAR2(50) DEFAULT '0'
);

COMMENT ON COLUMN fire_event.fevent_id IS
    'id for the fire event';

COMMENT ON COLUMN fire_event.fevent_name IS
    'name of the fire event';

COMMENT ON COLUMN fire_event.fevent_date IS
    'date when the fire event happened';

COMMENT ON COLUMN fire_event.fevent_latitude IS
    'latitude of the fire event';

COMMENT ON COLUMN fire_event.fevent_longtitude IS
    'longtitude of the fire event';

COMMENT ON COLUMN fire_event.fevent_area IS
    'the size of area affected by the fire event';

COMMENT ON COLUMN fire_event.fevent_livelost IS
    'fatalities of the fire event';

COMMENT ON COLUMN fire_event.fevent_tdamage IS
    'total damage caused by the fire event';

ALTER TABLE fire_event ADD CONSTRAINT fire_event_pk PRIMARY KEY ( fevent_id );

CREATE TABLE insurance (
    insurance_code   NUMBER(7) NOT NULL,
    insurance_name   VARCHAR2(50) NOT NULL,
    insurance_phone  CHAR(10)
);

COMMENT ON COLUMN insurance.insurance_code IS
    'id for insurance company';

COMMENT ON COLUMN insurance.insurance_name IS
    'insurance company name';

COMMENT ON COLUMN insurance.insurance_phone IS
    'phone number for insurance company';

ALTER TABLE insurance ADD CONSTRAINT insurance_pk PRIMARY KEY ( insurance_code );

CREATE TABLE lga (
    lga_code   NUMBER(7) NOT NULL,
    lga_name   VARCHAR2(50) NOT NULL,
    lga_ceo    VARCHAR2(50) NOT NULL,
    lga_size   NUMBER(7) NOT NULL,
    lga_phone  CHAR(10) NOT NULL,
    fevent_id  NUMBER(7)
);

COMMENT ON COLUMN lga.lga_code IS
    'ID for lga';

COMMENT ON COLUMN lga.lga_name IS
    'name of an lga';

COMMENT ON COLUMN lga.lga_ceo IS
    'the name of the ceo';

COMMENT ON COLUMN lga.lga_size IS
    'area size of an lga';

COMMENT ON COLUMN lga.lga_phone IS
    'phone number of an lga';

ALTER TABLE lga ADD CONSTRAINT lga_pk PRIMARY KEY ( lga_code );

CREATE TABLE owner (
    owner_id     NUMBER(7) NOT NULL,
    owner_name   VARCHAR2(50) NOT NULL,
    owner_phone  CHAR(10) NOT NULL
);

COMMENT ON COLUMN owner.owner_id IS
    'id for owner';

COMMENT ON COLUMN owner.owner_name IS
    'owner name (person, organisation, etc)';

COMMENT ON COLUMN owner.owner_phone IS
    'contact number for owner';

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE property (
    property_id        NUMBER(7) NOT NULL,
    property_street    VARCHAR2(50) NOT NULL,
    property_town      VARCHAR2(50) NOT NULL,
    property_postcode  CHAR(10) NOT NULL,
    ptytype_id         NUMBER(7) NOT NULL,
    owner_id           NUMBER(7) NOT NULL,
    lga_code           NUMBER(7) NOT NULL
);

COMMENT ON COLUMN property.property_id IS
    'id for property';

COMMENT ON COLUMN property.property_street IS
    'street name of the property';

COMMENT ON COLUMN property.property_town IS
    'town name of the property';

COMMENT ON COLUMN property.property_postcode IS
    'postcode of the property';

COMMENT ON COLUMN property.ptytype_id IS
    'id for property type';

COMMENT ON COLUMN property.owner_id IS
    'id for owner';

COMMENT ON COLUMN property.lga_code IS
    'ID for lga';

ALTER TABLE property ADD CONSTRAINT property_pk PRIMARY KEY ( property_id );

CREATE TABLE property_type (
    ptytype_id    NUMBER(7) NOT NULL,
    ptytype_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN property_type.ptytype_id IS
    'id for property type';

COMMENT ON COLUMN property_type.ptytype_name IS
    'name of the property type';

ALTER TABLE property_type ADD CONSTRAINT property_type_pk PRIMARY KEY ( ptytype_id );

CREATE TABLE visit_date (
    assessor_id    NUMBER(7) NOT NULL,
    date_visitted  DATE NOT NULL,
    date_departed  DATE NOT NULL,
    building_no    NUMBER(7) NOT NULL,
    property_id    NUMBER(7) NOT NULL,
    fevent_id      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN visit_date.assessor_id IS
    'id number for assessor';

COMMENT ON COLUMN visit_date.date_visitted IS
    'date the assessor visits the building';

COMMENT ON COLUMN visit_date.date_departed IS
    'date the assessor finished the visit ';

COMMENT ON COLUMN visit_date.building_no IS
    'id for building';

COMMENT ON COLUMN visit_date.property_id IS
    'id for property';

COMMENT ON COLUMN visit_date.fevent_id IS
    'id for the fire event';

ALTER TABLE visit_date
    ADD CONSTRAINT visit_report_pk PRIMARY KEY ( date_visitted,
                                                 building_no,
                                                 property_id,
                                                 fevent_id );

CREATE TABLE work_history (
    work_startdate  DATE NOT NULL,
    work_leftdate   DATE NOT NULL,
    assessor_id     NUMBER(7) NOT NULL,
    insurance_code  NUMBER(7) NOT NULL,
    workhistory_no  NUMBER(7) NOT NULL
);

COMMENT ON COLUMN work_history.work_startdate IS
    'date the assessor started working for the company';

COMMENT ON COLUMN work_history.work_leftdate IS
    'date when the assessor left the company';

COMMENT ON COLUMN work_history.assessor_id IS
    'id number for assessor';

COMMENT ON COLUMN work_history.insurance_code IS
    'id for insurance company';

COMMENT ON COLUMN work_history.workhistory_no IS
    'surrogate key for work history';

ALTER TABLE work_history ADD CONSTRAINT work_history_pk PRIMARY KEY ( workhistory_no );

ALTER TABLE work_history
    ADD CONSTRAINT work_history_nk UNIQUE ( work_startdate,
                                            assessor_id,
                                            insurance_code );

ALTER TABLE visit_date
    ADD CONSTRAINT assessor_visitreport FOREIGN KEY ( assessor_id )
        REFERENCES assessor ( assessor_id );

ALTER TABLE work_history
    ADD CONSTRAINT assessor_workhistory FOREIGN KEY ( assessor_id )
        REFERENCES assessor ( assessor_id );

ALTER TABLE building_damage
    ADD CONSTRAINT building_blddamage FOREIGN KEY ( building_no,
                                                    property_id )
        REFERENCES building ( building_no,
                              property_id );

ALTER TABLE visit_date
    ADD CONSTRAINT buildingdamage_visitdate FOREIGN KEY ( building_no,
                                                          property_id,
                                                          fevent_id )
        REFERENCES building_damage ( building_no,
                                     property_id,
                                     fevent_id );

ALTER TABLE building_damage
    ADD CONSTRAINT fireevent_damage FOREIGN KEY ( fevent_id )
        REFERENCES fire_event ( fevent_id );

ALTER TABLE fire_caused
    ADD CONSTRAINT fireevent_firecause FOREIGN KEY ( fevent_id )
        REFERENCES fire_event ( fevent_id );

ALTER TABLE lga
    ADD CONSTRAINT fireevent_lga FOREIGN KEY ( fevent_id )
        REFERENCES fire_event ( fevent_id );

ALTER TABLE assessor
    ADD CONSTRAINT insurance_assessor FOREIGN KEY ( insurance_code )
        REFERENCES insurance ( insurance_code );

ALTER TABLE work_history
    ADD CONSTRAINT insurance_workhistory FOREIGN KEY ( insurance_code )
        REFERENCES insurance ( insurance_code );

ALTER TABLE property
    ADD CONSTRAINT lga_property FOREIGN KEY ( lga_code )
        REFERENCES lga ( lga_code );

ALTER TABLE property
    ADD CONSTRAINT owner_property FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE building
    ADD CONSTRAINT property_building FOREIGN KEY ( property_id )
        REFERENCES property ( property_id );

ALTER TABLE property
    ADD CONSTRAINT ptytype_property FOREIGN KEY ( ptytype_id )
        REFERENCES property_type ( ptytype_id );

ALTER TABLE building_history
    ADD CONSTRAINT relation_19 FOREIGN KEY ( building_no,
                                             property_id )
        REFERENCES building ( building_no,
                              property_id );

ALTER TABLE building_damage
    ADD CONSTRAINT relation_22 FOREIGN KEY ( lga_code )
        REFERENCES lga ( lga_code );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

SPOOL off
set echo off
