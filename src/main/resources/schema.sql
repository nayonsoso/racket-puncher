SET
FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS SITE_USER;
DROP TABLE IF EXISTS MATCHING;
DROP TABLE IF EXISTS AUTH_DATA;
DROP TABLE IF EXISTS APPLY;
DROP TABLE IF EXISTS NOTIFICATION;
DROP TABLE IF EXISTS MANNER_SCORE;
DROP TABLE IF EXISTS PENALTY_SCORE;
DROP TABLE IF EXISTS REVIEW;

CREATE TABLE `SITE_USER`
(
    `ID`                BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `PASSWORD`          VARCHAR(1023) NOT NULL COMMENT '암호화해야함',
    `NICKNAME`          varchar(50)   NOT NULL COMMENT '숫자와 문자로만',
    `EMAIL`             varchar(255)  NOT NULL,
    `PHONE_NUMBER`      varchar(50)   NOT NULL,
    `MANNER_SCORE`      INT NULL DEFAULT 0,
    `PENALTY_SCORE`     INT NULL DEFAULT 0,
    `GENDER`            varchar(50)   NOT NULL COMMENT 'MALE, FEMALE',
    `NTRP`              VARCHAR(50)   NOT NULL,
    `ADDRESS`           varchar(255)  NOT NULL,
    `ZIPCODE`           varchar(50)   NOT NULL,
    `AGE_GROUP`         varchar(50)   NOT NULL COMMENT 'TWENTIES, THIRTIES , FORTIES , SENIOR',
    `PROFILE_IMG`       varchar(1023) NULL,
    `CREATE_DATE`       TIMESTAMP     NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS',
    `IS_PHONE_VERIFIED` BOOL NULL DEFAULT 0 COMMENT 'true = 1 / false = 0',
    `ROLES`             varchar(50)
);

CREATE TABLE `MATCHING`
(
    `ID`               BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `SITE_USER_ID`     BIGINT       NOT NULL,
    `TITLE`            varchar(50)  NOT NULL,
    `CONTENT`          varchar(1023) NULL,
    `LOCATION`         varchar(255) NOT NULL,
    `LAT` DOUBLE NOT NULL COMMENT '위도',
    `LON` DOUBLE NOT NULL COMMENT '경도',
    `LOCATION_IMG`     varchar(1023) NULL,
    `DATE`             DATE         NOT NULL COMMENT 'YYYY-MM-DD',
    `START_TIME`       TIME         NOT NULL COMMENT 'HH:MM:SS',
    `END_TIME`         TIME         NOT NULL COMMENT 'HH:MM:SS',
    `RECRUIT_DUE_DATE` TIMESTAMP    NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS',
    `RECRUIT_NUM`      INT          NOT NULL,
    `COST`             INT          NOT NULL,
    `IS_RESERVED`      BOOL        DEFAULT 0 COMMENT 'true = 1 / false = 0',
    `NTRP`             VARCHAR(50)  NOT NULL,
    `AGE`              VARCHAR(50)  NOT NULL,
    `RECRUIT_STATUS`   VARCHAR(50) DEFAULT 'OPEN',
    `CREATE_TIME`      TIMESTAMP COMMENT 'YYYY-MM-DD HH:MM:SS',
    `MATCHING_TYPE`    VARCHAR(50)  NOT NULL COMMENT 'SINGLE, DOUBLE, MIXED_DOUBLE, OTHER',
    `CONFIRMED_NUM`    INT         DEFAULT 1
);

CREATE TABLE `AUTH_DATA`
(
    `ID`            BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `REFRESH_TOKEN` VARCHAR(1023) NULL COMMENT '유효시간 14시간',
    `SITE_USER_ID`  BIGINT NOT NULL
);

CREATE TABLE `APPLY`
(
    `ID`           BIGINT                        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `MATCHING_ID`  BIGINT                        NOT NULL,
    `SITE_USER_ID` BIGINT                        NOT NULL,
    `CREATE_TIME`  TIMESTAMP                     NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS',
    `APPLY_STATUS`       VARCHAR(50) DEFAULT 'PENDING' NOT NULL COMMENT 'PENDING, ACCEPTED, CANCELED'
);

CREATE TABLE `NOTIFICATION`
(
    `ID`                BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `SITE_USER_ID`      VARCHAR(255) NOT NULL,
    `MATCHING_ID`       BIGINT NULL COMMENT '*특정 매칭과 관련없는 알림의 경우 null',
    `NOTIFICATION_TYPE` VARCHAR(50)  NOT NULL,
    `CONTENT`           VARCHAR(255) NOT NULL,
    `CREATE_TIME`       TIMESTAMP    NOT NULL
);

CREATE TABLE `MANNER_SCORE`
(
    `ID`           BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `MATCHING_ID`  BIGINT    NOT NULL,
    `SITE_USER_ID` BIGINT    NOT NULL,
    `SCORE`        INT       NOT NULL,
    `CREATE_TIME`  TIMESTAMP NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS'
);

CREATE TABLE `PENALTY_SCORE`
(
    `ID`           BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `SITE_USER_ID` BIGINT    NOT NULL,
    `SCORE`        INT       NOT NULL,
    `STATUS`       VARCHAR(50) NULL DEFAULT 'PENDING' COMMENT 'PENDING, ACCEPTED, REJECTED',
    `CREATE_TIME`  TIMESTAMP NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS',
    `CODE`         VARCHAR(50) NULL COMMENT 'OFFENSE_CHAT, DELETE_MATCH, CANCEL_AFTER_COMFIRM'
);

CREATE TABLE `REVIEW`
(
    `ID`              BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `OBJECT_USER_ID`  BIGINT    NOT NULL,
    `MATCHING_ID`     BIGINT    NOT NULL,
    `SUBJECT_USER_ID` BIGINT    NOT NULL,
    `SCORE`           INT       NOT NULL,
    `CREATE_TIME`     TIMESTAMP NOT NULL COMMENT 'YYYY-MM-DD HH:MM:SS'
);
