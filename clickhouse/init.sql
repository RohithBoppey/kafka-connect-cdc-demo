-- contains all the SQL queries
-- runs only on first start (when ./data/clickhouse is empty)

CREATE TABLE IF NOT EXISTS default.users
(
    name String,
    age UInt8,
    Aadhaar String,
    PAN String,
    mobile String
)
ENGINE = MergeTree()
ORDER BY name;

-- 10 random users; `number` is mixed into each rand() seed so every row/column differs
INSERT INTO default.users (name, age, Aadhaar, PAN, mobile)
SELECT
    concat(
        ['Amit', 'Priya', 'Rahul', 'Neha', 'Sanjay', 'Anjali', 'Vikram', 'Deepika', 'Rajesh', 'Kavita'][(rand(number) % 10) + 1],
        toString(rand(number + 1) % 9000 + 1000)
    ) AS name,
    (rand(number + 2) % 63) + 18 AS age,
    concat(
        leftPad(toString(rand(number + 3) % 9000 + 1000), 4, '0'), '-',
        leftPad(toString(rand(number + 4) % 9000 + 1000), 4, '0'), '-',
        leftPad(toString(rand(number + 5) % 9000 + 1000), 4, '0')
    ) AS Aadhaar,
    concat(
        ['ABCDE', 'FGHJK', 'LMNPQ', 'RSTUV', 'WXYZB'][(rand(number + 6) % 5) + 1],
        leftPad(toString(rand(number + 7) % 9000 + 1000), 4, '0'),
        ['A', 'F', 'C', 'P', 'Z'][(rand(number + 8) % 5) + 1]
    ) AS PAN,
    concat(
        ['6', '7', '8', '9'][(rand(number + 9) % 4) + 1],
        leftPad(toString(rand(number + 10) % 1000000000), 9, '0')
    ) AS mobile
FROM numbers(10);
