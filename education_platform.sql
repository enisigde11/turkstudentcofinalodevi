
-- Members Tablosu
CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses Tablosu
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100)
);

-- Categories Tablosu
CREATE TABLE Categories (
    category_id SMALLINT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- CourseCategories (Ara tablo - Course ve Category arası ilişki)
CREATE TABLE CourseCategories (
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE,
    category_id SMALLINT REFERENCES Categories(category_id) ON DELETE CASCADE,
    PRIMARY KEY (course_id, category_id)
);

-- Enrollments Tablosu
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id) ON DELETE CASCADE,
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Certificates Tablosu
CREATE TABLE Certificates (
    certificate_id SERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE NOT NULL
);

-- CertificateAssignments Tablosu
CREATE TABLE CertificateAssignments (
    assignment_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id) ON DELETE CASCADE,
    certificate_id INT REFERENCES Certificates(certificate_id) ON DELETE CASCADE,
    assignment_date DATE
);

-- BlogPosts Tablosu
CREATE TABLE BlogPosts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INT REFERENCES Members(member_id) ON DELETE SET NULL
);
