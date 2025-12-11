SELECT moduleID, building, room
FROM BUILDINGS
JOIN ROOMS ON BUILDINGS.building = ROOMS.building