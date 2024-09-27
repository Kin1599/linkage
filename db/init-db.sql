CREATE OR REPLACE TABLE table_results (
 id_is1 Array(UUID),
 id_is2 Array(UUID),
 id_is3 Array(UUID)
) ENGINE = MergeTree()
ORDER BY id_is1;