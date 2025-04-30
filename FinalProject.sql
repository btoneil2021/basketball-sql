-- Layne Lenkowski, Mel, Ben O'Neil
-- Final Project - College Basketball Report

CREATE TABLE College (
    C_ID VARCHAR(4) PRIMARY KEY NOT NULL,
    College_Name VARCHAR(35),
    College_State VARCHAR(20), 
    Conference VARCHAR(4),
    DIV VARCHAR(3) -- 
);

CREATE TABLE Positions (
    Pos_ID VARCHAR(4) PRIMARY KEY NOT NULL, 
    Position_Name VARCHAR(35), 
    Num_Players VARCHAR(3)
);

CREATE TABLE Players (
    P_ID VARCHAR(8) PRIMARY KEY NOT NULL, 
    P_Name VARCHAR(30),
    P_Position VARCHAR(15), 
    Pos_ID VARCHAR(4), 
    Height VARCHAR(4), 
    Weight INT,
    P_PTS DECIMAL(4,2), 
    P_Rebounds DECIMAL(3,2), 
    P_Assists DECIMAL(3,2), 
    P_Steals DECIMAL(3,2),
    P_Blocks DECIMAL(3,2), 
    P_Rank INT, 
    College VARCHAR(35), 
    C_ID VARCHAR(4), 
    Start_date DATE, 
    FOREIGN KEY (C_ID) REFERENCES College(C_ID), 
    FOREIGN KEY (Pos_ID) REFERENCES Positions(Pos_ID) 
);

CREATE TABLE PlayersColleges (
    P_ID VARCHAR(8), 
    C_ID VARCHAR(4), 
    PRIMARY KEY (P_ID, C_ID), 
    FOREIGN KEY (P_ID) REFERENCES Players(P_ID),
    FOREIGN KEY (C_ID) REFERENCES College(C_ID)
);

CREATE TABLE PlayersPosition (
    P_ID VARCHAR(8), 
    Pos_ID VARCHAR(4), 
    PRIMARY KEY (P_ID, Pos_ID), 
    FOREIGN KEY (P_ID) REFERENCES Players(P_ID),
    FOREIGN KEY (Pos_ID) REFERENCES Positions(Pos_ID)
);