PRAGMA journal_mode=WAL;

CREATE TABLE IF NOT EXISTS users (
  telegram_id INTEGER PRIMARY KEY,
  consent INTEGER DEFAULT 0,
  consent_at TEXT NULL,
  notify_enabled INTEGER DEFAULT 0,
  notify_consent_at TEXT NULL,
  name TEXT NULL,
  email TEXT NULL,
  role TEXT NULL,
  phone TEXT NULL,
  city TEXT NULL,
  created_at TEXT,
  updated_at TEXT
);

CREATE TABLE IF NOT EXISTS visit_requests (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  telegram_id INTEGER NOT NULL,
  name_snapshot TEXT NULL,
  role_snapshot TEXT NULL,
  city TEXT NOT NULL,
  contact_method TEXT NOT NULL,
  contact_value TEXT NULL,
  status TEXT DEFAULT 'new',
  created_at TEXT
);

CREATE TABLE IF NOT EXISTS collections (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  short_desc TEXT NULL,
  cover_photo_file_id TEXT NULL,
  is_active INTEGER DEFAULT 1,
  sort_order INTEGER DEFAULT 0,
  created_at TEXT,
  updated_at TEXT
);

CREATE TABLE IF NOT EXISTS sculptures (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  collection_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  artist TEXT NULL,
  year TEXT NULL,
  material TEXT NULL,
  dimensions TEXT NULL,
  description_short TEXT NULL,
  description_full TEXT NULL,
  status TEXT DEFAULT 'in_expo',
  is_featured INTEGER DEFAULT 0,
  published_at TEXT NULL,
  created_at TEXT,
  updated_at TEXT
);

CREATE TABLE IF NOT EXISTS sculpture_photos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sculpture_id INTEGER NOT NULL,
  file_id TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_sculptures_collection ON sculptures(collection_id);
CREATE INDEX IF NOT EXISTS idx_photos_sculpture ON sculpture_photos(sculpture_id);
CREATE INDEX IF NOT EXISTS idx_users_notify ON users(consent, notify_enabled, role);
