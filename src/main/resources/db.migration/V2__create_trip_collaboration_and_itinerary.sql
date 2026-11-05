CREATE TABLE trip_members
(
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id    BIGINT      NOT NULL,
    user_id    BIGINT      NOT NULL,
    role       VARCHAR(20) NOT NULL,
    joined_at  TIMESTAMP(6) NOT NULL,
    created_at TIMESTAMP(6) NOT NULL,
    updated_at TIMESTAMP(6) NOT NULL,
    CONSTRAINT uk_trip_members_trip_user UNIQUE (trip_id, user_id),
    CONSTRAINT fk_trip_members_user FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_trip_members_trip FOREIGN KEY (trip_id) REFERENCES trips (id)
);

CREATE TABLE trip_invitations
(
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id       BIGINT       NOT NULL,
    invited_by_id BIGINT       NOT NULL,
    invitee_email VARCHAR(150) NOT NULL,
    proposed_role VARCHAR(20)  NOT NULL,
    status        VARCHAR(20)  NOT NULL,
    expires_at    TIMESTAMP(6) NOT NULL,
    created_at    TIMESTAMP(6) NOT NULL,
    updated_at    TIMESTAMP(6) NOT NULL,
    CONSTRAINT fk_trip_invitations_trip FOREIGN KEY (trip_id) REFERENCES trips (id),
    CONSTRAINT fk_trip_invitations_invited_by FOREIGN KEY (invited_by_id) REFERENCES users (id)
);

CREATE TABLE itineraries
(
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id        BIGINT NOT NULL,
    itinerary_date DATE   NOT NULL,
    notes          VARCHAR(1000),
    created_at     TIMESTAMP(6) NOT NULL,
    updated_at     TIMESTAMP(6) NOT NULL,
    CONSTRAINT uk_itineraries_trip_date UNIQUE (trip_id, itinerary_date),
    CONSTRAINT fk_itineraries_trip FOREIGN KEY (trip_id) REFERENCES trips (id)
);

CREATE TABLE activities
(
    id             BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    itinerary_id   BIGINT       NOT NULL,
    title          VARCHAR(150) NOT NULL,
    description    VARCHAR(1000),
    location       VARCHAR(250),
    start_time     TIME,
    end_time       TIME,
    estimated_cost DECIMAL(12, 2),
    display_order  INT          NOT NULL,
    created_at     TIMESTAMP(6) NOT NULL,
    updated_at     TIMESTAMP(6) NOT NULL,
    CONSTRAINT fk_activities_itinerary FOREIGN KEY (itinerary_id) REFERENCES itineraries (id)
);

CREATE INDEX idx_trip_members_user_id
    ON trip_members (user_id);

CREATE INDEX idx_trip_invitations_email_status
    ON trip_invitations (invitee_email, status);

CREATE INDEX idx_itineraries_trip_date
    ON itineraries (trip_id, itinerary_date);

CREATE INDEX idx_activities_itinerary_display_order
    ON activities (itinerary_id, display_order);