SELECT Listings.address FROM (Listings)
WHERE Listings.address = ANY (SELECT House.address FROM (House));

SELECT Listings.address,mlsNumber FROM (Listings)
WHERE Listings.address = ANY (SELECT House.address FROM (House));

SELECT House.address FROM (House)
WHERE House.address = ANY (SELECT Listings.address FROM (Listings))
AND bedrooms=3 AND bathrooms=2;

SELECT Property.address, price FROM (Property,House)
WHERE Property.address = House.address
AND bedrooms=3 AND bathrooms=2 AND price >= 100000 AND price <=250000
ORDER BY price DESC;

SELECT Listings.address, price FROM (Listings,Property)
WHERE Listings.address = ANY (SELECT address FROM (BusinessProperty) WHERE type= 'office space' )
AND Listings.address = Property.address
ORDER BY price DESC;

SELECT Agent.agentId, Agent.name, phone, dateStarted, Firm.name FROM (Agent, Firm)
WHERE Agent.firmId = id;

SELECT * FROM (Property)
WHERE address = ANY (SELECT Listings.address FROM (Listings) WHERE agentId=7);

SELECT Agent.name, Buyer.name FROM (Agent, Buyer, Works_With)
WHERE Agent.agentId=Works_With.agentID AND Buyer.id=buyerId
ORDER BY Agent.name ASC;

SELECT newAgent, COUNT(newBuyer) FROM(
    SELECT Agent.agentId AS newAgent ,buyerId AS newBuyer FROM(Agent,Works_With) 
WHERE Agent.agentId=Works_With.agentID) AS Pairs
GROUP BY newAgent;

SELECT DISTINCT Property.address,ownerName,price FROM (Property,House) 
WHERE bathrooms = ANY (SELECT bathrooms FROM (Buyer) WHERE id=11)
AND bedrooms = ANY (SELECT bedrooms FROM (Buyer) WHERE id=11)
AND price <= ANY (SELECT maximumPreferredPrice FROM (Buyer)) 
AND price >= ANY (SELECT minimumPreferredPrice FROM (Buyer))
AND Property.address=House.address
ORDER BY price DESC;
