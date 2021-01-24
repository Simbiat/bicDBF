/*Create tables*/
CREATE TABLE IF NOT EXISTS `%dbprefix%pzn` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `PZN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код типа участника расчетов',
  `IMY` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Краткое наименование типа участника расчетов',
  `NAME` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Полное наименование типа участника расчетов',
  `CB_DATE` date DEFAULT NULL COMMENT 'Дата ввода кода в эксплуатацию',
  `CE_DATE` date DEFAULT NULL COMMENT 'Дата вывода кода из эксплуатации',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `PZN` (`PZN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип организации' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%rclose` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `R_CLOSE` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код причины закрытия номера счета',
  `NAMECLOSE` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование причины закрытия',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `R_CLOSE` (`R_CLOSE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Причина закрытия' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%real` (
  `VKEY` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `REAL` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код контроля допустимости проведения расчетных операций',
  `NAME_OGR` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование кода контроля',
  PRIMARY KEY (`VKEY`),
  KEY `REAL` (`REAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Код контроля' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%reg` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `RGN` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код территории Российской Федерации',
  `NAME` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Наименование территории в именительном падеже',
  `CENTER` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование административного центра',
  `NAMET` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование территории в родительном падеже',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `RGN` (`RGN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Наименование территории' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%tnp` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `TNP` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код типа населенного пункта',
  `FULLNAME` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Полное наименование типа населенного пункта',
  `SHORTNAME` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Краткое наименование типа населенного пункта',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `TNP` (`TNP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип населённого пункта' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%uer` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `UER` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код типа участника системы электронных расчетов',
  `UERNAME` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование типа электронных расчетов',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `UER` (`UER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Участие в электронных расчётах (obsolete)' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%uerko` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `UERKO` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код типа пользователя системы электронных расчетов и участника обмена электронными документами',
  `UERNAME` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование типа электронных расчетов',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `UERKO` (`UERKO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип пользователя системы электронных расчётов' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%list` (
  `VKEY` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `ADR` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес',
  `AT1` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Абонентский телеграф 1',
  `AT2` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Абонентский телеграф 2',
  `CKS` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Номер установки центра коммутации сообщений',
  `DATE_CH` date DEFAULT NULL COMMENT 'Дата вступления в силу',
  `DATE_IN` date DEFAULT NULL COMMENT 'Дата добавления записи',
  `DATEDEL` date DEFAULT NULL COMMENT 'Дата удаления записи',
  `DT_IZM` date DEFAULT NULL COMMENT 'Дата изменения записи',
  `IND` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Индекс',
  `KSNP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Номер счета',
  `NAMEN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование участника расчетов для поиска в ЭБД',
  `NAMEP` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Наименование участника расчетов',
  `NEWKS` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Корреспондентский счет (субсчет), действовавший до перехода на новый План счетов бухгалтерского учета',
  `NEWNUM` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Банковский идентификационный код (БИК)',
  `NNP` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Населенный пункт',
  `OKPO` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код ОКПО',
  `PERMFO` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Номер МФО',
  `PZN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код типа участника расчетов',
  `REAL` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код контроля допустимости проведения расчетных операций',
  `R_CLOSE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код причины закрытия номера счета',
  `REGN` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Регистрационный номер',
  `RGN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код территории Российской Федерации',
  `RKC` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'БИК РКЦ (ГРКЦ)',
  `SROK` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Срок прохождения документов',
  `TELEF` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Телефон',
  `TNP` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код типа населенного пункта',
  `UER` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Код типа участника (пользователя) системы электронных расчетов',
  `VKEYDEL` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Уникальный внутренний код преемника',
  PRIMARY KEY (`VKEY`),
  KEY `NEWNUM` (`NEWNUM`),
  KEY `NAMEP` (`NAMEP`),
  KEY `%dbprefix%real` (`REAL`),
  KEY `%dbprefix%pzn` (`PZN`),
  KEY `%dbprefix%tnp` (`TNP`),
  KEY `%dbprefix%rclose` (`R_CLOSE`),
  KEY `%dbprefix%uerko` (`UER`),
  KEY `%dbprefix%rgn` (`RGN`),
  KEY `KSNP` (`KSNP`),
  KEY `RKC` (`RKC`),
  KEY `VKEYDEL` (`VKEYDEL`),
  KEY `REGN` (`REGN`),
  KEY `DATEDEL` (`DATEDEL`),
  KEY `DT_IZM` (`DT_IZM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список банков (BNKSEEK + BNKDEL)' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%bik_swif` (
  `KOD_RUS` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК код',
  `KOD_SWIFT` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SWIFT код',
  `NAME_SRUS` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя банка в системе SWIFT',
  PRIMARY KEY (`KOD_RUS`),
  UNIQUE KEY `KOD_SWIFT` (`KOD_SWIFT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Коды SWIFT' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%co` (
  `BIC_CF` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК головного филиала',
  `BIC_UF` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК уполномоченного филиала',
  `DT_ST` date DEFAULT NULL COMMENT 'Дата начала работы',
  `DT_FIN` date DEFAULT NULL COMMENT 'Дата прекращения работы',
  PRIMARY KEY (`BIC_CF`),
  KEY `BIC_UF` (`BIC_UF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Уполномоченный филиал' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%keybaseb` (
  `VKEY` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код участника расчетов по ЭБД «Справочник БИК РФ»',
  `BVKEY` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Внутренний код участника расчетов по ЭБД «Книги ГРКО»',
  `NEWNUM` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК участника расчетов',
  `NAMEMAXB` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фирменное (полное официальное) наименование кредитной организации',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `NEWNUM` (`NEWNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Полное наименование участника расчётов (головная организация)' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%keybasef` (
  `VKEY` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код участника расчетов по ЭБД «Справочник БИК РФ»',
  `FVKEY` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Внутренний код участника расчетов по ЭБД «Книги ГРКО»',
  `NAMEMAXF` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Наименование филиала кредитной организации',
  `NEWNUM` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК участника расчетов',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `NEWNUM` (`NEWNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Полное наименование участника расчётов (филиал)' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%kgur` (
  `VKEY` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Уникальный внутренний код',
  `KGUR` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Код головного участника МЭР',
  `NEWNUM` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'БИК участника расчетов',
  `DATE_END` date DEFAULT NULL COMMENT 'Дата прекращения работы',
  PRIMARY KEY (`VKEY`),
  UNIQUE KEY `KGUR` (`KGUR`),
  UNIQUE KEY `NEWNUM` (`NEWNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Код головного участника межрегиональных электронных платежей' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%prim` (
  `VKEY` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Внутренний код действующего или исключенного участника расчетов',
  `PRIM1` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Основание для ограничения участия в расчетах или исключения из состава участников расчетов',
  `PRIM2` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Реквизиты ликвидационной комиссии ',
  `PRIM3` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Основание для аннулировании в «Книге ГРКО» записи о регистрации кредитной организации (филиала)',
  PRIMARY KEY (`VKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ликвидационная комиссия' ROW_FORMAT=COMPRESSED;

CREATE TABLE IF NOT EXISTS `%dbprefix%rayon` (
  `VKEY` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Внутренний код действующего или исключенного участника расчетов',
  `NAME` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Наименование района',
  PRIMARY KEY (`VKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Наименование района' ROW_FORMAT=COMPRESSED;

/*Add foreign keys*/
ALTER TABLE `%dbprefix%bik_swif`
  ADD CONSTRAINT `bic_swift` FOREIGN KEY (`KOD_RUS`) REFERENCES `%dbprefix%list` (`NEWNUM`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%co`
  ADD CONSTRAINT `co_bic` FOREIGN KEY (`BIC_CF`) REFERENCES `%dbprefix%list` (`NEWNUM`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%keybaseb`
  ADD CONSTRAINT `vkey_keybaseb` FOREIGN KEY (`VKEY`) REFERENCES `%dbprefix%list` (`VKEY`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%keybasef`
  ADD CONSTRAINT `vkey_keybasef` FOREIGN KEY (`VKEY`) REFERENCES `%dbprefix%list` (`VKEY`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%kgur`
  ADD CONSTRAINT `kgur_newnum` FOREIGN KEY (`NEWNUM`) REFERENCES `%dbprefix%list` (`NEWNUM`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%list`
  ADD CONSTRAINT `%dbprefix%pzn` FOREIGN KEY (`PZN`) REFERENCES `%dbprefix%pzn` (`PZN`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `%dbprefix%rclose` FOREIGN KEY (`R_CLOSE`) REFERENCES `%dbprefix%rclose` (`R_CLOSE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `%dbprefix%real` FOREIGN KEY (`REAL`) REFERENCES `%dbprefix%real` (`REAL`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `%dbprefix%rgn` FOREIGN KEY (`RGN`) REFERENCES `%dbprefix%reg` (`RGN`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `%dbprefix%tnp` FOREIGN KEY (`TNP`) REFERENCES `%dbprefix%tnp` (`TNP`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `%dbprefix%uerko` FOREIGN KEY (`UER`) REFERENCES `%dbprefix%uerko` (`UERKO`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%prim`
  ADD CONSTRAINT `vkey_prim` FOREIGN KEY (`VKEY`) REFERENCES `%dbprefix%list` (`VKEY`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `%dbprefix%rayon`
  ADD CONSTRAINT `vkey_rayon` FOREIGN KEY (`VKEY`) REFERENCES `%dbprefix%list` (`VKEY`) ON DELETE CASCADE ON UPDATE CASCADE;