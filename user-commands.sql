-- Show connected user:
SHOW USER;

-- Create a new user
CREATE USER username
IDENTIFIED BY password
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

-- Grant connect
GRANT CREATE SESSION TO username;