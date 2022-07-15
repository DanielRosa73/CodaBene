CREATE TABLE temp(
    CodeSecteur INT,
    LibelléSecteur VARCHAR(255),
    CodeRayon INT8,
    LibelléRayon VARCHAR(255),
    CodeGroupedeFamille INT,
    LibelléGroupedeFamille VARCHAR(255),
    CodeFamille INT,
    LibelléFamille VARCHAR(255),
    CodeSousFamille INT,
    LibelléSousFamille VARCHAR(255),
    CodeUnitédeBesoin INT,
    LibelléUnitédeBesoin VARCHAR(255),
    CodeinterneEnseignesanitisé INT8,
    LibellécodeinterneEnseigne VARCHAR(255),
    Codelogistique VARCHAR(255),
    EAN INT8,
    ArticleLibelléCourt VARCHAR(255),
    ArticleLibellé VARCHAR(255),
    PVMag VARCHAR(255),
    Quantitévendue VARCHAR(255),
    Stockenquantité VARCHAR(255),
    DateDebCad DATE,
    Datedéréf DATE
);

copy temp from '/home/benchovski/CodaBene/retailer_extract.csv' delimiter ';' csv header;


CREATE TABLE new_table (
    EAN INT8,
    DateDebCad DATE,
    LibelléRayon VARCHAR(255),
    LibelléGroupeDeFamille VARCHAR(255),
    LibelléSousFamille VARCHAR(255)
);

INSERT INTO new_table (EAN, DateDebCad, LibelléRayon, LibelléGroupeDeFamille, LibelléSousFamille)
SELECT EAN, DateDebCad, LibelléRayon, LibelléGroupeDeFamille, LibelléSousFamille
FROM temp;

drop table temp;
