-- Layne Lenkowski, Melissa Silva, Ben O'Neil
-- Final Project - College Basketball Report

drop table College cascade constraints;
drop table Stats cascade constraints;
drop table Players cascade constraints;
drop table PlayersColleges cascade constraints;
drop table PlayersStats cascade constraints;

CREATE TABLE College (
    C_ID VARCHAR(4) PRIMARY KEY NOT NULL,
    College_Name VARCHAR(35),
    College_City VARCHAR(20),
    College_State VARCHAR(20), 
    Conference VARCHAR(32),
    Division VARCHAR(10)
);

CREATE TABLE Stats (
    Stats_ID VARCHAR(8) PRIMARY KEY NOT NULL,
    -- Player_Name VARCHAR(30), This is not needed in stats, we already have stats_id and the spine table
    Games_Played INT,               
    Minutes_Per_Game DECIMAL(4,1),     
    FGM_Ave DECIMAL(3,1),
    FGA_Ave DECIMAL(3,1),                          
    FG_Percentage DECIMAL(4,3),        -- FG%
    Three_PM_Ave DECIMAL(3,1),                  -- 3-Pointers Made (from 3PM-3PA)
    Three_PA_Ave DECIMAL(3,1),                      -- 3-Pointers Attempted (from 3PM-3PA)
    Three_P_Percentage DECIMAL(4,3),   -- 3P%
    FTM_Ave DECIMAL(3,1),                        -- Free Throws Made (from FTM-FTA)
    FTA_Ave DECIMAL(3,1),                           -- Free Throws Attempted (from FTM-FTA)
    FT_Percentage DECIMAL(4,3),        -- FT%
    Rebounds DECIMAL(4,1),             -- REB (Average)
    Assists DECIMAL(4,1),              -- AST (Average)
    P_Blocks DECIMAL(3,1),               -- BLK (Average)
    Steals DECIMAL(3,1),               -- STL (Average)
    Turnovers DECIMAL(3,1),            -- TO (Average)
    Fouls DECIMAL(3,1),                -- PF (Average)
    Points_Per_Game DECIMAL(4,1),      -- PTS (Average)
    True_Shooting_Percentage DECIMAL(4,3), -- True Shooting %
    Effective_FG_Percentage DECIMAL(4,3),  -- Effective FG%
    Three_PA_Rate DECIMAL(4,3),            -- 3PA Rate
    Free_Throw_Rate DECIMAL(4,3),          -- FTA Rate
    Projected_NBA_3P_Percentage DECIMAL(4,3), -- Proj NBA 3P%
    Usage_Percentage DECIMAL(4,1),         -- USG%
    Assists_To_Usage_Ratio DECIMAL(4,2),   -- AST/USG
    Assists_To_Turnovers_Ratio DECIMAL(4,2) -- AST/TO
);

CREATE TABLE Players (
    P_ID VARCHAR(8) PRIMARY KEY NOT NULL, 
    P_Name VARCHAR(30),
    P_Position VARCHAR(15), 
    Height_In_Inches INT, 
    Weight_In_lbs INT,
    International INT,
    P_Rank INT, 
    Team VARCHAR(35), 
    -- C_ID VARCHAR(4)  don't need this either, spine table for this
    Birth_date DATE
);

CREATE TABLE PlayersColleges (
    P_ID VARCHAR(8), 
    C_ID VARCHAR(4), 
    PRIMARY KEY (P_ID, C_ID), 
    FOREIGN KEY (P_ID) REFERENCES Players(P_ID),
    FOREIGN KEY (C_ID) REFERENCES College(C_ID)
);

CREATE TABLE PlayersStats (
    P_ID VARCHAR(8), 
    Stats_ID VARCHAR(4), 
    PRIMARY KEY (P_ID, Stats_ID), 
    FOREIGN KEY (P_ID) REFERENCES Players(P_ID),
    FOREIGN KEY (Stats_ID) REFERENCES Stats(Stats_ID)
);

-- add, delete, edit, modify and print reports (select), aggregate query

insert into College values ('DUKE', 'Duke University', 'Durham', 'North Carolina', 'Atlantic Coast Conference', 'NCAA D1');
insert into College values ('RUTG', 'Rutgers University', 'Piscataway', 'New Jersey', 'Big Ten Conference', 'NCAA D1');
insert into College values ('BAYL', 'Baylor University', 'Waco', 'Texas', 'Big 12 Conference', 'NCAA D1');
insert into College values ('TEXS', 'Texas A'||chr(38)||'M University', 'College Station', 'Texas', 'Southeastern Conference', 'NCAA D1');
insert into College values ('OKLS', 'Oklahoma State University', 'Stillwater', 'Oklahoma', 'Big 12 Conference', 'NCAA D1');
insert into College values ('LOYA', 'Loyola University Maryland', 'Baltimore', 'Maryland', 'Patriot League', 'NCAA D1');
insert into College values ('GEOS', 'Georgia Southern University', 'Statesboro', 'Georgia', 'Sun Belt Conference', 'NCAA D1');
insert into College values ('EASI', 'Eastern Illinois University', 'Charleston', 'Illinois', 'Ohio Valley Conference', 'NCAA D1');
insert into College values ('MICH', 'Michigan State University', 'East Lansing', 'Michigan', 'Big Ten Conference', 'NCAA D1');
insert into College values ('SOUH', 'South Carolina State University', 'Orangeburg', 'South Carolina', 'Mid-Eastern Athletic Conference', 'NCAA D1');
insert into College values ('UNEI', 'University of Connecticut', 'Storrs', 'Connecticut', 'Big East Conference', 'NCAA D1');
insert into College values ('BALL', 'Ball State University', 'Muncie', 'Indiana', 'Mid-American Conference', 'NCAA D1');
insert into College values('0000', 'International', '', '', '', '');
insert into College values ('GEOO', 'Georgetown University', 'Washington', 'District Of Columbia', 'Patriot League', 'NCAA D1');
insert into College values ('SAIS', 'Saint Josephs University', 'Philadelphia', 'Pennsylvania', 'Atlantic 10 Conference', 'NCAA D1');
insert into College values ('CENU', 'Central Michigan University', 'Mount Pleasant', 'Michigan', 'Mid-American Conference', 'NCAA D1');
insert into College values ('COLV', 'Colorado State University', 'Fort Collins', 'Colorado', 'Mountain West Conference', 'NCAA D1');
insert into College values ('FLOR', 'Florida A'||chr(38)||'M University', 'Tallahassee', 'Florida', 'Southwestern Athletic Conference', 'NCAA D1');
insert into College values ('ARIO', 'Arizona State University', 'Tempe', 'Arizona', 'Pacific-12 Conference', 'NCAA D1');
insert into College values ('ALAB', 'Alabama A'||chr(38)||'M University', 'Normal', 'Alabama', 'Southwestern Athletic Conference', 'NCAA D1');
insert into College values ('MARQ', 'Marquette University', 'Milwaukee', 'Wisconsin', 'Big East Conference', 'NCAA D1');
insert into College values ('AUBU', 'Auburn University', 'Auburn', 'Alabama', 'Southeastern Conference', 'NCAA D1');
insert into College values ('ARKN', 'Arkansas State University', 'Jonesboro', 'Arkansas', 'Sun Belt Conference', 'NCAA D1');
insert into College values ('CREI', 'Creighton University', 'Omaha', 'Nebraska', 'Big East Conference', 'NCAA D1');
insert into College values ('EASN', 'East Tennessee State University', 'Johnson City', 'Tennessee', 'Southern Conference', 'NCAA D1');
insert into College values ('SANG', 'San Diego State University', 'San Diego', 'California', 'Mountain West Conference', 'NCAA D1');
insert into College values ('HOUS', 'Houston Christian University', 'Houston', 'Texas', 'Southland Conference', 'NCAA D1');
insert into College values ('STAF', 'Stanford University', 'Stanford', 'California', 'Pacific-12 Conference', 'NCAA D1');
insert into College values ('NORC', 'North Carolina A'||chr(38)||'T State University', 'Greensboro', 'North Carolina', 'Mid-Eastern Athletic Conference', 'NCAA D1');
insert into College values ('TEXH', 'Texas Tech University', 'Lubbock', 'Texas', 'Big 12 Conference', 'NCAA D1');
insert into College values ('EASW', 'Eastern New Mexico University', 'Portales', 'New Mexico', 'Lone Star Conference', 'NCAA D2');
insert into College values ('VILL', 'Villanova University', 'Villanova', 'Pennsylvania', 'Big East Conference', 'NCAA D1');
insert into College values ('EASK', 'Eastern Kentucky University', 'Richmond', 'Kentucky', 'Asun Conference', 'NCAA D1');
insert into College values ('UNFI', 'University of Wisconsin', 'Madison', 'Wisconsin', 'Big Ten Conference', 'NCAA D1');
insert into College values ('PRIC', 'Princeton University', 'Princeton', 'New Jersey', 'Ivy League', 'NCAA D1');
insert into College values ('WAKE', 'Wake Forest University', 'Winston-Salem', 'North Carolina', 'Atlantic Coast Conference', 'NCAA D1');

insert into Players values ('00000000', 'Cooper Flagg', 'SF/PF', 81, 205, 0, 1, 'Duke', '2006-12-21');
insert into Players values ('00000001', 'Dylan Harper', 'PG/SG', 78, 220, 0, 2, 'Rutgers', '2006-03-02');
insert into Players values ('00000002', 'Ace Bailey', 'SF', 82, 200, 0, 3, 'Rutgers', '2006-08-13');
insert into Players values ('00000003', 'V.J. Edgecombe', 'SG', 77, 180, 0, 4, 'Baylor', '2005-07-30');
insert into Players values ('00000004', 'Tre Johnson', 'SG', 78, 184, 0, 5, 'Texas', '2006-03-07');
insert into Players values ('00000005', 'Kon Knueppel', 'SG/SF', 79, 217, 0, 6, 'Duke', '2005-08-03');
insert into Players values ('00000006', 'Khaman Maluach', 'C', 86, 250, 0, 7, 'Duke', '2006-09-14');
insert into Players values ('00000007', 'Jeremiah Fears', 'PG', 76, 182, 0, 8, 'Oklahoma', '2006-10-14');
insert into Players values ('00000008', 'Derik Queen', 'C', 82, 246, 0, 9, 'Maryland', '2004-12-27');
insert into Players values ('00000009', 'Asa Newell', 'PF', 82, 205, 0, 10, 'Georgia', '2005-10-05');
insert into Players values ('00000010', 'Kasparas Jakucionis', 'PG/SG', 78, 205, 0, 11, 'Illinois', '2006-05-29');
insert into Players values ('00000011', 'Jase Richardson', 'SG/PG', 75, 185, 0, 12, 'Michigan State', '2006-10-16');
insert into Players values ('00000012', 'Collin Murray-Boyles', 'PF', 79, 231, 0, 13, 'South Carolina', '2005-06-10');
insert into Players values ('00000013', 'Liam McNeeley', 'SF', 80, 185, 0, 14, 'UConn', '2005-10-10');
insert into Players values ('00000014', 'Egor Demin', 'PG/SG', 81, 190, 0, 15, 'BYU', '2006-03-03');
insert into Players values ('00000015', 'Noa Essengue', 'SF/PF', 81, 194, 1, 16, 'Ratiopharm Ulm (Germany)', '2006-12-18');
insert into Players values ('00000016', 'Nolan Traore', 'PG', 75, 175, 1, 17, 'Saint-Quentin (France)', '2006-05-28');
insert into Players values ('00000017', 'Thomas Sorber', 'PF/C', 82, 255, 0, 18, 'Georgetown', '2005-12-25');
insert into Players values ('00000018', 'Joan Beringer', 'C', 82, 230, 1, 19, 'KK Cedevita Junior (Croatia)', '2006-11-11');
insert into Players values ('00000019', 'Rasheer Fleming', 'PF', 81, 240, 0, 20, 'Saint Josephs', '2004-07-10');
insert into Players values ('00000020', 'Ben Saraf', 'PG/SG', 77, 200, 1, 21, 'Ratiopharm Ulm', '2006-04-14');
insert into Players values ('00000021', 'Danny Wolf', 'C', 84, 250, 0, 22, 'Michigan', '2004-05-04');
insert into Players values ('00000022', 'Will Riley', 'SG/SF', 80, 195, 0, 23, 'Illinois', '2006-02-10');
insert into Players values ('00000023', 'Nique Clifford', 'SG/SF', 78, 200, 0, 24, 'Colorado State', '2002-02-09');
insert into Players values ('00000024', 'Walter Clayton Jr.', 'PG', 75, 195, 0, 25, 'Florida', '2003-03-06');
insert into Players values ('00000025', 'Carter Bryant', 'SF/PF', 80, 225, 0, 26, 'Arizona', '2005-11-26');
insert into Players values ('00000026', 'Yaxel Lendeborg', 'PF', 81, 240, 0, 27, 'UAB', '2002-09-30');
insert into Players values ('00000027', 'Labaron Philon', 'PG', 76, 177, 0, 28, 'Alabama', '2005-11-24');
insert into Players values ('00000028', 'Kam Jones', 'PG/SG', 77, 200, 0, 29, 'Marquette', '2002-02-25');
insert into Players values ('00000029', 'Alex Condon', 'PF/C', 83, 230, 0, 30, 'Florida', '2004-07-25');
insert into Players values ('00000030', 'Johni Broome', 'PF/C', 82, 240, 0, 31, 'Auburn', '2002-07-19');
insert into Players values ('00000031', 'Noah Penda', 'SF', 79, 225, 1, 32, 'Le Mans Sarthe (France)', '2005-01-07');
insert into Players values ('00000032', 'Boogie Fland', 'PG', 74, 175, 0, 33, 'Arkansas', '2006-07-10');
insert into Players values ('00000033', 'Hugo González', 'SF', 78, 207, 1, 34, 'Real Madrid (Spain)', '2006-02-05');
insert into Players values ('00000034', 'Ryan Kalkbrenner', 'C', 86, 252, 0, 35, 'Creighton', '2002-01-17');
insert into Players values ('00000035', 'Bogoljub Marković', 'PF', 83, 190, 1, 36, 'KK Mega Basket (Serbia)', '2005-07-12');
insert into Players values ('00000036', 'Adou Thiero', 'SF/PF', 80, 220, 0, 37, 'Arkansas', '2004-05-08');
insert into Players values ('00000037', 'Chaz Lanier', 'SG', 77, 207, 0, 38, 'Tennessee', '2001-12-19');
insert into Players values ('00000038', 'Tahaad Pettiford', 'PG', 73, 175, 0, 39, 'Auburn', '2005-08-04');
insert into Players values ('00000039', 'Isaiah Evans', 'SF', 78, 175, 0, 40, 'Duke', '2005-12-06');
insert into Players values ('00000040', 'Miles Byrd', 'SG', 79, 190, 0, 41, 'San Diego State', '2004-09-08');
insert into Players values ('00000041', 'Milos Uzan', 'PG', 76, 190, 0, 42, 'Houston', '2002-12-26');
insert into Players values ('00000042', 'Maxime Raynaud', 'C', 85, 245, 0, 43, 'Stanford', '2003-04-07');
insert into Players values ('00000043', 'Alex Toohey', 'SF', 80, 223, 1, 44, 'Sydney (NBL)', '2004-05-04');
insert into Players values ('00000044', 'Rocco Zikarsky', 'C', 87, 227, 1, 45, 'Brisbane (NBL)', '2006-07-10');
insert into Players values ('00000045', 'Drake Powell', 'SG', 77, 185, 0, 46, 'North Carolina', '2005-09-08');
insert into Players values ('00000046', 'Darrion Williams', 'SF', 78, 225, 0, 47, 'Texas Tech', '2003-04-23');
insert into Players values ('00000047', 'Sion James', 'SF', 78, 220, 0, 48, 'Duke', '2002-12-04');
insert into Players values ('00000048', 'Dink Pate', 'SF', 80, 210, 0, 49, 'Mexico City', '2006-03-10');
insert into Players values ('00000049', 'Michael Ruzic', 'PF', 82, 220, 1, 50, 'Joventut (Spain)', '2006-10-04');
insert into Players values ('00000050', 'Tyrese Proctor', 'PG', 77, 183, 0, 51, 'Duke', '2004-04-01');
insert into Players values ('00000051', 'Eric Dixon', 'PF', 80, 265, 0, 52, 'Villanova', '2001-01-26');
insert into Players values ('00000052', 'Hansen Yang', 'C', 85, 249, 1, 53, 'Qingdao (China)', '2005-06-26');
insert into Players values ('00000053', 'Koby Brea', 'SG', 79, 215, 0, 54, 'Kentucky', '2002-11-06');
insert into Players values ('00000054', 'JoJo Tugler', 'PF', 80, 230, 0, 55, 'Houston', '2005-05-16');
insert into Players values ('00000055', 'John Tonje', 'SG', 77, 218, 0, 56, 'Wisconsin', '2001-04-23');
insert into Players values ('00000056', 'Alijah Martin', 'SG', 74, 210, 0, 57, 'Florida', '2001-12-26');
insert into Players values ('00000057', 'Xaivian Lee', 'PG', 76, 180, 0, 58, 'Princeton', '2004-03-12');
insert into Players values ('00000058', 'Hunter Sallis', 'SG/PG', 77, 179, 0, 59, 'Wake Forest', '2003-03-26');

insert into Stats values ('00000000', 37, 30.7, 6.5, 13.4, .481, 1.4, 3.6, .385, 4.8, 5.8, .840, 7.5, 4.2, 1.4, 1.4, 2.1, 1.9, 19.2, .593, .533, .272, .429, .367, 30.9, 0.87, 2.00);
insert into Stats values ('00000001', 29, 32.6, 6.7, 13.8, .484, 1.7, 5.2, .333, 4.3, 5.8, .750, 4.6, 4.0, 0.6, 1.4, 2.4, 1.9, 19.4, .587, .546, .374, .419, .357, 29.0, 0.93, 1.67);
insert into Stats values ('00000002', 30, 33.3, 6.8, 14.7, .460, 1.6, 4.5, .346, 2.5, 3.6, .692, 7.2, 1.3, 1.3, 1.0, 2.0, 2.8, 17.6, .536, .514, .308, .243, .346, 27.5, 0.30, 0.62);
insert into Stats values ('00000003', 33, 32.7, 5.0, 11.5, .436, 1.6, 4.6, .340, 3.4, 4.3, .782, 5.6, 3.2, 0.6, 2.1, 1.9, 2.5, 15.0, .552, .504, .402, .373, .359, 24.1, 0.80, 1.66);
insert into Stats values ('00000004', 33, 34.7, 6.8, 15.9, .427, 2.7, 6.8, .397, 3.7, 4.2, .871, 3.1, 2.7, 0.3, 0.9, 1.8, 2.1, 19.9, .557, .511, .427, .265, .390, 29.1, 0.57, 1.50);
insert into Stats values ('00000005', 39, 30.5, 4.6, 9.7, .479, 2.2, 5.3, .406, 3.0, 3.3, .914, 4.0, 2.7, 0.2, 1.0, 1.4, 2.1, 14.4, .642, .590, .548, .339, .392, 21.4, 0.73, 2.02);
insert into Stats values ('00000006', 39, 21.2, 3.5, 4.9, .712, 0.1, 0.4, .250, 1.5, 2.0, .766, 6.6, 0.5, 1.3, 0.2, 0.8, 2.1, 8.6, .736, .723, .084, .403, .325, 16.1, 0.27, 0.67);
insert into Stats values ('00000007', 34, 30.2, 5.3, 12.2, .434, 1.1, 3.9, .284, 5.4, 6.3, .851, 4.1, 4.1, 0.1, 1.6, 3.4, 1.9, 17.1, .562, .480, .323, .518, .360, 31.5, 0.91, 1.21);
insert into Stats values ('00000008', 36, 30.4, 5.8, 11.1, .526, 0.2, 1.0, .200, 4.6, 6.1, .766, 9.0, 1.9, 1.1, 1.1, 2.4, 2.1, 16.5, .591, .535, .088, .546, .324, 26.6, 0.44, 0.79);
insert into Stats values ('00000009', 33, 29.0, 5.8, 10.7, .543, 0.8, 2.7, .292, 3.1, 4.1, .748, 6.9, 0.9, 1.0, 1.0, 1.1, 2.4, 15.4, .612, .580, .253, .384, .339, 23.5, 0.29, 0.78);
insert into Stats values ('00000010', 33, 31.8, 4.5, 10.3, .440, 1.6, 5.2, .318, 4.3, 5.1, .845, 5.7, 4.7, 0.3, 0.9, 3.7, 2.7, 15.0, .590, .519, .501, .496, .369, 24.2, 1.07, 1.27);
insert into Stats values ('00000011', 36, 25.3, 4.0, 8.1, .493, 1.3, 3.2, .412, 2.8, 3.4, .836, 3.3, 1.9, 0.3, 0.8, 0.8, 1.5, 12.1, .624, .574, .390, .418, .370, 20.6, 0.70, 2.27);
insert into Stats values ('00000012', 32, 30.6, 6.2, 10.6, .586, 0.3, 1.1, .265, 4.2, 5.9, .707, 8.3, 2.4, 1.3, 1.5, 2.4, 2.6, 16.8, .630, .599, .101, .556, .321, 26.7, 0.79, 0.99);
insert into Stats values ('00000013', 27, 32.1, 4.4, 11.5, .381, 1.7, 5.4, .317, 4.1, 4.7, .866, 6.0, 2.3, 0.2, 0.6, 1.9, 2.0, 14.5, .529, .455, .468, .410, .373, 25.6, 0.51, 1.22);
insert into Stats values ('00000014', 33, 27.5, 3.8, 9.3, .412, 1.3, 4.7, .273, 1.7, 2.5, .695, 3.9, 5.5, 0.4, 1.2, 2.9, 1.2, 10.6, .509, .480, .503, .268, .344, 24.5, 1.41, 1.86);
insert into Stats values ('00000015', 18, 23.7, 3.9, 6.9, .560, 0.6, 1.9, .294, 4.1, 5.6, .730, 5.3, 1.1, 0.6, 1.4, 1.0, 2.6, 12.4, .646, .600, .272, .800, .335, Null, Null, 1.11);
insert into Stats values ('00000016', 40, 23.0, 4.2, 10.3, .409, 1.2, 3.9, .314, 2.3, 3.1, .728, 1.9, 4.8, 0.1, 0.7, 2.5, 2.2, 12.0, .506, .469, .378, .303, .354, 29.6, 1.45, 1.91);
insert into Stats values ('00000017', 24, 31.3, 5.5, 10.4, .532, 0.3, 1.5, .162, 3.2, 4.4, .724, 8.5, 2.4, 2.0, 1.5, 2.3, 2.2, 14.5, .580, .544, .148, .420, .318, 23.6, 0.66, 1.07);
insert into Stats values ('00000018', 53, 18.0, 2.0, 3.3, .615, 0.0, 0.0, 0, 1.0, 1.7, .584, 4.6, 0.4, 1.4, 0.5, 0.6, 2.3, 5.0, .615, .615, .000, .511, .301, 12.1, 0.28, 0.65);
insert into Stats values ('00000019', 35, 31.3, 5.4, 10.1, .531, 1.8, 4.5, .390, 2.1, 2.9, .743, 8.5, 1.3, 1.5, 1.4, 1.5, 2.5, 14.7, .638, .619, .449, .285, .360, 21.2, 0.40, 0.81);
insert into Stats values ('00000020', 45, 23.5, 4.6, 10.2, .455, 0.7, 2.3, .286, 2.3, 3.2, .727, 2.6, 4.3, 0.3, 1.2, 2.7, 2.3, 12.2, .524, .488, .230, .313, .337, 27.8, 1.17, 1.58);
insert into Stats values ('00000021', 37, 30.5, 5.0, 10.1, .497, 1.0, 3.1, .336, 2.1, 3.6, .594, 9.7, 3.6, 1.4, 0.7, 3.2, 2.1, 13.2, .559, .548, .302, .356, .324, 24.2, 0.94, 1.10);
insert into Stats values ('00000022', 35, 25.7, 4.4, 10.3, .432, 1.3, 4.1, .326, 2.4, 3.3, .724, 4.1, 2.2, 0.3, 0.3, 1.2, 1.2, 12.6, .532, .497, .401, .323, .353, 23.8, 0.68, 1.86);
insert into Stats values ('00000023', 36, 35.4, 6.6, 13.3, .496, 1.8, 4.9, .377, 3.9, 5.0, .777, 9.6, 4.4, 0.6, 1.2, 2.6, 2.4, 18.9, .603, .565, .365, .373, .361, 27.7, 0.97, 1.72);
insert into Stats values ('00000024', 39, 32.6, 6.0, 13.4, .448, 3.0, 7.8, .386, 3.2, 3.7, .875, 3.7, 4.2, 0.5, 1.2, 2.4, 1.9, 18.3, .602, .560, .578, .275, .398, 25.6, 0.91, 1.73);
insert into Stats values ('00000025', 37, 19.3, 2.2, 4.8, .460, 1.1, 2.8, .371, 1.1, 1.6, .695, 4.1, 1.0, 1.0, 0.9, 1.0, 2.3, 6.5, .593, .571, .597, .335, .352, 16.4, 0.51, 0.97);
insert into Stats values ('00000026', 37, 33.6, 6.4, 12.3, .522, 0.7, 1.9, .357, 4.1, 5.5, .757, 11.4, 4.2, 1.8, 1.7, 2.2, 2.5, 17.7, .592, .549, .154, .443, .339, 23.9, 0.95, 1.96);
insert into Stats values ('00000027', 37, 24.7, 3.8, 8.5, .452, 1.1, 3.4, .315, 1.9, 2.4, .767, 3.3, 3.8, 0.3, 1.4, 1.7, 1.7, 10.6, .549, .514, .395, .287, .353, 20.9, 1.19, 2.19);
insert into Stats values ('00000028', 34, 33.8, 7.8, 16.2, .483, 1.9, 6.1, .311, 1.7, 2.6, .648, 4.5, 5.9, 0.3, 1.4, 1.9, 2.2, 19.2, .551, .541, .374, .160, .345, 28.9, 1.32, 3.17);
insert into Stats values ('00000029', 37, 24.9, 3.6, 7.4, .493, 0.5, 1.6, .328, 2.8, 4.6, .604, 7.5, 2.2, 1.3, 0.9, 1.4, 2.3, 10.6, .552, .527, .212, .617, .317, 20.8, 0.72, 1.61);
insert into Stats values ('00000030', 36, 30.2, 7.3, 14.3, .510, 0.7, 2.5, .278, 3.3, 5.6, .587, 10.8, 2.9, 2.1, 0.9, 1.6, 2.1, 18.6, .547, .534, .174, .390, .315, 30.4, 0.64, 1.82);
insert into Stats values ('00000031', 28, 26.6, 3.4, 7.6, .449, 1.0, 3.1, .314, 2.4, 3.5, .680, 5.0, 2.6, 0.4, 1.4, 1.7, 2.1, 10.2, .548, .512, .402, .453, .337, null, null, 1.52);
insert into Stats values ('00000032', 21, 31.8, 4.6, 12.0, .379, 1.7, 5.0, .340, 2.6, 3.1, .833, 3.2, 5.1, 0.0, 1.5, 1.4, 1.8, 13.5, .498, .451, .419, .261, .369, 23.6, 1.29, 3.72);
insert into Stats values ('00000033', 52, 10.4, 1.1, 2.7, .403, 0.3, 1.2, .270, 0.6, 0.9, .717, 1.8, 0.6, 0.3, 0.2, 0.7, 1.8, 3.1, .504, .464, .453, .331, .337, null, null, 0.86);
insert into Stats values ('00000034', 35, 34.5, 7.7, 11.9, .653, 0.6, 1.7, .344, 3.1, 4.6, .681, 8.7, 1.5, 2.7, 0.5, 1.5, 1.4, 19.2, .684, .678, .147, .386, .326, 23.6, 0.42, 1.06);
insert into Stats values ('00000035', 30, 29.4, 4.7, 8.8, .538, 1.0, 2.7, .370, 3.3, 4.3, .760, 6.8, 2.7, 0.8, 0.8, 2.7, 3.4, 13.7, .633, .595, .307, .489, .348, null, null, 0.98);
insert into Stats values ('00000036', 27, 27.5, 5.1, 9.4, .545, 0.4, 1.6, .256, 4.4, 6.5, .686, 5.8, 1.9, 0.7, 1.6, 1.7, 2.6, 15.1, .605, .567, .170, .692, .322, 25.8, 0.54, 1.11);
insert into Stats values ('00000037', 38, 31.4, 6.4, 14.8, .431, 3.2, 8.2, .395, 2.0, 2.6, .758, 3.9, 1.1, 0.1, 0.9, 1.1, 1.6, 18.0, .560, .540, .551, .176, .389, 28.8, 0.27, 0.95);
insert into Stats values ('00000038', 38, 22.9, 3.8, 9.1, .421, 1.8, 5.0, .366, 2.1, 2.6, .804, 2.2, 3.0, 0.2, 0.9, 1.6, 2.4, 11.6, .560, .522, .550, .280, .382, 25.9, 0.89, 1.82);
insert into Stats values ('00000039', 36, 13.8, 2.2, 5.1, .432, 1.7, 4.1, .416, 0.7, 0.9, .812, 1.1, 0.5, 0.1, 0.2, 0.4, 0.9, 6.8, .621, .601, .814, .175, .410, 22.4, 0.29, 1.12);
insert into Stats values ('00000040', 30, 30.1, 3.9, 10.3, .381, 1.8, 5.9, .301, 2.6, 3.2, .832, 4.4, 2.7, 1.1, 2.1, 1.6, 2.1, 12.3, .518, .466, .568, .306, .371, 23.3, 0.78, 1.74);
insert into Stats values ('00000041', 40, 31.5, 4.3, 9.6, .453, 1.6, 3.6, .428, 1.2, 1.5, .783, 3.1, 4.3, 0.1, 0.9, 1.4, 2.0, 11.4, .554, .534, .380, .157, .362, 19.7, 1.31, 2.98);
insert into Stats values ('00000042', 35, 33.5, 7.5, 16.1, .467, 1.9, 5.5, .347, 3.3, 4.2, .770, 10.6, 1.7, 1.4, 0.9, 2.4, 2.0, 20.2, .558, .527, .343, .263, .363, 31.5, 0.38, 0.69);
insert into Stats values ('00000043', 32, 23.5, 4.0, 8.6, .465, 1.0, 2.9, .340, 2.4, 3.2, .738, 3.8, 1.3, 0.8, 1.4, 1.1, 1.7, 11.4, .562, .524, .342, .375, .349, 20.4, 0.46, 1.23);
insert into Stats values ('00000044', 20, 12.2, 1.8, 3.6, .500, 0.1, 0.3, .200, 1.0, 1.6, .625, 3.5, 0.3, 0.7, 0.3, 0.6, 1.3, 4.7, .533, .507, .069, .444, .309, 17.1, 0.20, 0.50);
insert into Stats values ('00000045', 37, 25.6, 2.8, 5.7, .483, 1.0, 2.6, .379, 0.9, 1.5, .648, 3.4, 1.1, 0.7, 0.7, 0.7, 1.8, 7.4, .581, .569, .450, .256, .336, 13.8, 0.51, 1.48);
insert into Stats values ('00000046', 34, 30.0, 5.5, 12.5, .439, 1.4, 4.1, .340, 2.7, 3.2, .836, 5.5, 3.6, 0.4, 1.3, 1.9, 2.2, 15.1, .538, .495, .333, .259, .365, 27.0, 0.86, 1.92);
insert into Stats values ('00000047', 39, 25.5, 2.9, 5.6, .516, 0.8, 1.9, .413, 2.1, 2.6, .810, 4.2, 2.9, 0.3, 0.8, 1.2, 2.0, 8.6, .635, .588, .346, .461, .355, 16.2, 1.17, 2.45);
insert into Stats values ('00000048', 34, 26.9, 4.0, 9.8, .407, 0.9, 3.5, .258, 0.7, 1.3, .581, 5.2, 1.9, 0.1, 0.6, 1.7, 2.0, 10.1, .485, .453, .361, .130, .320, 20.4, 0.52, 1.09);
insert into Stats values ('00000049', 23, 12.3, 1.3, 2.7, .492, 0.3, 1.1, .240, 0.3, 0.8, .316, 1.6, 0.2, 0.3, 0.2, 0.3, 1.7, 3.2, .514, .540, .397, .302, .275, null, null, 0.67);
insert into Stats values ('00000050', 38, 29.9, 4.3, 9.6, .452, 2.3, 5.8, .405, 1.3, 2.0, .680, 3.0, 2.2, 0.1, 0.8, 1.1, 1.9, 12.4, .587, .574, .603, .205, .364, 20.1, 0.64, 2.12);
insert into Stats values ('00000051', 35, 34.8, 7.7, 17.1, .451, 2.9, 7.2, .407, 5.0, 6.1, .813, 5.1, 1.9, 0.3, 0.8, 2.1, 2.0, 23.3, .583, .537, .424, .358, .386, 34.7, 0.38, 0.89);
insert into Stats values ('00000052', 53, 33.0, 6.3, 10.6, .595, 0.3, 1.1, .286, 3.2, 4.7, .677, 10.0, 2.8, 2.7, 0.9, 3.1, 3.2, 16.2, .627, .609, .099, .446, .318, 21.4, 0.65, 0.91);
insert into Stats values ('00000053', 36, 28.1, 4.1, 8.7, .470, 2.6, 5.9, .435, 0.9, 1.0, .914, 3.2, 1.3, 0.3, 0.5, 0.5, 1.3, 11.6, .636, .618, .684, .112, .405, 16.7, 0.48, 2.82);
insert into Stats values ('00000054', 40, 21.7, 2.3, 4.3, .523, 0.1, 0.3, .273, 0.9, 1.6, .538, 5.9, 0.9, 1.9, 1.0, 1.0, 3.1, 5.5, .537, .532, .064, .378, .297, 14.8, 0.52, 0.97);
insert into Stats values ('00000055', 37, 31.1, 5.5, 11.9, .465, 2.3, 5.9, .388, 6.2, 6.9, .909, 5.3, 1.8, 0.2, 0.7, 1.8, 1.7, 19.6, .647, .562, .499, .579, .392, 28.0, 0.42, 0.99);
insert into Stats values ('00000056', 38, 30.4, 5.0, 11.0, .452, 2.1, 5.9, .350, 2.3, 3.1, .761, 4.5, 2.2, 0.2, 1.5, 1.4, 1.4, 14.4, .576, .547, .541, .280, .368, 21.7, 0.57, 1.49);
insert into Stats values ('00000057', 30, 32.1, 6.0, 13.6, .439, 2.0, 5.4, .366, 3.0, 3.8, .789, 6.1, 5.5, 0.4, 1.2, 2.2, 2.2, 16.9, .549, .511, .395, .279, .368, 28.1, 1.29, 2.46);
insert into Stats values ('00000058', 32, 35.9, 6.6, 14.4, .457, 1.3, 4.8, .277, 3.7, 4.6, .804, 5.1, 2.8, 0.5, 1.2, 2.4, 2.3, 18.3, .549, .503, .335, .320, .353, 27.7, 0.65, 1.15);

select * from stats;
select * from players;
select * from college;

-- Output Query for players example
-- add, delete, edit, modify and print reports (select), aggregate query
insert into players values ('LAYNLENK', 'Layne Lenkowski', 'PF', 68, 240, 0, 61, 'Villanova', '2003-03-15');
insert into players values ('BENONEI', 'Ben O''Neil', 'SF', 69, 190, 0, 62, 'Villanova', '2003-03-15');
insert into players values ('MELISILV', 'Melissa Silva', 'PG', 65, 165, 0, 63, 'Villanova', '2003-03-15');
insert into players values ('DUDEGUY', 'Dude Guy', 'C', 59, 100, 1, 64, 'Germany', '2000-01-01');
insert into stats values ('LAYNLENK', 45, 22, 4, 7, 0.57, 1, 2, 0.5, 2, 3, 0.67, 2, 2, 1, 1, 1, 3, 10, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5);

update players
set height_in_inches = 78
where P_ID = 'LAYNLENK';

select * from players;

delete from players where P_ID = 'DUDEGUY';

select * from players;

select * from stats where points_per_game = (select max(points_per_game) from stats);

select * from college;
SELECT * FROM Stats;