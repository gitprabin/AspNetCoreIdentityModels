/* [dbo].[AspNetRoleClaims]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetRoleClaims(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	RoleId Varchar(450) NOT NULL,
	ClaimType Text NULL,
	ClaimValue Text NULL,
 CONSTRAINT PK_AspNetRoleClaims PRIMARY KEY 
(
	Id 
) 
);
/* [dbo].[AspNetRoles]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetRoles(
	Id Varchar(450) NOT NULL,
	Name Varchar(256) NULL,
	NormalizedName Varchar(256) NULL,
	ConcurrencyStamp Text NULL,
 CONSTRAINT PK_AspNetRoles PRIMARY KEY 
(
	Id 
) 
);
/* [dbo].[AspNetUserClaims]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetUserClaims(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	UserId Varchar(450) NOT NULL,
	ClaimType Text NULL,
	ClaimValue Text NULL,
 CONSTRAINT PK_AspNetUserClaims PRIMARY KEY 
(
	Id 
) 
);
/*[dbo].[AspNetUserLogins]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetUserLogins(
	LoginProvider Varchar(450) NOT NULL,
	ProviderKey Varchar(450) NOT NULL,
	ProviderDisplayName Text NULL,
	UserId Varchar(450) NOT NULL,
 CONSTRAINT PK_AspNetUserLogins PRIMARY KEY 
(
	LoginProvider,
	ProviderKey 
) 
);
/*[dbo].[AspNetUserRoles]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetUserRoles(
	UserId Varchar(450) NOT NULL,
	RoleId Varchar(450) NOT NULL,
 CONSTRAINT PK_AspNetUserRoles PRIMARY KEY 
(
	UserId,
	RoleId 
) 
);
/*[dbo].[AspNetUsers]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetUsers(
	Id Varchar(450) NOT NULL,
	UserName Varchar(256) NULL,
	NormalizedUserName Varchar(256) NULL,
	Email Varchar(256) NULL,
	NormalizedEmail Varchar(256) NULL,
	EmailConfirmed Boolean NOT NULL,
	PasswordHash Text NULL,
	SecurityStamp Text NULL,
	ConcurrencyStamp Text NULL,
	PhoneNumber Text NULL,
	PhoneNumberConfirmed Boolean NOT NULL,
	TwoFactorEnabled Boolean NOT NULL,
	LockoutEnd Timestamp(6) WITH TIME ZONE NULL,
	LockoutEnabled Boolean NOT NULL,
	AccessFailedCount int NOT NULL,
	Discriminator Text NOT NULL,
	FirstName Text NULL,
	LastName Text NULL,
 CONSTRAINT PK_AspNetUsers PRIMARY KEY 
(
	Id 
) 
);
/* [dbo].[AspNetUserTokens]    Script Date: 9/6/2022 10:07:07 PM ******/
CREATE TABLE AspNetUserTokens(
	UserId Varchar(450) NOT NULL,
	LoginProvider Varchar(450) NOT NULL,
	Name Varchar(450) NOT NULL,
	Value Text NULL,
 CONSTRAINT PK_AspNetUserTokens PRIMARY KEY 
(
	UserId,
	LoginProvider,
	Name 
) 
);
ALTER TABLE AspNetUsers ALTER COLUMN Discriminator  SET DEFAULT ('');
 
ALTER TABLE AspNetRoleClaims  ADD  CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId FOREIGN KEY(RoleId)
REFERENCES AspNetRoles (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetRoleClaims VALIDATE CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId;
 
ALTER TABLE AspNetUserClaims  ADD  CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId FOREIGN KEY(UserId)
REFERENCES AspNetUsers (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetUserClaims VALIDATE CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId;
 
ALTER TABLE AspNetUserLogins  ADD  CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId FOREIGN KEY(UserId)
REFERENCES AspNetUsers (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetUserLogins VALIDATE CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId;
 
ALTER TABLE AspNetUserRoles  ADD  CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId FOREIGN KEY(RoleId)
REFERENCES AspNetRoles (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetUserRoles VALIDATE CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId;
 
ALTER TABLE AspNetUserRoles  ADD  CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId FOREIGN KEY(UserId)
REFERENCES AspNetUsers (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetUserRoles VALIDATE CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId;
 
ALTER TABLE AspNetUserTokens  ADD  CONSTRAINT FK_AspNetUserTokens_AspNetUsers_UserId FOREIGN KEY(UserId)
REFERENCES AspNetUsers (Id)
ON DELETE CASCADE;
 
ALTER TABLE AspNetUserTokens VALIDATE CONSTRAINT FK_AspNetUserTokens_AspNetUsers_UserId;
 