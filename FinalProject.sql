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
    Conference VARCHAR(4),
    DIV VARCHAR(3)
);

CREATE TABLE Stats (
    Stats_ID VARCHAR(4) PRIMARY KEY NOT NULL, 
    Player_Name VARCHAR(30), 
    P_PTS DECIMAL(4,2), 
    P_Rebounds DECIMAL(3,2), 
    P_Assists DECIMAL(3,2), 
    P_Steals DECIMAL(3,2),
    P_Blocks DECIMAL(3,2), 
);

CREATE TABLE Players (
    P_ID VARCHAR(8) PRIMARY KEY NOT NULL, 
    P_Name VARCHAR(30),
    P_Position VARCHAR(15), 
    Pos_ID VARCHAR(4), 
    Height VARCHAR(4), 
    Weight INT,

    P_Rank INT, 
    College VARCHAR(35), 
    C_ID VARCHAR(4), 
    Start_date DATE, 
    FOREIGN KEY (C_ID) REFERENCES College(C_ID), 
    FOREIGN KEY (Pos_ID) REFERENCES Positions(Pos_ID) 
);

CREATE TABLE Stats (
    Stats_ID VARCHAR(8) PRIMARY KEY NOT NULL,
    Player_Name VARCHAR(30), 

    -- 2024-2025 Per Game Averages
    Games_Played INT,               
    Minutes_Per_Game DECIMAL(4,1),     
    FGM INT,                          
    FGA INT,                          
    FG_Percentage DECIMAL(4,3),        -- FG%
    Three_PM INT,                      -- 3-Pointers Made (from 3PM-3PA)
    Three_PA INT,                      -- 3-Pointers Attempted (from 3PM-3PA)
    Three_P_Percentage DECIMAL(4,3),   -- 3P%
    FTM INT,                           -- Free Throws Made (from FTM-FTA)
    FTA INT,                           -- Free Throws Attempted (from FTM-FTA)
    FT_Percentage DECIMAL(4,3),        -- FT%
    Rebounds DECIMAL(4,1),             -- REB (Average)
    Assists DECIMAL(4,1),              -- AST (Average)
    Blocks DECIMAL(3,1),               -- BLK (Average)
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
    Assists_To_Turnovers_Ratio DECIMAL(4,2), -- AST/TO

    -- Foreign Key constraint linking Stats directly to Players
    FOREIGN KEY (P_ID) REFERENCES Players(P_ID)
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
    FOREIGN KEY (Stats_ID) REFERENCES Positions(Stats_ID)
);