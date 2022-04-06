SELECT 10 != 10;
# +----------+
# | 10 != 10 |
# +----------+
# |        0 |
# +----------+

SELECT 15 > 14 && 99 - 5 <= 94;
# +-------------------------+
# | 15 > 14 && 99 - 5 <= 94 |
# +-------------------------+
# |                       1 |
# +-------------------------+

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;
# +----------------------------------+
# | 1 IN (5,3) || 9 BETWEEN 8 AND 10 |
# +----------------------------------+
# |                                1 |
# +----------------------------------+

SELECT
    title,
    released_year
FROM books
WHERE released_year < 1980
ORDER BY released_year;
# +-------------+---------------+
# | title       | released_year |
# +-------------+---------------+
# | Cannery Row |          1945 |
# +-------------+---------------+

SELECT
    author_fname,
    author_lname,
    title
FROM books
WHERE 
    author_lname = 'eggers' ||
    author_lname = 'chabon'
ORDER BY author_lname;

SELECT
    author_fname,
    author_lname,
    title
FROM books
WHERE 
    author_lname IN ('eggers', 'chabon')
ORDER BY author_lname;
# +--------------+--------------+-------------------------------------------+
# | author_fname | author_lname | title                                     |
# +--------------+--------------+-------------------------------------------+
# | Michael      | Chabon       | The Amazing Adventures of Kavalier & Clay |
# | Dave         | Eggers       | A Hologram for the King: A Novel          |
# | Dave         | Eggers       | The Circle                                |
# | Dave         | Eggers       | A Heartbreaking Work of Staggering Genius |
# +--------------+--------------+-------------------------------------------+

SELECT 
    author_fname,
    author_lname,
    title,
    released_year
FROM books
WHERE
    author_lname = 'lahiri' &&
    released_year >= 2000
ORDER BY released_year;
# +--------------+--------------+--------------+---------------+
# | author_fname | author_lname | title        | released_year |
# +--------------+--------------+--------------+---------------+
# | Jhumpa       | Lahiri       | The Namesake |          2003 |
# +--------------+--------------+--------------+---------------+

SELECT
    title,
    author_fname,
    author_lname,
    pages
FROM books
WHERE pages BETWEEN 100 AND 200
ORDER BY pages;
# +-----------------------------------------------------+--------------+--------------+-------+
# | title                                               | author_fname | author_lname | pages |
# +-----------------------------------------------------+--------------+--------------+-------+
# | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |   176 |
# | Cannery Row                                         | John         | Steinbeck    |   181 |
# | Interpreter of Maladies                             | Jhumpa       | Lahiri       |   198 |
# +-----------------------------------------------------+--------------+--------------+-------+

SELECT
    title,
    author_lname
FROM books
WHERE 
    SUBSTRING(author_lname, 1, 1) = 'S' OR
    SUBSTRING(author_lname, 1, 1) = 'c'
ORDER BY author_lname;

SELECT
    title,
    author_lname
FROM books
WHERE SUBSTRING(author_lname, 1, 1) IN ('S', 'c')
ORDER BY author_lname;

SELECT
    title,
    author_lname
FROM books
WHERE 
    author_lname LIKE 'c%' OR
    author_lname LIKE 's%'
ORDER BY author_lname;
# +-----------------------------------------------------+--------------+
# | title                                               | author_lname |
# +-----------------------------------------------------+--------------+
# | What We Talk About When We Talk About Love: Stories | Carver       |
# | Where I'm Calling From: Selected Stories            | Carver       |
# | The Amazing Adventures of Kavalier & Clay           | Chabon       |
# | Lincoln In The Bardo                                | Saunders     |
# | Just Kids                                           | Smith        |
# | Cannery Row                                         | Steinbeck    |
# +-----------------------------------------------------+--------------+

SELECT
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Strories'
        WHEN title = 'A Heartbreaking Work of Staggering Genius' OR
             title = 'Just Kids' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;
# +-----------------------------------------------------+----------------+----------------+
# | The Namesake                                        | Lahiri         | Novel          |
# | Norse Mythology                                     | Gaiman         | Novel          |
# | American Gods                                       | Gaiman         | Novel          |
# | Interpreter of Maladies                             | Lahiri         | Novel          |
# | A Hologram for the King: A Novel                    | Eggers         | Novel          |
# | The Circle                                          | Eggers         | Novel          |
# | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel          |
# | Just Kids                                           | Smith          | Memoir         |
# | A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir         |
# | Coraline                                            | Gaiman         | Novel          |
# | What We Talk About When We Talk About Love: Stories | Carver         | Short Strories |
# | Where I'm Calling From: Selected Stories            | Carver         | Short Strories |
# | White Noise                                         | DeLillo        | Novel          |
# | Cannery Row                                         | Steinbeck      | Novel          |
# | Oblivion: Stories                                   | Foster Wallace | Short Strories |
# | Consider the Lobster                                | Foster Wallace | Novel          |
# | 10% Happier                                         | Harris         | Novel          |
# | fake_book                                           | Harris         | Novel          |
# | Lincoln In The Bardo                                | Saunders       | Novel          |
# +-----------------------------------------------------+----------------+----------------+

SELECT
    title,
    author_lname,
    CASE
        WHEN COUNT(title) = 1 THEN CONCAT(COUNT(title), ' ', 'book')
        ELSE CONCAT(COUNT(title), ' ', 'books')
    END AS 'COUNT'
FROM books
GROUP BY 
    author_lname,
    author_fname;
# +-----------------------------------------------------+----------------+---------+
# | title                                               | author_lname   | COUNT   |
# +-----------------------------------------------------+----------------+---------+
# | What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
# | The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
# | White Noise                                         | DeLillo        | 1 book  |
# | A Hologram for the King: A Novel                    | Eggers         | 3 books |
# | Oblivion: Stories                                   | Foster Wallace | 2 books |
# | Norse Mythology                                     | Gaiman         | 3 books |
# | 10% Happier                                         | Harris         | 1 book  |
# | fake_book                                           | Harris         | 1 book  |
# | The Namesake                                        | Lahiri         | 2 books |
# | Lincoln In The Bardo                                | Saunders       | 1 book  |
# | Just Kids                                           | Smith          | 1 book  |
# | Cannery Row                                         | Steinbeck      | 1 book  |
# +-----------------------------------------------------+----------------+---------+