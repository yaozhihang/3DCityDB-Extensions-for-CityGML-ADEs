-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ***********************************  Create tables ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- -------------------------------------------------------------------- 
-- AbstractTimeseries 
-- -------------------------------------------------------------------- 
CREATE TABLE AbstractTimeseries
(
    ID INTEGER NOT NULL,
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- AtomicTimeseries 
-- -------------------------------------------------------------------- 
CREATE TABLE AtomicTimeseries
(
    ID INTEGER NOT NULL,
    dynamicDataTVP CLOB,
    dynamicDataDR CLOB,
    observationData CLOB,
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- CityObject_dynamizer_ade_ADE 
-- -------------------------------------------------------------------- 
CREATE TABLE CityObject_dynamizer_ade_ADE
(
    ID INTEGER NOT NULL,
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- CompositeTimeseries 
-- -------------------------------------------------------------------- 
CREATE TABLE CompositeTimeseries
(
    ID INTEGER NOT NULL,
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- Dynamizer 
-- -------------------------------------------------------------------- 
CREATE TABLE Dynamizer
(
    ID INTEGER NOT NULL,
    dynamicData_ID INTEGER,
    linkToSensor_ID INTEGER,
    Dyna_dyna_City_dyna_ade_ADE_ID INTEGER,
    startTime_frame VARCHAR2(254),
    startTime_calendarEraName VARCHAR2(254),
    startTime_indeterminatePositio VARCHAR2(254),
    startTime VARCHAR2(254),
    endTime_frame VARCHAR2(254),
    endTime_calendarEraName VARCHAR2(254),
    endTime_indeterminatePosition VARCHAR2(254),
    endTime VARCHAR2(254),
    attributeRef VARCHAR2(254),
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- SensorConnection 
-- -------------------------------------------------------------------- 
CREATE TABLE SensorConnection
(
    ID INTEGER NOT NULL,
    sensorLocation_ID INTEGER,
    sensorID VARCHAR2(254),
    serviceType VARCHAR2(254),
    linkToObservation VARCHAR2(254),
    linkToSensorML VARCHAR2(254),
    PRIMARY KEY (ID)
);

-- -------------------------------------------------------------------- 
-- TimeseriesComponent 
-- -------------------------------------------------------------------- 
CREATE TABLE TimeseriesComponent
(
    ID INTEGER NOT NULL,
    timeseries_ID INTEGER,
    Timeserie_componen_Composit_ID INTEGER,
    repetitions INTEGER,
    additionalGap VARCHAR2(254),
    PRIMARY KEY (ID)
);

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************  Create foreign keys  ******************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- -------------------------------------------------------------------- 
-- AtomicTimeseries 
-- -------------------------------------------------------------------- 
ALTER TABLE AtomicTimeseries
    ADD CONSTRAINT AtomicTimeseries_FK FOREIGN KEY (ID) REFERENCES AbstractTimeseries (ID);

-- -------------------------------------------------------------------- 
-- CompositeTimeseries 
-- -------------------------------------------------------------------- 
ALTER TABLE CompositeTimeseries
    ADD CONSTRAINT CompositeTimeseries_FK FOREIGN KEY (ID) REFERENCES AbstractTimeseries (ID);

-- -------------------------------------------------------------------- 
-- Dynamizer 
-- -------------------------------------------------------------------- 
ALTER TABLE Dynamizer
    ADD CONSTRAINT Dynamizer_FK FOREIGN KEY (ID) REFERENCES cityobject (ID);

ALTER TABLE Dynamizer
    ADD CONSTRAINT Dynamizer_dynamicData_FK FOREIGN KEY (dynamicData_ID) REFERENCES AbstractTimeseries (ID);

ALTER TABLE Dynamizer
    ADD CONSTRAINT Dynamizer_linkToSensor_FK FOREIGN KEY (linkToSensor_ID) REFERENCES SensorConnection (ID);

ALTER TABLE Dynamizer
    ADD CONSTRAINT Dyna_dyna_City_dyna_ade_ADE_FK FOREIGN KEY (Dyna_dyna_City_dyna_ade_ADE_ID) REFERENCES CityObject_dynamizer_ade_ADE (ID);

-- -------------------------------------------------------------------- 
-- SensorConnection 
-- -------------------------------------------------------------------- 
ALTER TABLE SensorConnection
    ADD CONSTRAINT SensorConnect_sensorLocatio_FK FOREIGN KEY (sensorLocation_ID) REFERENCES cityobject (ID);

-- -------------------------------------------------------------------- 
-- TimeseriesComponent 
-- -------------------------------------------------------------------- 
ALTER TABLE TimeseriesComponent
    ADD CONSTRAINT TimeseriesCompon_timeseries_FK FOREIGN KEY (timeseries_ID) REFERENCES AbstractTimeseries (ID);

ALTER TABLE TimeseriesComponent
    ADD CONSTRAINT Timeserie_componen_Composit_FK FOREIGN KEY (Timeserie_componen_Composit_ID) REFERENCES CompositeTimeseries (ID);

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************  Create Indexes  ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- -------------------------------------------------------------------- 
-- Dynamizer 
-- -------------------------------------------------------------------- 
CREATE INDEX Dynamizer_dynamicData_FKX ON Dynamizer (dynamicData_ID);

CREATE INDEX Dynamizer_linkToSensor_FKX ON Dynamizer (linkToSensor_ID);

CREATE INDEX Dyna_dyna_City_dyn_ade_ADE_FKX ON Dynamizer (Dyna_dyna_City_dyna_ade_ADE_ID);

-- -------------------------------------------------------------------- 
-- SensorConnection 
-- -------------------------------------------------------------------- 
CREATE INDEX SensorConnect_sensorLocati_FKX ON SensorConnection (sensorLocation_ID);

-- -------------------------------------------------------------------- 
-- TimeseriesComponent 
-- -------------------------------------------------------------------- 
CREATE INDEX TimeseriesCompo_timeseries_FKX ON TimeseriesComponent (timeseries_ID);

CREATE INDEX Timeseri_componen_Composit_FKX ON TimeseriesComponent (Timeserie_componen_Composit_ID);

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************  Create Sequences  *********************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
