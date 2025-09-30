# 🎶 Advanced Spotify Data Analysis with SQL & pgAdmin

## 📌 Project Overview
This project performs a comprehensive analysis of a **Spotify dataset** containing tracks, albums, and artist details. The project demonstrates **end-to-end SQL workflows**, including:

- Normalizing a denormalized dataset  
- Performing queries of varying complexity: easy, medium, and advanced  
- Optimizing queries for performance  

The main objective is to practice **advanced SQL skills** while generating meaningful insights from music streaming data.

---

## 📂 Project Structure
- `sql/` → All SQL scripts  
  - `create_tables.sql` → Database schema  
  - `analysis_queries.sql` → Queries categorized by difficulty  
- `data/` → Sample Spotify dataset (CSV)  
- `screenshots/` → Query results, ERD diagrams, and performance graphs  
- `README.md` → Project documentation  

---

## 🛠 Tools & Technologies
- **Database:** PostgreSQL  
- **SQL Features:** DDL, DML, Aggregations, Joins, Subqueries, CTEs, Window Functions  
- **Tools:** pgAdmin 4, PostgreSQL (local installation, Docker, or Homebrew)  

---

## 🔍 Project Steps

### 1. Data Exploration
The dataset includes the following key attributes:  
- `artist` – Performer of the track  
- `track` – Track name  
- `album` – Album name  
- `album_type` – Album type (single/album)  
- Audio features: danceability, energy, loudness, tempo, valence, etc.  
- Metrics: views, likes, comments, official_video, licensed  

Understanding the data is crucial before running queries and performing analysis.

### 2. SQL Querying
Queries are categorized for progressive learning:  

**Easy Queries:**  
- Retrieve all tracks with more than 1 billion streams  
- List albums and their artists  
- Count tracks by each artist  

**Medium Queries:**  
- Average danceability per album  
- Top 5 tracks by energy  
- Total views per album  

**Advanced Queries:**  
- Window functions to find top 3 tracks per artist  
- Tracks with energy above the album average  
- Cumulative likes ordered by views  
- Energy-to-liveness ratio filtering  

---

### 3. Query Optimization
To improve performance, the following techniques were applied:

1. **Initial Analysis using `EXPLAIN`:**  
   - Sample query: `SELECT * FROM spotify WHERE artist='Artist Name';`  
   - Execution time: 7 ms  

2. **Indexing:**  
   - Created index on frequently queried column:  
   ```sql
   CREATE INDEX idx_artist ON spotify(artist);
