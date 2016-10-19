#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Etudiant
#------------------------------------------------------------

CREATE TABLE Etudiant(
        id_etudiant        int (11) Auto_increment  NOT NULL ,
        nom_etudiant       Varchar (25) NOT NULL ,
        prenom_etudiant    Varchar (25) NOT NULL ,
        adresse_etudiant   Varchar (255) NOT NULL ,
        cp_etudiant        Varchar (25) NOT NULL ,
        ville_etudiant     Varchar (50) NOT NULL ,
        pays_etudiant      Varchar (25) NOT NULL ,
        datenaiss_etudiant Date NOT NULL ,
        mail_etudiant      Varchar (25) NOT NULL ,
        login_etudiant     Varchar (25) NOT NULL ,
        mdp_etudiant       Varchar (255) NOT NULL ,
        PRIMARY KEY (id_etudiant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: cv
#------------------------------------------------------------

CREATE TABLE cv(
        id_cv    int (11) Auto_increment  NOT NULL ,
        titre_cv Varchar (25) NOT NULL ,
        path_cv  Varchar (255) NOT NULL ,
        PRIMARY KEY (id_cv )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entreprise
#------------------------------------------------------------

CREATE TABLE entreprise(
        id_entreprise                int (11) Auto_increment  NOT NULL ,
        site_entreprise              Varchar (255) ,
        siege_social_entreprise      Varchar (255) NOT NULL ,
        raison_sociale_entreprise    Varchar (50) ,
        siret_entreprise             Varchar (25) NOT NULL ,
        description_entreprise       Longtext ,
        nb_salarie_entreprise        Int NOT NULL ,
        management_social_entreprise Bool NOT NULL ,
        PRIMARY KEY (id_entreprise )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: offre
#------------------------------------------------------------

CREATE TABLE offre(
        id_offre               int (11) Auto_increment  NOT NULL ,
        date_publication_offre Date NOT NULL ,
        duree_offre            Varchar (25) NOT NULL ,
        descriptif_offre       Longtext NOT NULL ,
        titre_offre            Varchar (255) NOT NULL ,
        localisation_offre     Varchar (255) NOT NULL ,
        critere_offre          Varchar (255) ,
        prime_stage_offre      Bool NOT NULL ,
        montant_prime_offre    Int ,
        id_domaine             Int NOT NULL ,
        id_entreprise          Int NOT NULL ,
        PRIMARY KEY (id_offre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: domaine
#------------------------------------------------------------

CREATE TABLE domaine(
        id_domaine int (11) Auto_increment  NOT NULL ,
        PRIMARY KEY (id_domaine )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: convention
#------------------------------------------------------------

CREATE TABLE convention(
        id_convention         int (11) Auto_increment  NOT NULL ,
        date_debut_convention Date NOT NULL ,
        date_fin_convention   Date NOT NULL ,
        mission_convention    Varchar (255) NOT NULL ,
        id_etudiant           Int NOT NULL ,
        id_entreprise         Int NOT NULL ,
        PRIMARY KEY (id_convention )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: possede
#------------------------------------------------------------

CREATE TABLE possede(
        id_etudiant Int NOT NULL ,
        id_cv       Int NOT NULL ,
        PRIMARY KEY (id_etudiant ,id_cv )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: maitrise
#------------------------------------------------------------

CREATE TABLE maitrise(
        id_etudiant Int NOT NULL ,
        id_domaine  Int NOT NULL ,
        PRIMARY KEY (id_etudiant ,id_domaine )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: candidate
#------------------------------------------------------------

CREATE TABLE candidate(
        date_candidature Date NOT NULL ,
        id_offre         Int NOT NULL ,
        id_etudiant      Int NOT NULL ,
        PRIMARY KEY (id_offre ,id_etudiant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: commente
#------------------------------------------------------------

CREATE TABLE commente(
        note_commentaire Int NOT NULL ,
        contenu          Varchar (250) NOT NULL ,
        id_etudiant      Int NOT NULL ,
        id_entreprise    Int NOT NULL ,
        PRIMARY KEY (id_etudiant ,id_entreprise )
)ENGINE=InnoDB;

ALTER TABLE offre ADD CONSTRAINT FK_offre_id_domaine FOREIGN KEY (id_domaine) REFERENCES domaine(id_domaine);
ALTER TABLE offre ADD CONSTRAINT FK_offre_id_entreprise FOREIGN KEY (id_entreprise) REFERENCES entreprise(id_entreprise);
ALTER TABLE convention ADD CONSTRAINT FK_convention_id_etudiant FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant);
ALTER TABLE convention ADD CONSTRAINT FK_convention_id_entreprise FOREIGN KEY (id_entreprise) REFERENCES entreprise(id_entreprise);
ALTER TABLE possede ADD CONSTRAINT FK_possede_id_etudiant FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant);
ALTER TABLE possede ADD CONSTRAINT FK_possede_id_cv FOREIGN KEY (id_cv) REFERENCES cv(id_cv);
ALTER TABLE maitrise ADD CONSTRAINT FK_maitrise_id_etudiant FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant);
ALTER TABLE maitrise ADD CONSTRAINT FK_maitrise_id_domaine FOREIGN KEY (id_domaine) REFERENCES domaine(id_domaine);
ALTER TABLE candidate ADD CONSTRAINT FK_candidate_id_offre FOREIGN KEY (id_offre) REFERENCES offre(id_offre);
ALTER TABLE candidate ADD CONSTRAINT FK_candidate_id_etudiant FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant);
ALTER TABLE commente ADD CONSTRAINT FK_commente_id_etudiant FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant);
ALTER TABLE commente ADD CONSTRAINT FK_commente_id_entreprise FOREIGN KEY (id_entreprise) REFERENCES entreprise(id_entreprise);
