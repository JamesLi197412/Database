--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-rm-queries.sql
--Student ID: 28280016
--Student Name: Zhiyue Li
--Tutorial No:Rodion

/* Comments for your marker:


*/


/*
2(a) Query 1
/*
(a)
*/
SELECT
    lpad(rtrim(to_char(ca.carndate, 'Dy DD Month'))
         || ' '
         || to_char(ca.carndate, 'YYYY'), 23) AS carnival_date,
    carnname,
    eventtypedesc,
    compfname
    || ' '
    || complname AS fullname
FROM
    competitor   c
    JOIN entry        e ON c.compno = e.compno
    JOIN event        ev ON e.carndate = ev.carndate
                     AND e.eventtypecode = ev.eventtypecode
    JOIN eventtype    et ON ev.eventtypecode = et.eventtypecode
    JOIN carnival     ca ON ev.carndate = ca.carndate
WHERE
    upper(compemail) LIKE '%MONASH.EDU%'
ORDER BY
    ca.carndate,
    fullname;
    
/*
(b)
*/

SELECT
    to_char(e.carndate, 'dd-Mon-yyyy') AS carnival_date,
    compfname
    || ' '
    || complname AS runner,
    e.charname,
    charcontact,
    eventtypedesc
FROM
    entry        e
    JOIN competitor   c ON e.compno = c.compno
    JOIN charity      ch ON e.charname = ch.charname
    JOIN event        ev ON e.carndate = ev.carndate
                     AND e.eventtypecode = ev.eventtypecode
    JOIN eventtype    et ON ev.eventtypecode = et.eventtypecode
WHERE
    upper(eventtypedesc) = '42.2 KM MARATHON'
ORDER BY
    e.carndate,
    e.charname,
    runner;
    

/*
(c)
*/

SELECT
    compno,
    compfname,
    complname,
    compgender,
    to_char((
        SELECT
            COUNT(*)
        FROM
            entry
        WHERE
            compno = c.compno
            AND EXTRACT(YEAR FROM carndate) = EXTRACT(YEAR FROM sysdate) - 2
    ), 99) AS twoyrsback,
    to_char((
        SELECT
            COUNT(*)
        FROM
            entry
        WHERE
            compno = c.compno
            AND EXTRACT(YEAR FROM carndate) = EXTRACT(YEAR FROM sysdate) - 1
    ), 99) AS lastcalyear,
    CASE
        WHEN (
            SELECT
                COUNT(*)
            FROM
                entry
            WHERE
                compno = c.compno
                AND EXTRACT(YEAR FROM carndate) BETWEEN EXTRACT(YEAR FROM sysdate) - 2 AND EXTRACT(YEAR FROM sysdate) - 1
        ) = 0 THEN
            '  Completed No Runs'
        ELSE
            to_char((
                SELECT
                    COUNT(*)
                FROM
                    entry
                WHERE
                    compno = c.compno
                    AND EXTRACT(YEAR FROM carndate) BETWEEN EXTRACT(YEAR FROM sysdate) - 2 AND EXTRACT(YEAR FROM sysdate)
            ), '99')
    END AS last2calendaryears
FROM
    competitor c
ORDER BY
    last2calendaryears DESC,
    compno;
 
/*
(d)
*/

SELECT
    c.carnname,
    to_char(c.carndate, 'dd Month yyyy') AS carnival_date,
    lpad(floor(months_between(sysdate, MIN(compdob)) / 12)
         || ' years '
         || floor(mod(months_between(sysdate, MIN(compdob)), 12))
         || ' month/s old', 25, ' ') AS oldest_competitor_age,
    lpad(floor(months_between(sysdate, MAX(compdob)) / 12)
         || ' years '
         || floor(mod(months_between(sysdate, MAX(compdob)), 12))
         || ' month/s old', 25, ' ') AS youngest_competitor_age
FROM
    entry        e
    JOIN competitor   c ON e.compno = c.compno
    JOIN carnival     c ON e.carndate = c.carndate
GROUP BY
    c.carnname,
    c.carndate
ORDER BY
    oldest_competitor_age DESC,
    c.carndate;


/*
(e) 
*/

SELECT
    to_char(e.carndate, 'dd-Mon-yyyy') AS carnival_date,
    carnname,
    COUNT(*) AS total_entries5Km
FROM
    carnival    c
    JOIN entry       e ON c.carndate = e.carndate
    JOIN event       ev ON e.carndate = ev.carndate and e.eventtypecode = ev.eventtypecode
    JOIN eventtype   et ON ev.eventtypecode = et.eventtypecode
WHERE
    upper(et.eventtypedesc) = upper('5 Km Run')
    AND TO_CHAR(ev.carndate,'YYYY') = '2019'
GROUP BY
     e.carndate, carnname 
ORDER BY
    total_entries5Km DESC,
    e.carndate;

/* 
(f) 
*/

SELECT
    to_char(c.carndate, 'dd-Mon-yyyy') AS carnival_date,
    carnname,
    eventtypedesc
FROM
    carnival    c
    JOIN event       e ON e.carndate = c.carndate
    JOIN eventtype   et ON et.eventtypecode = e.eventtypecode
    LEFT JOIN entry       en ON e.carndate = en.carndate
                          AND e.eventtypecode = en.eventtypecode
WHERE
    c.carndate < sysdate
GROUP BY
    c.carndate,
    carnname,
    eventtypedesc
HAVING
    COUNT(entryid) = 0
ORDER BY
    c.carndate,
    eventtypedesc;

/*
(g)
*/

SELECT
    c.charname,
    COUNT(distinct t.teamid) AS team_nominations,
    COUNT(distinct e.entryid) AS individual_nominations,
    COUNT(distinct t.teamid) + COUNT(distinct e.entryid) AS total_nominations
FROM
    charity   c
    LEFT OUTER JOIN team      t ON t.charname = c.charname
    LEFT OUTER JOIN entry     e ON e.charname = c.charname
GROUP BY
    c.charname
ORDER BY
    total_nominations DESC,
    team_nominations DESC,
    individual_nominations DESC;
    
--OR
SELECT
    c.charname,
    (select count(*) from team where charname =c.charname) AS team_nominations,
    (select count(*) from entry where charname =c.charname)  AS individual_nominations,
    (select count(*) from team where charname =c.charname) + (select count(*) from entry where charname =c.charname) AS total_nominations
FROM
    charity   c
GROUP BY
    c.charname
ORDER BY
    total_nominations DESC,
    team_nominations DESC,
    individual_nominations DESC;

/*
(h)
*/

SELECT
    teamname,
    to_char(t.carndate, 'dd-Mon-yyyy') AS carnivaldate,
    to_char(c.compno, '0009')
    || ' '
    || ' '
    || compfname
    || ' '
    || complname AS teamleader,
    teamnomembers
FROM
    competitor   c
    JOIN entry        e ON c.compno = e.compno
    JOIN team         t ON t.entryid = e.entryid
WHERE
    teamname IN (
        SELECT
            teamname
        FROM
            team
        GROUP BY
            teamname
        HAVING
            COUNT(teamname) = (
                SELECT
                    MAX(COUNT(teamname))
                FROM
                    team
                GROUP BY
                    teamname
            )
    )
ORDER BY
    teamname,
    t.carndate;

/*
(i)
*/

SELECT
    compfname
    || ' '
    || complname AS fullname,
    to_char(entrystarttime, 'hh:mi:ss') AS starttime,
    to_char(entryfinishtime, 'hh:mi:ss') AS finishtime,
    lpad(to_char(trunc(24 *(entryfinishtime - entrystarttime)), '09')
         || ':'
         || ltrim(to_char(trunc(mod(24 * 60 *(entryfinishtime - entrystarttime), 60)), '09'))
         || ':'
         || ltrim(to_char(trunc(mod(round(24 * 60 * 60 *(entryfinishtime - entrystarttime), 0), 60)), '09')), 16) AS "RUN DURATION (hh:mi:ss)"
FROM
    entry        e
    JOIN competitor   c ON e.compno = c.compno
    JOIN event        ev ON e.carndate = ev.carndate
                     AND e.eventtypecode = ev.eventtypecode
    JOIN eventtype    et ON ev.eventtypecode = et.eventtypecode
WHERE
    upper(eventtypedesc) = '5 KM RUN'
    AND ev.carndate = TO_DATE('08-Sep-2019', 'dd-Mon-yyyy')
    AND entryfinishtime - entrystarttime > (
        SELECT
            AVG(entryfinishtime - entrystarttime)
        FROM
            entry        e
            JOIN competitor   c ON e.compno = c.compno
            JOIN event        ev ON e.carndate = ev.carndate
                             AND e.eventtypecode = ev.eventtypecode
            JOIN eventtype    et ON ev.eventtypecode = et.eventtypecode
        WHERE
            upper(eventtypedesc) = '5 KM RUN'
            AND ev.carndate = TO_DATE('04-Apr-2019', 'dd-Mon-yyyy')
    )
ORDER BY
    entryfinishtime - entrystarttime DESC;
    