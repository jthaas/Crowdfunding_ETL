-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yK0ioX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company] VARCHAR(50)  NOT NULL ,
    [description] VARCHAR(150)  NOT NULL ,
    [goal] int  NOT NULL ,
    [pledged] int  NOT NULL ,
    [outcome] VARCHAR(50)  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] VARCHAR(50)  NOT NULL ,
    [currency] VARCHAR(50)  NOT NULL ,
    [launched_date] Date  NOT NULL ,
    [end_date] Date  NOT NULL ,
    [category_id] VARCHAR(50)  NOT NULL ,
    [subcategory_id] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_campaign] PRIMARY KEY CLUSTERED (
        [cf_id] ASC
    )
)

CREATE TABLE [categpry] (
    [category_id] VARCHAR(50)  NOT NULL ,
    [category] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_categpry] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] VARCHAR(50)  NOT NULL ,
    [last_name] VARCHAR(50)  NOT NULL ,
    [email] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

CREATE TABLE [subcategory] (
    [subcategory_id] VARCHAR(50)  NOT NULL ,
    [subcategory] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_cf_id] FOREIGN KEY([cf_id])
REFERENCES [contacts] ([contact_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_cf_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [categpry] ([category_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_category_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [subcategory] ([subcategory_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_subcategory_id]

COMMIT TRANSACTION QUICKDBD