BEGIN;


DROP TABLE IF EXISTS public.patients;

CREATE TABLE IF NOT EXISTS public.patients
(
    id integer NOT NULL,
    name character varying(255),
    date_of_birth date,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

DROP TABLE IF EXISTS public.medical_histories;

CREATE TABLE IF NOT EXISTS public.medical_histories
(
    id integer NOT NULL,
    admitted_at time without time zone,
    patients_id integer,
    status character varying(30),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

DROP TABLE IF EXISTS public.treatments;

CREATE TABLE IF NOT EXISTS public.treatments
(
    id integer NOT NULL,
    type character varying(100),
    name character varying(255),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

DROP TABLE IF EXISTS public.invoices;

CREATE TABLE IF NOT EXISTS public.invoices
(
    id integer NOT NULL,
    total_amount real,
    generated_at time without time zone,
    payed_at time without time zone,
    medical_history_id integer,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

DROP TABLE IF EXISTS public.invoice_items;

CREATE TABLE IF NOT EXISTS public.invoice_items
(
    id integer NOT NULL,
    unit_price real,
    quantity integer,
    total_price real,
    invoice_id integer,
    treatment_id integer,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

DROP TABLE IF EXISTS public.medical_histories_treatments;

CREATE TABLE IF NOT EXISTS public.medical_histories_treatments
(
    id integer NOT NULL,
    medical_history_id integer NOT NULL,
    treatment_id integer NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

