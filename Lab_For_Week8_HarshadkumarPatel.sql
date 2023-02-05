--1. One that can tell me the names and shifts of the librarians working not the first Monday, but the Monday after, and
SELECT librarian_fname,librarian_lname FROM data_table AS data_table 
LEFT JOIN librarian_master AS librarian_master ON librarian_master.librarian_id = data_table.librarian_id 
WHERE data_table.day_id = 11 And data_table.shift_id = 1
GROUP BY data_table .librarian_id;
--2. one that can tell me Beverly Cleary's assignments for that day.
SELECT lm.librarian_fname ,lm.librarian_lname ,am.assignment_name FROM data_table AS data_table 
LEFT JOIN librarian_master lm ON lm.librarian_id = data_table.librarian_id  
LEFT JOIN assignment_master  AS am ON am.assignment_id = data_table.assignment_id  
WHERE data_table.day_id = 11 And data_table.shift_id = 1 AND data_table.librarian_id = 103 
GROUP BY data_table.assignment_id;

