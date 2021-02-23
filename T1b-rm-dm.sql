 --****PLEASE ENTER YOUR DETAILS BELOW****
--T1b-rm-dm.sql
--Student ID: 28280016
--Student Name:  Zhiyue Li  
--Tutorial No:Rodion

/* Comments for your marker:

*/


/*
1b(i) Create sequences 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- Competitor
-- Entry
-- Team

DROP SEQUENCE competitor_seq;
DROP SEQUENCE entry_seq;
DROP SEQUENCE team_seq;

CREATE SEQUENCE competitor_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE entry_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 1;

/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

-- insert entry
INSERT INTO entry VALUES (
    entry_seq.NEXTVAL,
    NULL,
    NULL,
    'Amnesty International',
    (
                    SELECT
                        compno
                    FROM
                        competitor
                    WHERE
                        compphone = '1234567890'
     ),
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    ),
    (
        SELECT
            eventtypecode
         FROM
              eventtype
          WHERE
                    upper(eventtypedesc) = upper('21.1 Km Half Marathon')
    ),
    null
);

COMMIT;

/*
(iii)
*/

-- Update entry to 10 Km
UPDATE entry
SET
     eventtypecode = (
                SELECT
                    eventtypecode
                FROM
                    eventtype
                WHERE
                    upper(eventtypedesc) = upper('10 Km Run')
            )
WHERE
    compno = (
        select compno
        from competitor
        where compphone  = '1234567890'
    
    )
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    );

-- Add new team
INSERT INTO team VALUES (
    team_seq.nextval,
    'Kenya Speedstars',
    (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    ),
    1,
    'Beyond Blue',
    (
        SELECT
            entryid
        FROM
            entry
        WHERE
                compno = (
                    SELECT
                        compno
                    FROM
                        competitor
                    WHERE
                        compphone = '1234567890'
                )
            AND carndate = (
                SELECT
                    carndate
                FROM
                    carnival
                WHERE
                    upper(carnname) = upper('RM Summer Series Clayton 2021')
            )
    )
);

-- Update entry to assign Brigid as team leader (furst runner in the team)
UPDATE entry
SET
    teamid = team_seq.CURRVAL
WHERE
        compno = (
            SELECT
                compno
            FROM
                competitor
            WHERE
                compphone = '1234567890'
        )
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    );

COMMIT;

/*
(iv) 
*/

-- change all members of Brigids team to no team
UPDATE entry
SET
    teamid = NULL
WHERE
    teamid = (
        SELECT
            teamid
        FROM
            team
        WHERE
                upper(teamname) = upper('Kenya Speedstars')
            AND carndate = (
                SELECT
                    carndate
                FROM
                    carnival
                WHERE
                    upper(carnname) = upper('RM Summer Series Clayton 2021')
            )
    );

-- remove the team
DELETE FROM team
WHERE
        upper(teamname) = upper('Kenya Speedstars')
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    );

-- remove Brigid's entry
DELETE FROM entry
WHERE
        compno = (
            SELECT
                compno
            FROM
                competitor
            WHERE
                compphone = '1234567890'
        )
    AND carndate = (
        SELECT
            carndate
        FROM
            carnival
        WHERE
            upper(carnname) = upper('RM Summer Series Clayton 2021')
    );

COMMIT;