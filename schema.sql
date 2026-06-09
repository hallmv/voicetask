-- Run this in your Supabase SQL editor:
-- https://supabase.com/dashboard/project/uwxdmjqdfruegjbfkhih/sql

CREATE TABLE IF NOT EXISTS tasks (
  id            BIGSERIAL PRIMARY KEY,
  title         TEXT        NOT NULL,
  category      TEXT        NOT NULL DEFAULT 'work',
  tags          TEXT[]               DEFAULT '{}',
  priority      TEXT        NOT NULL DEFAULT 'medium',
  due_date      DATE,
  time_estimate INTEGER,
  notes         TEXT                 DEFAULT '',
  links         JSONB                DEFAULT '[]',
  attachments   JSONB                DEFAULT '[]',
  recurring     TEXT,
  completed     BOOLEAN     NOT NULL DEFAULT FALSE,
  created_at    TIMESTAMPTZ          DEFAULT NOW(),
  updated_at    TIMESTAMPTZ          DEFAULT NOW()
);

-- Row Level Security (required for anon key access)
ALTER TABLE tasks ENABLE ROW LEVEL SECURITY;

-- Allow full public access (single-user app, no auth)
CREATE POLICY "public_access" ON tasks
  FOR ALL
  USING (true)
  WITH CHECK (true);
