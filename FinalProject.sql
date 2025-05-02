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
    College_State VARCHAR(20), 
    Conference VARCHAR(30),
    DIV VARCHAR(3)
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
    Height INT, 
    Weight INT,
    International INT,
    P_Rank INT, 
    Team VARCHAR(35), 
    C_ID VARCHAR(4), 
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

-- Output Query for players example
INSERT INTO Stats VALUES ('0000001', 33, 29.0, 5.8, 10.7, .543, 0.8, 2.7, .292, 3.1, 4.1, .748, 6.9, 0.9, 1.0, 1.0, 1.1, 2.4, 15.4, .612, .580, .253, .384, .339, 23.5, 0.29, 0.78);

SELECT * FROM Stats;