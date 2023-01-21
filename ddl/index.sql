-- Create non unique B-tree index:
CREATE INDEX indexName ON tableName(col1, col2, ...);

-- Create unique B-tree index:
CREATE UNIQUE indexName ON tableName(col1, col2, ...);

-- Create bitmap index:
CREATE BITMAP indexName ON tableName(col1, col2, ...);

-- Reconstruct index:
ALTER INDEX indexName REBUILD; -- or drop and create index

-- Reconstruct index online (minimize locks):
ALTER INDEX indexName REBUILD ONLINE;

-- Remove index:
DROP INDEX indexName;
