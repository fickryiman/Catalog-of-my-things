-- Table: public.books
-- DROP TABLE IF EXISTS public.books;
CREATE TABLE IF NOT EXISTS public.books
(
    id integer NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    publisher text COLLATE pg_catalog."default",
    cover_state text COLLATE pg_catalog."default",
    publish_date date,
    label_id integer,
    archived boolean,
    CONSTRAINT books_pkey PRIMARY KEY (id),
    CONSTRAINT label_id FOREIGN KEY (label_id)
        REFERENCES public.labels (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.books
    OWNER to postgres;


-- Table: public.labels
-- DROP TABLE IF EXISTS public.labels;
CREATE TABLE IF NOT EXISTS public.labels
(
    id integer NOT NULL DEFAULT nextval('labels_id_seq'::regclass),
    title text COLLATE pg_catalog."default",
    color text COLLATE pg_catalog."default",
    CONSTRAINT labels_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;
ALTER TABLE IF EXISTS public.labels
    OWNER to postgres;
