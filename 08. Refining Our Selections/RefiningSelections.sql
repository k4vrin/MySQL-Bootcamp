SELECT title FROM books WHERE title LIKE '%Stories%';
# +-----------------------------------------------------+
# | title                                               |
# +-----------------------------------------------------+
# | What We Talk About When We Talk About Love: Stories |
# | Where I'm Calling From: Selected Stories            |
# | Oblivion: Stories                                   |
# +-----------------------------------------------------+

SELECT title, pages FROM books 
ORDER BY pages DESC LIMIT 1;
# +-------------------------------------------+-------+
# | title                                     | pages |
# +-------------------------------------------+-------+
# | The Amazing Adventures of Kavalier & Clay |   634 |
# +-------------------------------------------+-------+

SELECT CONCAT(title, ' - ', released_year) AS summary
FROM books ORDER BY released_year DESC LIMIT 3;
# +-----------------------------+
# | summary                     |
# +-----------------------------+
# | Lincoln In The Bardo - 2017 |
# | Norse Mythology - 2016      |
# | 10% Happier - 2014          |
# +-----------------------------+

SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';
# +----------------------+----------------+
# | title                | author_lname   |
# +----------------------+----------------+
# | Oblivion: Stories    | Foster Wallace |
# | Consider the Lobster | Foster Wallace |
# +----------------------+----------------+

SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity, released_year DESC LIMIT 3;
# +-----------------------------------------------------+---------------+----------------+
# | title                                               | released_year | stock_quantity |
# +-----------------------------------------------------+---------------+----------------+
# | American Gods                                       |          2001 |             12 |
# | Where I'm Calling From: Selected Stories            |          1989 |             12 |
# | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
# +-----------------------------------------------------+---------------+----------------+

SELECT title, author_lname FROM books
ORDER BY author_lname, title;

SELECT title, author_lname FROM books
ORDER BY 2, 1;
# +-----------------------------------------------------+----------------+
# | title                                               | author_lname   |
# +-----------------------------------------------------+----------------+
# | What We Talk About When We Talk About Love: Stories | Carver         |
# | Where I'm Calling From: Selected Stories            | Carver         |
# | The Amazing Adventures of Kavalier & Clay           | Chabon         |
# | White Noise                                         | DeLillo        |
# | A Heartbreaking Work of Staggering Genius           | Eggers         |
# | A Hologram for the King: A Novel                    | Eggers         |
# | The Circle                                          | Eggers         |
# | Consider the Lobster                                | Foster Wallace |
# | Oblivion: Stories                                   | Foster Wallace |
# | American Gods                                       | Gaiman         |
# | Coraline                                            | Gaiman         |
# | Norse Mythology                                     | Gaiman         |
# | 10% Happier                                         | Harris         |
# | fake_book                                           | Harris         |
# | Interpreter of Maladies                             | Lahiri         |
# | The Namesake                                        | Lahiri         |
# | Lincoln In The Bardo                                | Saunders       |
# | Just Kids                                           | Smith          |
# | Cannery Row                                         | Steinbeck      |
# +-----------------------------------------------------+----------------+

SELECT
  UPPER(
      CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!')
  ) AS yell
FROM books
ORDER BY author_lname;
# +---------------------------------------------+
# | yell                                        |
# +---------------------------------------------+
# | MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
# | MY FAVORITE AUTHOR IS RAYMOND CARVER!       |
# | MY FAVORITE AUTHOR IS MICHAEL CHABON!       |
# | MY FAVORITE AUTHOR IS DON DELILLO!          |
# | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
# | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
# | MY FAVORITE AUTHOR IS DAVE EGGERS!          |
# | MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
# | MY FAVORITE AUTHOR IS DAVID FOSTER WALLACE! |
# | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
# | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
# | MY FAVORITE AUTHOR IS NEIL GAIMAN!          |
# | MY FAVORITE AUTHOR IS DAN HARRIS!           |
# | MY FAVORITE AUTHOR IS FREIDA HARRIS!        |
# | MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
# | MY FAVORITE AUTHOR IS JHUMPA LAHIRI!        |
# | MY FAVORITE AUTHOR IS GEORGE SAUNDERS!      |
# | MY FAVORITE AUTHOR IS PATTI SMITH!          |
# | MY FAVORITE AUTHOR IS JOHN STEINBECK!       |
# +---------------------------------------------+