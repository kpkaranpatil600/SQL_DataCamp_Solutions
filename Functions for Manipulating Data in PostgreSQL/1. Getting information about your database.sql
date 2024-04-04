SELECT *
---TABLES system database
FROM INFORMATION_SCHEMA.TABLES

---filter by schema
WHERE table_schema = 'public'

---filter by table
WHERE table_name = 'actor'
