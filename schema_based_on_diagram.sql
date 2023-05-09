/* create table patients */
create table patients(
id int generated always as identity primary key,
name varchar(250),
date_of_birth date);

/* create table medical_histories */
create table medical_histories(
id int generated always as identity primary key,
admitted_at timestamp,
patient_id int references patients(id),
status varchar(50));

/* create table invoices */
create table invoices(
id int generated always as identity primary key,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
medical_history_id int references medical_histories(id));

/* create table treatments */
create table treatments(
id int generated always as identity primary key,
type varchar(50),
name varchar(250));

/* create table invoice_items */
create table invoice_items(
id int generated always as identity primary key,
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int references invoices(id),
treatment_id int references treatments(id));

/* join table for many to many relationship between medical_histories and treatments */
create table medical_histories_treatments(
id int generated always as identity primary key,
medical_history_id int references medical_histories(id),
treatment_id int references treatments(id));

create index patient_id_idx on medical_histories(patient_id);
create index medical_history_id_idx on invoices(medical_history_id);
create index invoice_id_idx on invoice_items(invoice_id);
create index treatment_id_idx on invoice_items(treatment_id);
create index medical_history_treatments_id_idx on medical_histories_treatments(medical_history_id);
create index medical_histor_treatments_two_id_idx on medical_histories_treatments(treatment_id);