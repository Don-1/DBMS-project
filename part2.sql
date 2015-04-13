/*===================================== CREATE DATABASE AND SELECT IT ======================*/
create database CompuStore;
use CompuStore;

/*======================= CREATING TABLES ===================================================*/
	    /*------------------strong entities--------*/
CREATE TABLE customer(
	trans_num int(20) not null,
	fname varchar(20),
	lname varchar(20),
	c_add varchar(50),
	c_tel varchar(30),
      
	primary key (trans_num)
);

CREATE TABLE product(
	serial_num int(20) not null,
	p_name varchar(30),
	p_model varchar(20),
	p_price decimal(12,3)
      
	primary key (serial_num)
);

CREATE TABLE branch(
	b_id varchar(5) not null,
	b_tele varchar(30),
	b_addr varchar(50),
      
	primary key (b_id)
);

CREATE TABLE warehouse(
      	w_id varchar(5) not null,
	w_add varchar(50),
	w_tele varchar(30),
	p_model varchar(20),
	p_quantity int,
      
	primary key (w_id),
	foreign key (p_model) references product(p_model) on update cascade on delete cascade,
	foreign key (w_id) references branch(b_id) on update cascade on delete cascade
);

	  /*------------------ relationship set involving strong entity sets --------*/
CREATE TABLE orders (
	track_num varchar(7) not null,
	serial_num int(20) not null,
	trans_num int(20) not null,
	o_date date,

	primary key (track_num),
	foreign key (serial_num) references product(serial_num) on update cascade on delete cascade,
	foreign key (trans_num) references customer(trans_num) on update cascade on delete cascade
);

CREATE TABLE register (
	member_id varchar(7) not null,
	r_date date,
	cc_num int auto_increment,
	trans_num int(20) not null,
	
	primary key (member_id),
	foreign key (trans_num) references customer(trans_num) on update cascade on delete cascade
);

CREATE TABLE upfront_purchase (
	receipt_num varchar(15) not null,
	serial_num int(20) not null,
	trans_num int(20) not null,
	p_date date,

	primary key (receipt_num),
	foreign key (serial_num) references product(serial_num) on update cascade on delete cascade,
	foreign key (trans_num) references customer(trans_num) on update cascade on delete cascade
); 

/*===================== INSERTING VALUES IN TABLES=================================== */


/*===================== VIEWS FOR RELATIONSHIPS WITH NO NEW INFO =================================== */


/*===================== QUERES FOR POPULATION OF TABLES [customer, Products, Quantity values] =================================== */

