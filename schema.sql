-- Placement Management System Database Schema

-- Drop tables if they already exist (for clean initialization)
DROP TABLE IF EXISTS Applications;
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS Students;

-- Create Students Table
CREATE TABLE Students (
    StudentID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    Branch TEXT NOT NULL,
    CGPA REAL NOT NULL,
    ResumeLink TEXT
);

-- Create Companies Table
CREATE TABLE Companies (
    CompanyID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Industry TEXT,
    ContactEmail TEXT NOT NULL
);

-- Create Jobs Table
CREATE TABLE Jobs (
    JobID INTEGER PRIMARY KEY AUTOINCREMENT,
    CompanyID INTEGER NOT NULL,
    Role TEXT NOT NULL,
    Salary REAL NOT NULL,
    MinCGPA REAL NOT NULL,
    JobDescription TEXT,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID) ON DELETE CASCADE
);

-- Create Applications Table
CREATE TABLE Applications (
    ApplicationID INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentID INTEGER NOT NULL,
    JobID INTEGER NOT NULL,
    Status TEXT NOT NULL DEFAULT 'Applied', -- E.g., 'Applied', 'Shortlisted', 'Interviewing', 'Selected', 'Rejected'
    ApplicationDate DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID) ON DELETE CASCADE
);
