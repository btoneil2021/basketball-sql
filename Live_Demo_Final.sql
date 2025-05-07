-- add, delete, edit, modify and print reports (select), aggregate query
insert into players values ('LAYNLENK', 'Layne Lenkowski', 'PF', 68, 240, 0, 61, 'Villanova', '2003-03-15');
insert into players values ('BENONEI', 'Ben O''Neil', 'SF', 69, 190, 0, 62, 'Villanova', '2003-03-15');
insert into players values ('MELISILV', 'Melissa Silva', 'PG', 65, 165, 0, 63, 'Villanova', '2003-03-15');
insert into players values ('DUDEGUY', 'Dude Guy', 'C', 59, 100, 1, 64, 'Germany', '2000-01-01');
INSERT INTO PlayersColleges (P_ID, C_ID) VALUES ('LAYNLENK', 'VILL');
INSERT INTO PlayersColleges (P_ID, C_ID) VALUES ('BENONEI', 'VILL');
INSERT INTO PlayersColleges (P_ID, C_ID) VALUES ('MELISILV', 'VILL');
INSERT INTO PlayersColleges (P_ID, C_ID) VALUES ('DUDEGUY', '0000');
insert into stats values ('LAYNLENK', 45, 22, 4, 7, 0.57, 1, 2, 0.5, 2, 3, 0.67, 2, 2, 1, 1, 1, 3, 10, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5);
INSERT INTO PlayersStats (P_ID, Stats_ID) VALUES ('LAYNLENK', 'LAYNLENK');

update players
set height_in_inches = 78
where P_ID = 'LAYNLENK';

select * from players;

delete from playerscolleges where P_ID = 'DUDEGUY';
delete from players where P_ID = 'DUDEGUY';

select * from players;

select * from stats where points_per_game = (select max(points_per_game) from stats);

select * from college;
SELECT * FROM Stats;

SELECT 
    p.p_name,
    p.p_rank,
    u.college_name
FROM players p
JOIN PlayersColleges c ON p.p_id = c.p_id
JOIN College u ON c.c_id = u.c_id
JOIN PlayersStats s ON p.p_id = s.p_id
JOIN stats q ON s.stats_id = q.stats_id
WHERE q.points_per_game = (
    SELECT MAX(points_per_game)
    FROM Stats
);