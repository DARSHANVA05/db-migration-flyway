-- Set minimum age to 18 for players with age < 18
UPDATE PLAYER
SET age = 18
WHERE age < 18;
