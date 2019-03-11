-- ---------------- --
-- Blood Test Table --
-- ---------------- --
CREATE TABLE blood_test(
	blood_id INT(8) NOT NULL,
    HCV BOOLEAN,
    HIV BOOLEAN,
    HBsAg BOOLEAN,
    Syphilis BOOLEAN,
    MP BOOLEAN,
    PRIMARY KEY (blood_id)
);

-- --- --
-- Bag --
-- ---  --
CREATE TABLE bag (
	bag_id INT(8) NOT NULL,
    blood_id INT(8) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    rh_type VARCHAR(5) NOT NULL,
    amount DOUBLE(8,2),
    stored_date DATE,
    expired_date DATE,
    PRIMARY KEY (bag_id),
    FOREIGN KEY (blood_id) REFERENCES blood_test(blood_id)
);

-- ----- --
-- Donor --
-- ----- --
CREATE TABLE donor(
	reg_no INT(8) NOT NULL,
    bag_id INT(8) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    PRIMARY KEY (reg_no),
    FOREIGN KEY (bag_id) REFERENCES bag(bag_id)
);

-- ----------------- --
-- Donor Information --
-- ----------------- --
CREATE TABLE donor_info (
	reg_no INT(8) NOT NULL,
    name VARCHAR (50),
    father_or_husband_name VARCHAR (50),
    age INT(8),
    male BOOLEAN,
    female BOOLEAN,
    occupation VARCHAR(30),
    address VARCHAR(150),
    mobile_number VARCHAR(15),
    PRIMARY KEY (reg_no),
    FOREIGN KEy (reg_no) REFERENCES donor(reg_no)
);

-- ---------------------- --
-- Blood Donation History --
-- ---------------------- --
CREATE TABLE blood_donation_history (
    reg_no INT(8) NOT NULL,
	blood_donate_before_boolean BOOLEAN,
    gap_of_blood_donation VARCHAR(20),
    is_recipient_relative BOOLEAN,
    patient_name VARCHAR(50),
    PRIMARY KEY (reg_no),
    FOREIGN KEY (reg_no) REFERENCES donor(reg_no)
);

-- --------------- --
-- Medical History --
-- --------------- --
CREATE TABLE medical_history (
    reg_no INT(8) NOT NULL,
	disease_beforehowlongdays INT(8),
    lever_disease BOOLEAN,
    Asphyxia BOOLEAN,
    cough BOOLEAN,
    heart_disease BOOLEAN,
    malaria BOOLEAN,
    kalaazar BOOLEAN,
    typhoid BOOLEAN,
    operation_in_three_month BOOLEAN,
    any_treatment_medicine_now BOOLEAN,
    gestric BOOLEAN,
    Haematemeses BOOLEAN,
    blood_loo BOOLEAN,
    rheumatic_fever BOOLEAN,
    diabetes BOOLEAN,
    epilepsy BOOLEAN,
    kidney_disease BOOLEAN,
    social_disease BOOLEAN,
    skin_disease BOOLEAN,
    is_blood_taken BOOLEAN,
    is_vaccine_taken BOOLEAN,
    PRIMARY KEY (reg_no),
    FOREIGN KEY (reg_no) REFERENCES donor(reg_no)
);

-- ------------------- --
-- Pysical Examination --
-- ------------------- --
CREATE TABLE physical_examination (
	reg_no INT(8) NOT NULL,
    weight DECIMAL(5,2),
    hemoglobin_level DECIMAL(8,2),
    bp DECIMAL(8,2),
    pulse DECIMAL(8,2),
    temp DECIMAL(8,2),
    heart DECIMAL(8,2),
    lungs DECIMAL(8,2),
    others VARCHAR(30),
    PRIMARY KEY (reg_no),
    FOREIGN KEY (reg_no) REFERENCES donor(reg_no)
);

-- ------- --
-- Consent --
-- ------- --
CREATE TABLE consent (
	reg_no INT(8) NOT NULL,
    date DATE,
    permitted_to_donate BOOLEAN,
    donor_sign VARCHAR(20),
    doctor_sign VARCHAR(20),
    PRIMARY KEY (reg_no),
    FOREIGN KEY (reg_no) REFERENCES donor(reg_no)
);

-- --------- --
-- Recipient --
-- --------- --
CREATE TABLE recipient (
	serial_no INT(8) NOT NULL,
    date DATE,
    patient_name VARCHAR(50),
    referred_by VARCHAR(50),
    ward VARCHAR(20),
    unit VARCHAR(20),
    cabin_bed VARCHAR(20),
    issue_voucher_no INT(10),
    sex VARCHAR(10),
    blood_group VARCHAR(5) NOT NULL,
    age INT(5),
    PRIMARY KEY (serial_no)
);

-- ------ --
-- Charge --
-- ------ --
CREATE TABLE charge (
	serial_no INT(8) NOT NULL,
    whole_blood_unit INT(3),
    whoke_blood_rate_per_unit DECIMAL(9,2),
    whole_blood_amount DECIMAL(14,2),
    crossmatch_blood_unit INT(3),
    crossmatch_blood_rate_per_unit DECIMAL(9,2),
    crossmatch_blood_amount DECIMAL(14,2),
    sub_total DECIMAL(16,2),
    discount DECIMAL(16,2),
    grand_total DECIMAL(18,2),
    signature VARCHAR(20),
    PRIMARY KEY (serial_no),
    FOREIGN KEY (serial_no) REFERENCES recipient(serial_no)
);

-- ----- --
-- Staff --
-- ----- --
CREATE TABLE staff (
	staff_id INT(8) NOT NULL,
    name VARCHAR(50),
    contact_no VARCHAR(15),
    address VARCHAR(150),
    jod_title VARCHAR(50),
    PRIMARY KEY (staff_id)
);

-- ------------------------ --
-- Alter a field of a Table --
-- ------------------------ --
ALTER TABLE recipient
    ADD bag_id INT(8) NOT NULL,
    ADD FOREIGN KEY (bag_id) REFERENCES bag(bag_id);
