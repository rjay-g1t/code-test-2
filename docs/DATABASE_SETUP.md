# Database Setup Instructions

## Overview

This document provides step-by-step instructions for setting up the Supabase database for the AI Image Gallery application.

## Prerequisites

- Supabase account created
- Project created in Supabase
- Access to Supabase SQL Editor

## Setup Steps

### 1. Environment Configuration

Make sure your `.env` files are configured with the correct Supabase credentials:

**Backend (.env):**

```
SUPABASE_URL=your-supabase-url
SUPABASE_KEY=your-supabase-anon-key
SUPABASE_SERVICE_KEY=your-supabase-service-key
OPENAI_API_KEY=your-openai-api-key
```

**Frontend (.env):**

```
REACT_APP_SUPABASE_URL=your-supabase-url
REACT_APP_SUPABASE_ANON_KEY=your-supabase-anon-key
```

### 2. Database Schema Creation

#### Step 1: Run Complete Schema

1. Open Supabase Dashboard
2. Go to SQL Editor
3. Copy the contents of `backend/database/complete_schema.sql`
4. Paste and execute the entire script

This will create:

- `images` table with all required columns
- `image_metadata` table for AI-generated data
- Row Level Security (RLS) policies
- Indexes for performance
- Full-text search function

#### Step 2: Verify Tables Created

Run this query to verify tables exist:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name IN ('images', 'image_metadata');
```

### 3. Storage Setup

#### Step 1: Create Storage Bucket

1. Go to Storage in Supabase Dashboard
2. Create a new bucket named `image-uploads`
3. Set it to public if you want direct access to images

#### Step 2: Storage Policies

```sql
-- Allow authenticated users to upload
CREATE POLICY "Users can upload images" ON storage.objects
  FOR INSERT WITH CHECK (
    bucket_id = 'image-uploads'
    AND auth.role() = 'authenticated'
  );

-- Allow public read access
CREATE POLICY "Public can view images" ON storage.objects
  FOR SELECT USING (bucket_id = 'image-uploads');

-- Allow users to delete their own images
CREATE POLICY "Users can delete their images" ON storage.objects
  FOR DELETE USING (
    bucket_id = 'image-uploads'
    AND auth.uid()::text = (storage.foldername(name))[1]
  );
```

### 4. Authentication Setup

Authentication is handled automatically by Supabase Auth. The application supports:

- Email/password registration
- Email/password login
- Automatic session management
- Protected routes

### 5. Testing Database Connection

#### Backend Setup ✅

First, install the backend dependencies:

```bash
cd backend
py -m pip install -r requirements.txt
```

#### Backend Test ✅

Run the FastAPI backend and check the health endpoint:

```bash
cd backend
py -m uvicorn main:app --reload
# Visit: http://localhost:8000/health
```

**Alternative:** Use the startup script: `start-backend.bat`

#### Frontend Test

Run the React frontend:

```bash
cd frontend
npm install  # First time only
npm start
# Visit: http://localhost:3000
```

**Alternative:** Use the startup script: `start-frontend.bat`

### 6. Common Issues

#### "Relation does not exist" Error

- Ensure you ran the complete schema SQL file
- Check that tables were created successfully
- Verify you're connected to the correct database

#### RLS Policy Issues

- Make sure authentication is working
- Check that policies are properly created
- Verify user is authenticated when accessing data

#### Search Not Working

- Ensure the search function was created
- Check that GIN indexes are properly built
- Verify search endpoints are working

### 7. Data Verification

After setup, you can test with sample data:

```sql
-- Insert test image (replace with actual user_id)
INSERT INTO images (
  filename,
  original_filename,
  file_size,
  mime_type,
  user_id,
  upload_date
) VALUES (
  'test-image.jpg',
  'My Test Image.jpg',
  1024000,
  'image/jpeg',
  'your-user-id-here',
  NOW()
);
```

### 8. Production Considerations

- Enable RLS on all tables ✅
- Set up proper backup strategy
- Monitor query performance
- Set up logging and monitoring
- Configure rate limiting
- Implement proper error handling

## Troubleshooting

If you encounter issues:

1. Check Supabase logs in the dashboard
2. Verify environment variables are correct
3. Ensure tables and policies exist
4. Test authentication flow
5. Check network connectivity

## Next Steps

After database setup:

1. Test image upload functionality
2. Verify AI analysis is working
3. Test search functionality
4. Check responsive design
5. Deploy to production

---

For additional help, refer to:

- `FEATURE_STATUS.md` - Feature compliance checklist
- `AI_SERVICE_COMPARISON.md` - AI service documentation
- Supabase documentation
- FastAPI documentation
- React documentation
