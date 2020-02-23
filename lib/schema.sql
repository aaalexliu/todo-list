CREATE TABLE todolists (
 id serial PRIMARY KEY,
 title text UNIQUE NOT NULL,
 username text NOT NULL
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  title text NOT NULL,
  done boolean NOT NULL DEFAULT false,
  username text NOT NULL,
  todolist_id integer  NOT NULL REFERENCES todolists(id) ON DELETE CASCADE
);

CREATE TABLE users (
  username text PRIMARY KEY,
  password text NOT NULL
);

INSERT INTO users (username, password)
  VALUES ('admin', '$2b$10$uC3lSZqheRZja2B.jBA8q.2s3hkEviwTuRWdw36tngJBkm1i/Llo6'),
         ('developer', '$2b$10$RIwuQnP.NKc1gJ5Ef08.dOSX8ibuEnDMziqJGr925nRM0LRhvCFN.'),
         ('somebody', 'knock-knock');