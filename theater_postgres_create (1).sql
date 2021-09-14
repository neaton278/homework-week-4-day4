CREATE TABLE "public.payments" (
	"payment_id" serial NOT NULL,
	"customer_id" serial NOT NULL,
	"payment_method" character varying(50) NOT NULL,
	"amount" numeric NOT NULL,
	CONSTRAINT "payments_pk" PRIMARY KEY ("payment_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.movies" (
	"movie_id" int NOT NULL,
	"name" character varying NOT NULL,
	CONSTRAINT "movies_pk" PRIMARY KEY ("movie_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.food" (
	"food_id" serial NOT NULL,
	"payment_id" int NOT NULL,
	"name" character varying(50) NOT NULL,
	CONSTRAINT "food_pk" PRIMARY KEY ("food_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customers" (
	"customer_id" serial NOT NULL,
	"payment_id" int NOT NULL,
	"first_name" character varying NOT NULL,
	"last_name" character varying NOT NULL,
	"email" character varying(100),
	CONSTRAINT "customers_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.tickets" (
	"ticket_id" int NOT NULL,
	"payment_id" bigint NOT NULL,
	"movie_id" bigint NOT NULL,
	CONSTRAINT "tickets_pk" PRIMARY KEY ("ticket_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "food" ADD CONSTRAINT "food_fk0" FOREIGN KEY ("payment_id") REFERENCES "payments"("payment_id");

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("payment_id") REFERENCES "payments"("payment_id");

ALTER TABLE "tickets" ADD CONSTRAINT "tickets_fk0" FOREIGN KEY ("payment_id") REFERENCES "payments"("payment_id");
ALTER TABLE "tickets" ADD CONSTRAINT "tickets_fk1" FOREIGN KEY ("movie_id") REFERENCES "movies"("movie_id");






