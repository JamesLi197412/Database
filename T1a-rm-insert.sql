--****PLEASE ENTER YOUR DETAILS BELOW****
--T1a-rm-insert.sql
--Student ID: 28280016
--Student Name: Zhiyue Li
--Tutorial No: Rodion

/* Comments for your marker:
*/
/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- 20 Entries


INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    1,
    TO_DATE('01-feb-2019:08:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('01-feb-2019:08:52:30 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    1,
    TO_DATE('01-feb-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    3,
    TO_DATE('01-feb-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('01-feb-2019:10:53:20 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    3,
    TO_DATE('01-feb-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    4,
    TO_DATE('01-feb-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('01-feb-2019:10:59:35 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    5,
    TO_DATE('01-feb-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    5,
    TO_DATE('04-apr-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:41:28 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    3,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    6,
    TO_DATE('04-apr-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:48:13 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    4,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    7,
    TO_DATE('04-apr-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:25:45 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    5,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    10,
    TO_DATE('04-apr-2019:09:30:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:28:23 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    'Salvation Army',
    7,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    11,
    TO_DATE('04-apr-2019:09:30:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:18:10 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    8,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    12,
    TO_DATE('04-apr-2019:09:30:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:31:48 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    9,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '10K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    13,
    TO_DATE('04-apr-2019:08:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:31:44 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    14,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '21K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    14,
    TO_DATE('04-apr-2019:08:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:45:36 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    15,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '21K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    16,
    TO_DATE('04-apr-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('04-apr-2019:10:55:17 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    'Salvation Army',
    6,
    TO_DATE('04-apr-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    17,
    TO_DATE('08-sep-2019:09:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:09:45:36 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    10,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    18,
    TO_DATE('08-sep-2019:09:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:09:42:48 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    11,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    19,
    TO_DATE('08-sep-2019:09:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:09:44:23 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    12,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    20,
    TO_DATE('08-sep-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:10:30:14 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    15,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    23,
    TO_DATE('08-sep-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:11:01:58 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    18,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    25,
    TO_DATE('08-sep-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:10:26:28 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    5,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    26,
    TO_DATE('08-sep-2019:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('08-sep-2019:10:18:29 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    6,
    TO_DATE('08-sep-2019', 'dd-mon-yyyy'),
    '5K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    27,
    TO_DATE('06-feb-2020:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:18:56 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    6,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '3K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    28,
    TO_DATE('06-feb-2020:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:25:48 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    5,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '3K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    30,
    TO_DATE('06-feb-2020:10:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:21:03 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    'Amnesty International',
    4,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '3K '
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    33,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:12:35:29 PM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    14,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    34,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:05:48 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    15,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    35,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:11:05:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    3,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    36,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:09:45:39 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    'Amnesty International',
    7,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    37,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:00:57 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    8,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO entry (
    entryid,
    entrystarttime,
    entryfinishtime,
    charname,
    compno,
    carndate,
    eventtypecode
) VALUES (
    38,
    TO_DATE('06-feb-2020:07:00:00 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    TO_DATE('06-feb-2020:10:23:32 AM', 'dd-mon-yyyy:hh:mi:ss am'),
    NULL,
    9,
    TO_DATE('06-feb-2020', 'dd-mon-yyyy'),
    '42K'
);

INSERT INTO team (
    teamid,
    teamname,
    carndate,
    teamnomembers,
    charname,
    entryid
) VALUES (
    1,
    'Gentle Earth',
    TO_DATE('04/APR/2019', 'DD/MON/YYYY'),
    2,
    'Amnesty International',
    5
);

INSERT INTO team (
    teamid,
    teamname,
    carndate,
    teamnomembers,
    charname,
    entryid
) VALUES (
    2,
    'Happy Feet',
    TO_DATE('04/APR/2019', 'DD/MON/YYYY'),
    2,
    'Beyond Blue',
    14
);

INSERT INTO team (
    teamid,
    teamname,
    carndate,
    teamnomembers,
    charname,
    entryid
) VALUES (
    3,
    'Avengers',
    TO_DATE('06/FEB/2020', 'DD/MON/YYYY'),
    2,
    'Salvation Army',
    37
);

INSERT INTO team (
    teamid,
    teamname,
    carndate,
    teamnomembers,
    charname,
    entryid
) VALUES (
    4,
    'Footloose',
    TO_DATE('06/FEB/2020', 'DD/MON/YYYY'),
    3,
    'Salvation Army',
    38
);

INSERT INTO team (
    teamid,
    teamname,
    carndate,
    teamnomembers,
    charname,
    entryid
) VALUES (
    5,
    'Happy Feet',
    TO_DATE('06/FEB/2020', 'DD/MON/YYYY'),
    4,
    'Amnesty International',
    30
);

-- UPDATE ENTRY FOR TEAM DETAILS

-- Team 1

UPDATE entry
SET
    teamid = 1
WHERE
    entryid = 5;

UPDATE entry
SET
    teamid = 1
WHERE
    entryid = 6;

-- Team 2

UPDATE entry
SET
    teamid = 2
WHERE
    entryid = 14;

UPDATE entry
SET
    teamid = 2
WHERE
    entryid = 13;

-- Team 3

UPDATE entry
SET
    teamid = 3
WHERE
    entryid = 37;

UPDATE entry
SET
    teamid = 3
WHERE
    entryid = 36;

-- Team 4

UPDATE entry
SET
    teamid = 4
WHERE
    entryid = 38;

UPDATE entry
SET
    teamid = 4
WHERE
    entryid = 33;

UPDATE entry
SET
    teamid = 4
WHERE
    entryid = 34;

-- Team 5

UPDATE entry
SET
    teamid = 5
WHERE
    entryid = 30;

UPDATE entry
SET
    teamid = 5
WHERE
    entryid = 27;

UPDATE entry
SET
    teamid = 5
WHERE
    entryid = 28;

UPDATE entry
SET
    teamid = 5
WHERE
    entryid = 35;

COMMIT;