DROP TABLE IF EXISTS users;

/*NEVER store passwords in clear text as it's done here!!!*/
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  role ENUM('admin', 'consumer')
);

INSERT INTO users (name, email, password, role)
VALUES
('admin', 'admin@mail.fr', 'complexP@ssword???', 'admin'),
('yanis', 'yanis@mail.fr', 'LeMotPasseCompliqué', 'consumer'),
('lucas', 'lucas@mail.fr', 'LeMotPasseCompliqué2', 'consumer'),
('jules', 'jules@mail.fr', 'LeMotPasseCompliqué3', 'consumer'),
('haci', 'haci@mail.fr', 'LeMotPasseCompliqué4', 'consumer'),
('alexandra', 'alexandra@mail.fr', 'LeMotPasseCompliqué5', 'consumer');
