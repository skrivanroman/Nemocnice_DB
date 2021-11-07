use Nemocnice;

/*   Vytvoreni tabulky adresa   */
create table Adresa(
	id_adr int identity(1,1) primary key,
	nazev nvarchar(50) not null,
	cislPopis int not null,
	mesto nvarchar(50) not null
);

/*   Vytvoreni tabulky nemocnice a fk adresy  */
create table Nemocnice(
	id_nemocnice int identity(1,1) primary key,
	nazev nvarchar(50) not null,
	typ_nemoc nvarchar(100) not null,
	id_adr int not null,
	constraint fk_nemocnice_adresa foreign key(id_adr) references Adresa(id_adr)
);

/*   Vytvoreni tabulky ZdravotnickySoftware a fk nemocnice */
create table ZdravotnickySoftware(
	id_ZdrSoftweru int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	cena float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	verzSoft nvarchar(12) not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_zdravotnickySoftware_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky TerapeutickeDiagnostickeZP a fk nemocnice   */
create table TerapeutickeDiagnostickeZP(
	id_TeraDiagZP int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	druh nvarchar(40) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetNAsklade int not null,
	popis nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_terapeutickeDiagnostickeZP_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky JednorazoveZP a fk nemocnice  */
create table JednorazoveZP(
	id_JednoZP int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	druh nvarchar(50) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetNAsklade int not null,
	popis nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_jednorazoveZP_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky BiologickyMaterial a fk nemocnice  */
create table BiologickyMaterial(
	id_BioMat int identity(1,1) primary key,
	druh nvarchar(50) not null,
	nazev nvarchar(100) not null,
	pocetNAsklade int not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_BiologickyMaterial_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky KompenzacniPomucky a fk nemocnice  */
create table KompenzacniPomucky(
	id_KompezPomus int identity(1,1) primary key,
	druh nvarchar(50) not null,
	nazev nvarchar(100) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetNAsklade int not null,
	popis nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_kompenzacniPomucky_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky LaboratorniZarizeni a fk nemocnice  */
create table LaboratorniZarizeni(
	id_LAborZariz int identity(1,1) primary key,
	druh nvarchar(100) not null,
	nazev nvarchar(100) not null,
	vyuziti nvarchar(500) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetKusu int not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_laboratorniZarizeniy_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky NemocnicniHardware a fk nemocnice  */
create table NemocnicniHardware(
	id_NemocHardw int identity(1,1) primary key,
	druh nvarchar(70) not null,
	nazev nvarchar(100) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetKusu int not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_nemocnicniHardware_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky ZPOpakovanePouziti a fk nemocnice  */
create table ZPOpakovanePouziti(
	id_OpakPouzZP int identity(1,1) primary key,
	druhy nvarchar(100) not null,
	nazev nvarchar(100) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetKusu int not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_zPOpakovanePouziti_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky ElektromechanickeZP a fk nemocnice  */
create table ElektromechanickeZP(
	id_ElektroMechZP int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	popisVyuz nvarchar(500) not null,
	cenaKus float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetKusu int not null,
	poznamka nvarchar(500) not null,
	id_nemocnice int not null,
	constraint fk_elektromechanickeZP_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky Oddeleni  */
create table Oddeleni(
	id_od int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	druhOboru nvarchar(100) not null,
	poznamka nvarchar(500) not null
);

/*   Vytvoreni tabulky Pokoje a fk oddeleni  */
create table Pokoje(
	id_pokoje int identity(1,1) primary key,
	cislo int not null,
	id_od int not null,
	constraint fk_pokoje_oddeleni foreign key(id_od) references Oddeleni(id_od)
);

/*   Vytvoreni tabulky DruhyLuzka  */
create table DruhyLuzka(
	id_DrhLuzka int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	druh nvarchar(100) not null
);

/*   Vytvoreni tabulky Luzka a fk Pokoje a DruhyLuzka */
create table Luzka(
	id_luzko int identity(1,1) primary key,
	nazev nvarchar(100) not null,
	cisloLuz int not null,
	maxVaha int not null,
	id_pokoje int not null,
	id_DrhLuzka int not null,
	constraint fk_luzka_pokoje foreign key(id_pokoje) references Pokoje(id_pokoje),
	constraint fk_luzka_druhyLuzka foreign key(id_DrhLuzka) references DruhyLuzka(id_DrhLuzka)
);

/*   Vytvoreni tabulky DruhLeku  */
create table DruhLeku(
	id_DrhLek int identity(1,1) primary key,
	nazev nvarchar(50) not null,
	druhFormy nvarchar(50) not null
);

/*   Vytvoreni tabulky Vyrobce  */
create table Vyrobce(
	id_vyrobce int identity(1,1) primary key,
	nazev nvarchar(50) not null,
	adresa nvarchar(50) not null
);

/*   Vytvoreni tabulky Leky a fk DruhLeku a Vyrobce */
create table Leky(
	id_lek int identity(1,1) primary key,
	nazev nvarchar(50) not null,
	zamereni nvarchar(100) not null,
	datSpotreby date not null,
	slozeni nvarchar(500) not null,
	cena float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	pocetNAsklade int not null,
	id_DrhLek int not null,
	id_vyrobce int not null,
	constraint fk_leky_druhLeku foreign key(id_DrhLek) references DruhLeku(id_DrhLek),
	constraint fk_leky_vyrobce foreign key(id_vyrobce) references Vyrobce(id_vyrobce)
);

/*   Vytvoreni tabulky Snidane  */
create table Snidane(
	id_snidane int identity(1,1) primary key,
	vaha int not null,
	verze nvarchar(100) not null,
	kaloricHodnota int not null,
	cena float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	obsah nvarchar(500)
);

/*   Vytvoreni tabulky Obed  */
create table Obed(
	id_obed int identity(1,1) primary key,
	vaha int not null,
	verze nvarchar(100) not null,
	kaloricHodnota int not null,
	cena float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	obsah nvarchar(500)
);

/*   Vytvoreni tabulky Vecere  */
create table Vecere(
	id_vecere int identity(1,1) primary key,
	vaha int not null,
	verze nvarchar(100) not null,
	kaloricHodnota int not null,
	cena float not null,
	dph nvarchar(10) not null,
	cenaSdph float not null,
	obsah nvarchar(500)
);

/*   Vytvoreni tabulky Pacienti a fk Luzka a Nemocnice */
create table Pacienti(
	id_pac int identity(1,1) primary key,
	jmeno nvarchar(50) not null,
	prijmeni nvarchar(50) not null,
	datNar date not null,
	rodCis nvarchar(11) not null,
	adresa nvarchar(50) not null,
	pojistovna nvarchar(50) not null,
	id_luzko int null,
	id_nemocnice int not null,
	constraint fk_pacienti_luzka foreign key(id_luzko) references Luzka(id_luzko),
	constraint fk_pacienti_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky StravaNaDen a fk Pacienta, snidane, obeda a vecere*/
create table StravaNaDen(
	id_strava int identity(1,1) primary key,
	datum date not null,
	id_pac int not null,
	id_snidane int not null,
	id_obed int not null,
	id_vecere int not null,
	constraint fk_stravaNaDen_pacienti foreign key(id_pac) references Pacienti(id_pac),
	constraint fk_stravaNaDen_snidane foreign key(id_snidane) references Snidane(id_snidane),
	constraint fk_stravaNaDen_obed foreign key(id_obed) references Obed(id_obed),
	constraint fk_stravaNaDen_vecere foreign key(id_vecere) references Vecere(id_vecere)
);

/*   Vytvoreni tabulky PacLEk a fk Pacienta a leku*/
create table PacLek(
	id_pacLek int identity(1,1) primary key,
	datumPodLeku date not null,
	casPodLeku time not null,
	id_pac int not null,
	id_lek int not null,
	constraint fk_pacLek_pacienti foreign key(id_pac) references Pacienti(id_pac),
	constraint fk_pacLek_lek foreign key(id_lek) references Leky(id_lek)
);

/*   Vytvoreni tabulky Doktori a fk nemocnice*/
create table Doktori(
	id_dok int identity(1,1) primary key,
	jmeno nvarchar(50) not null,
	prijmeni nvarchar(50) not null,
	datNar date not null,
	rodCis nvarchar(11) not null,
	adresa nvarchar(50) not null,
	zamereni nvarchar(100) not null,
	id_nemocnice int not null,
	constraint fk_doktori_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky Sestricky a fk nemocnice*/
create table Sestricky(
	id_ses int identity(1,1) primary key,
	jmeno nvarchar(50) not null,
	prijmeni nvarchar(50) not null,
	datNar date not null,
	rodCis nvarchar(11) not null,
	adresa nvarchar(50) not null,
	id_nemocnice int not null,
	constraint fk_sestricky_nemocnice foreign key(id_nemocnice) references Nemocnice(id_nemocnice)
);

/*   Vytvoreni tabulky PacDok a fk doktoru a pacientu*/
create table PacDok(
	id_pacDok int identity(1,1) primary key,
	datum date not null,
	id_dok int not null,
	id_pac int not null,
	constraint fk_pacDok_doktori foreign key(id_dok) references Doktori(id_dok),
	constraint fk_pacDok_pacient foreign key(id_pac) references Pacienti(id_pac),
);

/*   Vytvoreni tabulky PacSis a fk sestricek a pacientu*/
create table PacSes(
	id_pacSes int identity(1,1) primary key,
	datum date not null,
	id_ses int not null,
	id_pac int not null,
	constraint fk_pacDok_sestricky foreign key(id_ses) references Sestricky(id_ses),
	constraint fk_pacDok_pacienti foreign key(id_pac) references Pacienti(id_pac),
);