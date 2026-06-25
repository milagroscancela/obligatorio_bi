# Obligatorio Business Intelligence 2026
## Dataset: Science Fiction Books (Kaggle)

Este proyecto implementa una solución completa de Business Intelligence sobre un dataset de libros de ciencia ficción de Goodreads, incluyendo diseño de datawarehouse, ETL, análisis SQL y dashboard en Power BI.

---

## 📁 Estructura del proyecto

obligatorio-bi/
├── analysis/          # Jupyter Notebook con consultas SQL y análisis
├── data/              # 12 CSVs de subgéneros SF de Kaggle
├── database/          # Script SQL para crear las tablas
├── diagrama/          # Diagrama del datawarehouse draw.io
├── pentaho/           # Transformaciones .ktr y Job .kjb
├── venv_bi/           # Entorno virtual de Python
└── README.md

---

## 🛠️ Requisitos

- MySQL 8.0+
- Pentaho Data Integration PDI 9.4
- Power BI Desktop
- Python 3.x + Jupyter Notebook

---

## 🚀 Instrucciones para correr el proyecto

### 1. Base de datos
Ejecutar el script en MySQL:

source database/create_tables.sql

### 2. ETL en Pentaho
1. Abrir Pentaho PDI Spoon
2. Abrir pentaho/jobs/jb_obligatorio.kjb
3. Actualizar las rutas de los CSVs en pentaho/transformations/tr_staging.ktr con la ruta local de la carpeta data/
4. Actualizar la conexión a MySQL con las credenciales locales
5. Ejecutar el Job

### 3. Análisis SQL
Abrir analysis/analisis_libros_sf.ipynb con Jupyter Notebook y actualizar la contraseña de MySQL.

### 4. Power BI
Abrir el archivo .pbix y actualizar la conexión a MySQL con la IP local y credenciales.

---

## 📊 Datawarehouse

Esquema estrella con bridges para relaciones N:M.

Fact_Metricas — métricas de cada libro rating, votos, reseñas
Dim_Libro — información del libro
Dim_Autor — autores
Dim_Idioma — idiomas de edición
Dim_Temporal — año y década de publicación
Dim_Subgenero — 12 subgéneros SF
Dim_Genero — 523 géneros literarios votados por usuarios
Bridge_Subgenero — relación N:M libro-subgénero
Bridge_Genero — relación N:M libro-género con votos de usuarios

---

## 📈 Dashboard Power BI

5 páginas de análisis:

1. Panorama General — visión global del dataset
2. Análisis por Subgénero — comparativa de los 12 subgéneros SF
3. Evolución Temporal — crecimiento editorial por décadas
4. Ranking de Autores — autores más populares y mejor valorados
5. Géneros Literarios — géneros votados por usuarios de Goodreads

---

## 🔍 Preguntas de negocio analizadas

1. ¿Cuáles son los 10 libros mejor valorados con más de 1000 votos?
2. ¿Qué autores tienen el mayor rating promedio con más de 3 libros?
3. ¿Qué subgénero SF tiene el mayor rating promedio?

---


