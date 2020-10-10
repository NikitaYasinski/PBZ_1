
-- 3
SELECT supplier_id FROM details_amount AS da
WHERE da.project_id = "ПР1";

-- 7
SELECT supplier_id, item_id, project_id FROM details_amount AS da
	INNER JOIN suppliers AS s ON da.supplier_id = s.id
    INNER JOIN details AS d ON da.item_id = d.id
    INNER JOIN projects AS p ON da.project_id = p.id
WHERE s.city != d.city AND d.city != p.city;

-- 12
SELECT DISTINCT item_id FROM details_amount AS da
	INNER JOIN details AS d ON da.item_id = d.id
    INNER JOIN projects AS p ON da.project_id = p.id
WHERE da.project_id IN (SELECT project_id FROM details_amount AS da
	INNER JOIN suppliers AS s ON da.supplier_id = s.id
    INNER JOIN projects AS p ON da.project_id = p.id
WHERE s.city = p.city);

-- 15
SELECT COUNT(project_id) FROM details_amount AS da
WHERE da.supplier_id = "П1";

-- 24
SELECT id FROM suppliers AS s 
WHERE s.stat < (SELECT stat FROM suppliers AS s1
WHERE s1.id = "П1");

-- 30
SELECT DISTINCT item_id FROM details_amount AS da
	INNER JOIN details AS d ON da.item_id = d.id
    INNER JOIN projects AS p ON da.project_id = p.id
WHERE p.city = "Лондон";

-- 5
SELECT DISTINCT d1.color, d2.city 
	FROM details AS d1
		JOIN details AS d2
ORDER BY d1.color;

-- 17
SELECT item_id, project_id, SUM(amount) FROM details_amount AS da 
GROUP BY da.item_id;

-- 9
SELECT item_id FROM details_amount AS da
	INNER JOIN suppliers AS s ON da.supplier_id = s.id
WHERE s.city = "Лондон";

-- 36
SELECT DISTINCT s1.supplier_id, s2.item_id
	FROM details_amount AS s1 
		JOIN details_amount AS s2 
			ON s1.supplier_id != s2.supplier_id 
WHERE (s1.item_id  != s2.item_id) ORDER BY s1.provider_id;
 



 
