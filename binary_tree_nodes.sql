--HackerRank - Binary Tree Nodes
--
--drop table BST
create table BST
(
N  int,
P  int
)


insert into BST(n,p)
values
(1, 2),
(3, 2),
(5, 6),
(7, 6),
(2, 4),
(6, 4),
(4, 15),
(8, 9),
(10, 9),
(12, 13),
(14, 13),
(9, 11),
(13, 11),
(11, 15),
(15, NULL);

--                    15	            
--			  /          \
--          4                  11  
--       /     \             /   \
--     2         6        9        13
--    / \       / \      / \      / \
--   1   3     5   7    8  10    12 14



WITH LeafNodes AS (
    SELECT N, 'Leaf' AS NodeType
    FROM BST
    WHERE N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)
),
Nodes AS (
     SELECT N, 'Inner' AS NodeType
    FROM BST
    WHERE N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)
    AND N IN (SELECT DISTINCT N FROM BST WHERE N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL))
    AND P IS NOT NULL 
),
Root AS (
    SELECT N, 'Root' AS NodeType
    FROM BST
    WHERE P IS NULL
)
SELECT *
FROM Root
UNION
SELECT *
FROM Nodes
UNION
SELECT *
FROM LeafNodes;



