SELECT
    UPPER(
        REVERSE(
            'Why does my cat look at me with such hatred?'
        )
    ) AS 'UPPER and REVERSE';
    # ?DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW

SELECT
    REPLACE(
        CONCAT(
            'I',
            ' ',
            'like',
            ' ',
            'cats'
        ),
        ' ',
        '-'
    ) AS 'CONCAT and REPLACE';
    # I-like-cats
    
SELECT 
    REPLACE(title, ' ', '->') AS 'title'
FROM books;
#     +--------------------------------------------------------------+
# | title                                                        |
# +--------------------------------------------------------------+
# | The->Namesake                                                |
# | Norse->Mythology                                             |
# | American->Gods                                               |
# | Interpreter->of->Maladies                                    |
# | A->Hologram->for->the->King:->A->Novel                       |
# | The->Circle                                                  |
# | The->Amazing->Adventures->of->Kavalier->&->Clay              |
# | Just->Kids                                                   |
# | A->Heartbreaking->Work->of->Staggering->Genius               |
# | Coraline                                                     |
# | What->We->Talk->About->When->We->Talk->About->Love:->Stories |
# | Where->I'm->Calling->From:->Selected->Stories                |
# | White->Noise                                                 |
# | Cannery->Row                                                 |
# | Oblivion:->Stories                                           |
# | Consider->the->Lobster                                       |
# +--------------------------------------------------------------+

SELECT 
    author_lname AS 'forwards',
    REVERSE(author_lname) AS 'backwards'
FROM books;
# +----------------+----------------+
# | forwards       | backwards      |
# +----------------+----------------+
# | Lahiri         | irihaL         |
# | Gaiman         | namiaG         |
# | Gaiman         | namiaG         |
# | Lahiri         | irihaL         |
# | Eggers         | sreggE         |
# | Eggers         | sreggE         |
# | Chabon         | nobahC         |
# | Smith          | htimS          |
# | Eggers         | sreggE         |
# | Gaiman         | namiaG         |
# | Carver         | revraC         |
# | Carver         | revraC         |
# | DeLillo        | olliLeD        |
# | Steinbeck      | kcebnietS      |
# | Foster Wallace | ecallaW retsoF |
# | Foster Wallace | ecallaW retsoF |
# +----------------+----------------+

SELECT
  UPPER(
      CONCAT(author_fname, ' ', author_lname)
  ) AS 'full name in caps'
FROM books;
# +----------------------+
# | full name in caps    |
# +----------------------+
# | JHUMPA LAHIRI        |
# | NEIL GAIMAN          |
# | NEIL GAIMAN          |
# | JHUMPA LAHIRI        |
# | DAVE EGGERS          |
# | DAVE EGGERS          |
# | MICHAEL CHABON       |
# | PATTI SMITH          |
# | DAVE EGGERS          |
# | NEIL GAIMAN          |
# | RAYMOND CARVER       |
# | RAYMOND CARVER       |
# | DON DELILLO          |
# | JOHN STEINBECK       |
# | DAVID FOSTER WALLACE |
# | DAVID FOSTER WALLACE |
# +----------------------+

SELECT 
    CONCAT_WS(' was released in ', title, released_year) AS 'name with year'
FROM books;
# +--------------------------------------------------------------------------+
# | name with year                                                           |
# +--------------------------------------------------------------------------+
# | The Namesake was released in 2003                                        |
# | Norse Mythology was released in 2016                                     |
# | American Gods was released in 2001                                       |
# | Interpreter of Maladies was released in 1996                             |
# | A Hologram for the King: A Novel was released in 2012                    |
# | The Circle was released in 2013                                          |
# | The Amazing Adventures of Kavalier & Clay was released in 2000           |
# | Just Kids was released in 2010                                           |
# | A Heartbreaking Work of Staggering Genius was released in 2001           |
# | Coraline was released in 2003                                            |
# | What We Talk About When We Talk About Love: Stories was released in 1981 |
# | Where I'm Calling From: Selected Stories was released in 1989            |
# | White Noise was released in 1985                                         |
# | Cannery Row was released in 1945                                         |
# | Oblivion: Stories was released in 2004                                   |
# | Consider the Lobster was released in 2005                                |
# +--------------------------------------------------------------------------+

SELECT 
    title,
    CHAR_LENGTH(title) AS 'character count'
FROM books;
# +-----------------------------------------------------+-----------------+
# | title                                               | character count |
# +-----------------------------------------------------+-----------------+
# | The Namesake                                        |              12 |
# | Norse Mythology                                     |              15 |
# | American Gods                                       |              13 |
# | Interpreter of Maladies                             |              23 |
# | A Hologram for the King: A Novel                    |              32 |
# | The Circle                                          |              10 |
# | The Amazing Adventures of Kavalier & Clay           |              41 |
# | Just Kids                                           |               9 |
# | A Heartbreaking Work of Staggering Genius           |              41 |
# | Coraline                                            |               8 |
# | What We Talk About When We Talk About Love: Stories |              51 |
# | Where I'm Calling From: Selected Stories            |              40 |
# | White Noise                                         |              11 |
# | Cannery Row                                         |              11 |
# | Oblivion: Stories                                   |              17 |
# | Consider the Lobster                                |              20 |
# +-----------------------------------------------------+-----------------+

SELECT
    CONCAT(
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title',
    CONCAT(
        author_lname,
        ',',
        author_fname
    ) AS 'author',
    CONCAT(
        stock_quantity,
        ' in stock'
    ) AS 'quantity'
FROM books WHERE book_id = 3 OR book_id = 9;
# +---------------+-------------+--------------+
# | short title   | author      | quantity     |
# +---------------+-------------+--------------+
# | American G... | Gaiman,Neil | 12 in stock  |
# | A Heartbre... | Eggers,Dave | 104 in stock |
# +---------------+-------------+--------------+

SELECT
    CONCAT(
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title',
    CONCAT(
        author_lname,
        ',',
        author_fname
    ) AS 'author',
    CONCAT(
        stock_quantity,
        ' in stock'
    ) AS 'quantity'
FROM books;
# +---------------+----------------------+--------------+
# | short title   | author               | quantity     |
# +---------------+----------------------+--------------+
# | The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
# | Norse Myth... | Gaiman,Neil          | 43 in stock  |
# | American G... | Gaiman,Neil          | 12 in stock  |
# | Interprete... | Lahiri,Jhumpa        | 97 in stock  |
# | A Hologram... | Eggers,Dave          | 154 in stock |
# | The Circle... | Eggers,Dave          | 26 in stock  |
# | The Amazin... | Chabon,Michael       | 68 in stock  |
# | Just Kids...  | Smith,Patti          | 55 in stock  |
# | A Heartbre... | Eggers,Dave          | 104 in stock |
# | Coraline...   | Gaiman,Neil          | 100 in stock |
# | What We Ta... | Carver,Raymond       | 23 in stock  |
# | Where I'm ... | Carver,Raymond       | 12 in stock  |
# | White Nois... | DeLillo,Don          | 49 in stock  |
# | Cannery Ro... | Steinbeck,John       | 95 in stock  |
# | Oblivion: ... | Foster Wallace,David | 172 in stock |
# | Consider t... | Foster Wallace,David | 92 in stock  |
# +---------------+----------------------+--------------+