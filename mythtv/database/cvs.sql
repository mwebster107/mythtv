USE mythconverg;

ALTER TABLE cardinput ADD tunechan CHAR(5) NOT NULL;
ALTER TABLE cardinput ADD startchan CHAR(5) NOT NULL;

ALTER TABLE channel ADD COLUMN contrast INT DEFAULT 32768;
ALTER TABLE channel ADD COLUMN brightness INT DEFAULT 32768;
ALTER TABLE channel ADD COLUMN colour INT DEFAULT 32768;

CREATE TABLE IF NOT EXISTS programrating
(
    chanid INT UNSIGNED NOT NULL,
    starttime TIMESTAMP NOT NULL,
    system CHAR(8) NOT NULL default '',
    rating CHAR(8) NOT NULL default '',
    UNIQUE KEY chanid (chanid,starttime,system,rating),
    INDEX (starttime, system)
);

ALTER TABLE program ADD airdate year NOT NULL;
ALTER TABLE program ADD stars float unsigned NOT NULL;

CREATE TABLE IF NOT EXISTS recordedmarkup
(
    chanid INT UNSIGNED NOT NULL,
    starttime TIMESTAMP NOT NULL,
    mark BIGINT(20) NOT NULL,
    type INT NOT NULL,
    primary key (chanid,starttime, mark, type )
);

CREATE TABLE favorites (
    favid int(11) unsigned NOT NULL auto_increment,
    userid int(11) unsigned NOT NULL default '0',
    chanid int(11) unsigned NOT NULL default '0',
    PRIMARY KEY (favid)
);

ALTER TABLE settings DROP PRIMARY KEY;
ALTER TABLE settings ADD INDEX(value, hostname);
ALTER TABLE capturecard ADD COLUMN defaultinput VARCHAR(32) DEFAULT 'Television';

ALTER TABLE recorded ADD COLUMN bookmark VARCHAR(128) NULL;
ALTER TABLE recorded ADD COLUMN editing INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE recorded ADD COLUMN cutlist TEXT NULL;
ALTER TABLE capturecard ADD COLUMN vbidevice VARCHAR(255);
REPLACE INTO settings (value, data) VALUES ("LCDHost","localhost");
REPLACE INTO settings (value, data) VALUES ("LCDPort","13666");

ALTER TABLE record MODIFY starttime TIME NOT NULL;
ALTER TABLE record MODIFY startdate DATE NOT NULL;
ALTER TABLE record MODIFY endtime TIME NOT NULL;
ALTER TABLE record MODIFY enddate DATE NOT NULL;
