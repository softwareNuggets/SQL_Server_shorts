--HackerRank - Binary Tree Nodes
--https://github.com/softwareNuggets/SQL_Server_shorts/binary_tree_nodes.sql

--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

--Root: If node is root node.
--Leaf: If node is leaf node.
--Inner: If node is neither root nor leaf node.

--drop table BST

--binary trees, problems often involve parent-child relationships, 
	--binary trees are hierarchical structures where each node can have at most two children. 
	--The relationship between nodes is typically defined as parent-child, 
	--where a node (except for the root) has one parent and zero, one, or two children. 
	
--You are given a table, BST, 
--  containing two columns: N and P, 
--  where N represents the value of a node in Binary Tree, and P is the parent of N.

create table BST
(
	N  int,				--child
	P  int				--parent
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

--                   15	                          -- root
--			  /             \
--          4                  11                 -- inner
--       /     \            /     \
--     2         6        9        13             -- inner
--    / \       / \      / \      /  \
--   1   3     5   7    8   10   12  14           -- leaf


With RootNode AS (
    SELECT N, 'Root' AS NodeType
    FROM BST
    WHERE P IS NULL
),
InnerNodes AS (
    SELECT N, 'Inner' AS NodeType
    FROM BST
    WHERE N IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) -- check if parent
    AND P IS NOT NULL 
),
LeafNodes AS (
    SELECT N, 'Leaf' AS NodeType
    FROM BST
    WHERE N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)
)
SELECT *
FROM RootNode
UNION
SELECT *
FROM InnerNodes
UNION
SELECT *
FROM LeafNodes;



