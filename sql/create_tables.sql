/*
This script creates all the tables required for the IPL database.
*/


--Create the venue table

CREATE TABLE venue
(
venue_id INTEGER NOT NULL PRIMARY KEY,
venue_name VARCHAR(200) NOT NULL UNIQUE
);

--Create the team table

CREATE TABLE team
(
team_id INTEGER NOT NULL PRIMARY KEY,
team_name VARCHAR(100) NOT NULL UNIQUE
);

--Create the player table

CREATE TABLE player
(
player_id INTEGER NOT NULL PRIMARY KEY,
player_name VARCHAR(100) NOT NULL,
team_id INTEGER NOT NULL,
FOREIGN KEY(team_id) REFERENCES team(team_id)
);

--Create the match table

CREATE TABLE match
(    match_id    INTEGER NOT NULL PRIMARY KEY,
     match_date    VARCHAR(10)  NOT NULL ,
     venue_id      INTEGER NOT NULL ,
     FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

--Create the innings table

CREATE TABLE innings
(    match_id    INTEGER NOT NULL,
     innings_no   INTEGER NOT NULL,
     batting_team_id    INTEGER  NOT NULL,
     bowling_team_id   INTEGER NOT NULL,
     PRIMARY KEY (match_id, innings_no),
     FOREIGN KEY (match_id) REFERENCES match(match_id),
     FOREIGN KEY (batting_team_id) REFERENCES team(team_id),
     FOREIGN KEY (bowling_team_id) REFERENCES team(team_id)
);

--Create the score_by_ball table

CREATE TABLE score_by_ball
(   match_id    INTEGER ,
    innings_no   INTEGER ,
    ball_no    FLOAT ,
    striker_id   INTEGER  ,
    non_striker_id   INTEGER  ,
    bowler_id    INTEGER ,
    runs_off_bat    INTEGER ,
    extras    INTEGER ,
    wides   INTEGER ,
    noballs   INTEGER ,
    byes    INTEGER ,
    legbyes   INTEGER ,
    penalty   INTEGER ,
    wicket_type   VARCHAR(200)  ,
    dismissed_player_id    INTEGER,
    PRIMARY KEY (match_id, innings_no, ball_no),
    FOREIGN KEY (match_id, innings_no) REFERENCES innings(match_id, innings_no),
    FOREIGN KEY (striker_id) REFERENCES player(player_id),
    FOREIGN KEY (non_striker_id) REFERENCES player(player_id),
    FOREIGN KEY (bowler_id) REFERENCES player(player_id),
    FOREIGN KEY (dismissed_player_id) REFERENCES player(player_id)
);

--Create the result table

CREATE TABLE result
(    match_id    INTEGER NOT NULL PRIMARY KEY,
     winning_team_id INTEGER NOT NULL,         
     player_of_the_match_id   INTEGER NOT NULL ,
     FOREIGN KEY (match_id) REFERENCES match(match_id),
     FOREIGN KEY (winning_team_id) REFERENCES team(team_id)
     FOREIGN KEY (player_of_the_match_id) REFERENCES player(player_id)
);









 