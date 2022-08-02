CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"password" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"amount" integer DEFAULT '0',
	"price" numeric NOT NULL,
	"categoryId" integer NOT NULL,
	"pictureId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categoryes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"productId" serial NOT NULL UNIQUE,
	CONSTRAINT "Categoryes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Size" (
	"id" serial NOT NULL,
	"name" TEXT(1) NOT NULL,
	CONSTRAINT "Size_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Picture" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "Picture_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Order" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"orderProductId" int NOT NULL,
	"price" numeric NOT NULL,
	"date" DATE NOT NULL,
	"status" TEXT NOT NULL,
	CONSTRAINT "Order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.OrderProduct" (
	"id" serial NOT NULL,
	"productId" integer NOT NULL,
	"orderId" integer NOT NULL,
	"quantity" int NOT NULL,
	CONSTRAINT "OrderProduct_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Address" (
	"id" serial NOT NULL,
	"useId" integer NOT NULL,
	"streetName" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"cityId" int NOT NULL,
	CONSTRAINT "Address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.City" (
	"id" serial NOT NULL,
	"stateId" int NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.State" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "State_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("categoryId") REFERENCES "Categoryes"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("pictureId") REFERENCES "Picture"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk2" FOREIGN KEY ("sizeId") REFERENCES "Size"("id");

ALTER TABLE "Categoryes" ADD CONSTRAINT "Categoryes_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");


ALTER TABLE "Picture" ADD CONSTRAINT "Picture_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");

ALTER TABLE "Order" ADD CONSTRAINT "Order_fk0" FOREIGN KEY ("userId") REFERENCES "Users"("id");
ALTER TABLE "Order" ADD CONSTRAINT "Order_fk1" FOREIGN KEY ("orderProductId") REFERENCES "OrderProduct"("id");

ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");
ALTER TABLE "OrderProduct" ADD CONSTRAINT "OrderProduct_fk1" FOREIGN KEY ("orderId") REFERENCES "Order"("id");

ALTER TABLE "Address" ADD CONSTRAINT "Address_fk0" FOREIGN KEY ("useId") REFERENCES "Users"("id");
ALTER TABLE "Address" ADD CONSTRAINT "Address_fk1" FOREIGN KEY ("cityId") REFERENCES "City"("id");

ALTER TABLE "City" ADD CONSTRAINT "City_fk0" FOREIGN KEY ("stateId") REFERENCES "State"("id");












