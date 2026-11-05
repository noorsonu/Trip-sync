
CREATE TABLE users(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    status VARCHAR (20) NOT NULL,
    createdAt TIMESTAMP(6) NOT NULL,
    updatedAt TIMESTAMP (6) NOT NULL,
    CONSTRAINT uk_users_email UNIQUE (email)
);

CREATE TABLE trips(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR (150) NOT NULL,
    destination VARCHAR (100) NOT NULL,
    description VARCHAR(1000),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    budget DECIMAL (12,2),
    status VARCHAR (20) NOT NULL,
    owner_id BIGINT NOT NULL,
    createdAt TIMESTAMP(6) NOT NULL,
    updatedAt TIMESTAMP (6) NOT NULL,
    CONSTRAINT fk_trips_owner
    FOREIGN KEY (owner_id)
    REFERENCES users(id)
);