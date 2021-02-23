--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-plsql.sql
--Student ID: 28280016
--Student Name: Zhiyue Li   
--Tutorial No: Rodion

/* Comments for your marker:

/* 
4(a) 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER MAINTAIN_TEAMNOMEMBERS 
AFTER DELETE OR INSERT OR UPDATE OF TEAMID ON ENTRY 
FOR EACH ROW 
declare nomembers number;
BEGIN

  IF DELETING THEN
    update team
    set teamnomembers = teamnomembers - 1
    where teamid = :old.teamid;
  ELSE
    select teamnomembers into nomembers from team
    where teamid = :new.teamid;
    
    IF nomembers >= 5 THEN
        raise_application_error(-20000,'The team already has 5 members, pick other team');
    ELSE
        IF INSERTING THEN
            update team
            set teamnomembers = teamnomembers + 1
            where teamid = :new.teamid;
        ELSE
            update team
            set teamnomembers = teamnomembers - 1
            where teamid = :old.teamid;
            
            update team
            set teamnomembers = teamnomembers + 1
            where teamid = :new.teamid;
        END IF;
        
    END IF;
    
  END IF;
  
END;
/
--Test Harness
--Before value
select * from entry where teamid = 5;
select * from team where teamid = 5;


--insert, team member less than 5
insert into entry values(39,
                        null,
                        null,
                        null,
                        1,
                        to_date('06/02/2020','dd/mm/yyyy'),
                        '42K',
                        5,
                        null);

select * from entry where teamid = 5;
select * from team where teamid = 5;

--insert, team member more than 5
insert into entry values(40,
                        null,
                        null,
                        null,
                        2,
                        to_date('06/02/2020','dd/mm/yyyy'),
                        '42K',
                        5,
                        null);

select * from entry where teamid = 5;
select * from team where teamid = 5;

--update, move a competitor from team 5 to team 4
select * from entry where teamid = 4;
select * from team where teamid = 4;

update entry
set teamid = 4
where entryid = 39;


select * from entry where teamid = 5;
select * from team where teamid = 5;
select * from entry where teamid = 4;
select * from team where teamid = 4;

--delete a competitor from team 4
delete from entry where entryid = 39;

select * from entry where teamid = 4;
select * from team where teamid = 4;

rollback;

--end of test harness

/*
(b)
*/
CREATE OR REPLACE TRIGGER MAINTAIN_ELAPSEDTIME 
BEFORE UPDATE OF ENTRYFINISHTIME ON ENTRY 
FOR EACH ROW 
DECLARE fastest NUMBER;
BEGIN
  select eventtypefastestelapsedtime into fastest
  from eventtype where eventtypecode = :new.eventtypecode;
  
  :new.entryelapsedtime := ( :new.entryfinishtime - :new.entrystarttime ) * 24 * 60;
  
  IF :new.entryelapsedtime < fastest THEN
    UPDATE eventtype et
    SET eventtypefastestelapsedtime = :new.entryelapsedtime,
    eventtypefastestcarnival = 
    (select carnname from carnival
        where carndate = :new.carndate),
    eventtypefastestcompetitor = 
    (select compfname ||' ' ||complname
        from competitor co 
        where compno = :new.compno
    )
    WHERE eventtypecode = :new.eventtypecode;
    
  END IF;
END;

/
--testharness
--before value
select entryid, 
        to_char(entrystarttime, 'dd/mm/yyyy hh:mi') as starttime,
        to_char(entryfinishtime, 'dd/mm/yyyy hh:mi') as finishtime,
        entryelapsedtime
        from entry where eventtypecode = '42K';

select * from eventtype where eventtypecode = '42K';

insert into entry values(39,
                        null,
                        null,
                        null,
                        1,
                        to_date('06/02/2020','dd/mm/yyyy'),
                        '42K',
                        5,
                        null);

--new elapsed time (not the fastest)
update entry
        set entrystarttime = to_date('06/02/2020 07:00','dd/mm/yyyy hh:mi'),
        entryfinishtime = to_date('06/02/2020 11:00','dd/mm/yyyy hh:mi')
        where entryid = 39;

select entryid, 
        to_char(entrystarttime, 'dd/mm/yyyy hh:mi') as starttime,
        to_char(entryfinishtime, 'dd/mm/yyyy hh:mi') as finishtime,
        entryelapsedtime
from entry where eventtypecode = '42K';

select * from eventtype where eventtypecode = '42K';

rollback;

--new fastest elapsed time
insert into entry values(39,
                        null,
                        null,
                        null,
                        1,
                        to_date('06/02/2020','dd/mm/yyyy'),
                        '42K',
                        5,
                        null);

update entry
        set entrystarttime = to_date('06/02/2020 07:00','dd/mm/yyyy hh:mi'),
        entryfinishtime = to_date('06/02/2020 09:35','dd/mm/yyyy hh:mi')
        where entryid = 39;

select entryid, 
        to_char(entrystarttime, 'dd/mm/yyyy hh:mi') as starttime,
        to_char(entryfinishtime, 'dd/mm/yyyy hh:mi') as finishtime,
        entryelapsedtime
        from entry where eventtypecode = '42K';

select * from eventtype where eventtypecode = '42K';

rollback;

--end of testing harness
