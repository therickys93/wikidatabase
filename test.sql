-- Adminer 4.7.1 PostgreSQL dump

\connect "wiki";

DROP TABLE IF EXISTS "connections";
DROP SEQUENCE IF EXISTS public.connections_id_seq;
CREATE SEQUENCE public.connections_id_seq INCREMENT  MINVALUE  MAXVALUE  START 1 CACHE ;

CREATE TABLE "public"."connections" (
    "id" integer DEFAULT nextval('public.connections_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "pin" integer NOT NULL,
    "user_id" character varying(255)
) WITH (oids = false);

CREATE INDEX "unique_name_key_pin_when_user_id_is_null" ON "public"."connections" USING btree ("name", "key", "pin");

CREATE INDEX "unique_name_key_pin_when_user_id_not_null" ON "public"."connections" USING btree ("name", "key", "pin", "user_id");

CREATE INDEX "unique_name_when_user_id_is_null" ON "public"."connections" USING btree ("name");

CREATE INDEX "unique_name_when_user_id_not_null" ON "public"."connections" USING btree ("name", "user_id");


DROP TABLE IF EXISTS "messages";
DROP SEQUENCE IF EXISTS public.messages_id_seq;
CREATE SEQUENCE public.messages_id_seq INCREMENT  MINVALUE  MAXVALUE  START 1 CACHE ;

CREATE TABLE "public"."messages" (
    "id" integer DEFAULT nextval('public.messages_id_seq') NOT NULL,
    "endpoint" character varying(255) NOT NULL,
    "message" text NOT NULL,
    "date_hour" timestamp DEFAULT now() NOT NULL,
    "type" character varying(255) NOT NULL,
    "user_id" character varying(255)
) WITH (oids = false);


DROP TABLE IF EXISTS "sensors";
DROP SEQUENCE IF EXISTS sensors_id_seq;
CREATE SEQUENCE sensors_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."sensors" (
    "id" integer DEFAULT nextval('sensors_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "pin" integer NOT NULL,
    "user_id" character varying(255) NOT NULL
) WITH (oids = false);

CREATE INDEX "sensors_name" ON "public"."sensors" USING btree ("name");

CREATE INDEX "sensors_name_key_pin" ON "public"."sensors" USING btree ("name", "key", "pin");

CREATE INDEX "sensors_name_key_pin_user_id" ON "public"."sensors" USING btree ("name", "key", "pin", "user_id");

CREATE INDEX "sensors_name_user_id" ON "public"."sensors" USING btree ("name", "user_id");


-- 2019-02-21 19:49:07.483918+00