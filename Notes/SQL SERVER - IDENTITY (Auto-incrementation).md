# SQL SERVER -IDENTITY (auto incrementation)
```sql
CREATE TABLE hr.person (
    person_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL
);
```

```sql
IDENTITY (start, step)
```