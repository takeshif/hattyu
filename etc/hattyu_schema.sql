CREATE TABLE j_order (
				id INT UNSIGNED AUTO_INCREMENT,
				item_cd VARCHAR(13) NOT NULL,
				shop_cd VARCHAR(6) NOT NULL,
				suryo INTEGER NOT NULL,
				preferred_date DATE,
				preferred_kbn CHAR(1),
				status INTEGER NOT NULL,
				created_at DATETIME NOT NULL,
				updated_at DATETIME NOT NULL,
				PRIMARY KEY (`id`)
  ) DEFAULT CHARACTER SET 'utf8' engine=InnoDB;

CREATE TABLE m_item (
				id INT UNSIGNED AUTO_INCREMENT,
				item_cd VARCHAR(13) NOT NULL,
				item_name VARCHAR(50) NOT NULL,
				jyodai INTEGER NOT NULL,
				gedai INTEGER NOT NULL,
				shiire INTEGER NOT NULL,
				hattan INTEGER NOT NULL,
				sales_start_date INTEGER NOT NULL,
				rank INTEGER,
				hinrui INTEGER NOT NULL,
				hinsyu INTEGER NOT NULL,
				imsir varchar(6) NOT NULL,
				card INTEGER,
				created_at DATETIME NOT NULL,
				updated_at DATETIME NOT NULL,
				PRIMARY KEY (`id`)
  ) DEFAULT CHARACTER SET 'utf8' engine=InnoDB;

CREATE TABLE m_shop (
				id INT UNSIGNED AUTO_INCREMENT,
				shop_cd VARCHAR(6),
				shop_name VARCHAR(50),
				password VARCHAR(20),
				created_at DATETIME NOT NULL,
				updated_at DATETIME NOT NULL,
				PRIMARY KEY (`id`)
  ) DEFAULT CHARACTER SET 'utf8' engine=InnoDB;


