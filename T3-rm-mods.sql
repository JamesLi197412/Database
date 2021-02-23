--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-mods.sql
--Student ID: 28280016
--Student Name: Zhiyue Li   
--Tutorial No: Rodion

/* Comments for your marker:




*/


/*
3(a) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

ALTER TABLE entry
   ADD CONSTRAINT entry_unq unique (compno, carndate);


/*
3(b) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

ALTER TABLE entry ADD (
    entryelapsedtime NUMBER(5, 2)
);

COMMENT ON COLUMN entry.entryelapsedtime IS
    'Elapsed time for this run';

UPDATE entry
SET
    entryelapsedtime = ( entryfinishtime - entrystarttime ) * 24 * 60;

COMMIT;


/*
3(c) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


ALTER TABLE eventtype ADD (
    eventtypefastestelapsedtime NUMBER(5, 2),
    eventtypefastestcarnival VARCHAR(50),
    eventtypefastestcompetitor VARCHAR(50)
);

COMMENT ON COLUMN eventtype.eventtypefastestelapsedtime IS
    'Fastest elapsed time for this event type';
COMMENT ON COLUMN eventtype.eventtypefastestcarnival IS
    'Fastest elapsed times carnival for this event type';
COMMENT ON COLUMN eventtype.eventtypefastestcompetitor IS
    'Fastest elapsed times competitor for this event type';

UPDATE eventtype et
SET (eventtypefastestelapsedtime, eventtypefastestcarnival, eventtypefastestcompetitor)
    = (select entryelapsedtime, compfname ||' ' ||complname, 
carnname
from entry e
join competitor co on e.compno = co.compno
join carnival ca on e.carndate = ca.carndate
where e.eventtypecode = et.eventtypecode
and entryelapsedtime = 
(select min(entryelapsedtime) from entry e2 where e2.eventtypecode = et.eventtypecode));
    

COMMIT;



/*
3(d) Changes to live database 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

DROP TABLE emrcon_competitor;

-- create bridging entity
CREATE TABLE emrcon_competitor (
    emerconphone  CHAR(10) NOT NULL,
    compno        NUMBER(4) NOT NULL,
    ecrelation   CHAR(1) NOT NULL
);

COMMENT ON COLUMN emrcon_competitor.emerconphone IS
    'Emergency contact phone number';

COMMENT ON COLUMN emrcon_competitor.compno IS
    'Competitor registration number';
    
COMMENT ON COLUMN emrcon_competitor.ecrelation IS
    'Emergency contact relationship to competitor (P or  T or G or F)
P = Parent
T = Partner
G = Guardian
F = Friend
';

ALTER TABLE emrcon_competitor
    ADD CONSTRAINT chck_ecrelation CHECK ( ecrelation IN ( 'P', 'T', 'G', 'F' ) );

ALTER TABLE emrcon_competitor ADD CONSTRAINT ec_comp_pk PRIMARY KEY ( emerconphone,
                                                            compno );

ALTER TABLE emrcon_competitor
    ADD CONSTRAINT ec_comp_ec_fk FOREIGN KEY ( emerconphone )
        REFERENCES emercontact ( emerconphone );

ALTER TABLE emrcon_competitor
    ADD CONSTRAINT ec_comp_comp_fk FOREIGN KEY ( compno )
        REFERENCES competitor ( compno );
      
-- insert data based on current emergency contacts for competitors

INSERT INTO emrcon_competitor
    ( SELECT
        emerconphone,
        compno,
        compecrelation
    FROM
        competitor
    );

COMMIT;

-- remove attributes from competitor, also drops FK and check

ALTER TABLE competitor DROP ( emerconphone, compecrelation );
