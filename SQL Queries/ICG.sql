--- Question 1

Select distinct games 
from Game
where mod(id,2) = 0 AND NOT description = ‘Interesting ’
Order by rating desc

---- Question 2
WITH SwappedSeats AS (
  SELECT id, name,
    CASE 
      WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
      WHEN id % 2 = 0 THEN id - 1
      ELSE id
    END AS swapped_id
  FROM Seat
)
SELECT swapped_id AS id, name
FROM SwappedSeats
ORDER BY id ASC;