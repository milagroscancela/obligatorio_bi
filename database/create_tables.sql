DROP DATABASE IF EXISTS obligatorio_bi;
CREATE DATABASE obligatorio_bi;
USE obligatorio_bi;

CREATE TABLE Dim_Libro(
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    goodreads_id VARCHAR(255) UNIQUE NOT NULL,
    book_title VARCHAR(255) NOT NULL,
    original_book_title VARCHAR(255),
    book_description TEXT
);

CREATE TABLE Dim_Autor(
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Idioma(
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    edition_language VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Temporal(
    id_fecha INT AUTO_INCREMENT PRIMARY KEY,
    year_published INT NOT NULL,
    decada INT
);

CREATE TABLE Dim_Genero(
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_genero VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Subgenero(
    id_subgenero INT AUTO_INCREMENT PRIMARY KEY,
    nombre_subgenero VARCHAR(255) NOT NULL,
    origen_csv VARCHAR(255) NOT NULL
);

CREATE TABLE Bridge_Genero(
    id_libro INT NOT NULL,
    id_genero INT NOT NULL,
    votos_usuarios INT,
    PRIMARY KEY (id_libro, id_genero),
    FOREIGN KEY (id_libro) REFERENCES Dim_Libro(id_libro),
    FOREIGN KEY (id_genero) REFERENCES Dim_Genero(id_genero)
);

CREATE TABLE Bridge_Subgenero(
    id_libro INT NOT NULL,
    id_subgenero INT NOT NULL,
    PRIMARY KEY (id_libro, id_subgenero),
    FOREIGN KEY (id_libro) REFERENCES Dim_Libro(id_libro),
    FOREIGN KEY (id_subgenero) REFERENCES Dim_Subgenero(id_subgenero)
);

CREATE TABLE Fact_Metricas(
    id_libro INT NOT NULL PRIMARY KEY,
    id_autor INT NOT NULL,
    id_idioma INT NOT NULL,
    id_fecha INT NOT NULL,
    rating_score FLOAT,
    rating_votes INT,
    review_numbers INT,
    FOREIGN KEY (id_libro) REFERENCES Dim_Libro(id_libro),
    FOREIGN KEY (id_autor) REFERENCES Dim_Autor(id_autor),
    FOREIGN KEY (id_idioma) REFERENCES Dim_Idioma(id_idioma),
    FOREIGN KEY (id_fecha) REFERENCES Dim_Temporal(id_fecha)
);

CREATE TABLE Staging_Libros(
    book_title VARCHAR(500),
    original_book_title VARCHAR(500),
    author_name VARCHAR(255),
    edition_language VARCHAR(255),
    rating_score VARCHAR(50),
    rating_votes VARCHAR(50),
    review_number VARCHAR(50),
    book_description TEXT,
    year_published VARCHAR(10),
    genres TEXT,
    url VARCHAR(500),
    origen_csv VARCHAR(100)
);