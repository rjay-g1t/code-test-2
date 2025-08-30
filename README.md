# AI Image Gallery - Local Setup Guide

A modern AI-powered image gallery with automatic tagging, smart search, and intelligent organization.

## 🚀 Quick Start Guide

Follow these steps to get the AI Image Gallery running on your local machine.

### Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (version 16 or higher) - [Download here](https://nodejs.org/)
- **Python** (version 3.8 or higher) - [Download here](https://python.org/)
- **npm** (comes with Node.js)
- **Git** - [Download here](https://git-scm.com/)

### Required API Keys

You'll need accounts and API keys for:

- **OpenAI API** - [Get API key](https://platform.openai.com/api-keys)
- **Supabase** - [Create project](https://supabase.com/)

## 📥 Installation Steps

### Step 1: Clone the Repository

```bash
git clone <your-repository-url>
cd ai-image-gallery
```

### Step 2: Install Root Dependencies

```bash
npm install
```

### Step 3: Set Up Backend Environment

#### 3.1 Create Python Virtual Environment

```bash
cd backend
python -m venv .venv
```

#### 3.2 Activate Virtual Environment

**Windows:**

```cmd
.venv\Scripts\activate
```

**Linux/Mac:**

```bash
source .venv/bin/activate
```

#### 3.3 Install Python Dependencies

```bash
pip install -r requirements.txt
```

#### 3.4 Create Backend Environment File

Create a file called `.env` in the `backend/` directory:

```bash
# In backend/.env
OPENAI_API_KEY=your_openai_api_key_here
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

**To get your Supabase credentials:**

1. Go to [Supabase Dashboard](https://supabase.com/dashboard)
2. Select your project
3. Go to Settings → API
4. Copy the Project URL and API keys

### Step 4: Set Up Frontend Environment

#### 4.1 Install Frontend Dependencies

```bash
cd ../frontend
npm install
```

#### 4.2 Create Frontend Environment File

Create a file called `.env` in the `frontend/` directory:

```bash
# In frontend/.env
REACT_APP_SUPABASE_URL=your_supabase_project_url
REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
REACT_APP_API_URL=http://localhost:8000
```

### Step 5: Set Up Database

#### 5.1 Create Tables in Supabase

1. Go to your Supabase Dashboard
2. Navigate to SQL Editor
3. Run the SQL scripts from `backend/database/`:
   - First run `complete_schema.sql`
   - Then run `rls_policies.sql`

#### 5.2 Set Up Storage Bucket

1. In Supabase Dashboard, go to Storage
2. Create a new bucket called `images`
3. Make it public or configure appropriate policies

## 🏃‍♂️ Running the Application

### Option A: Run Both Frontend and Backend (Recommended)

From the root directory:

```bash
npm start
```

This will start both servers concurrently:

- **Backend**: http://localhost:8000
- **Frontend**: http://localhost:3000

### Option B: Run Servers Separately

#### Start Backend Only

```bash
cd backend
# Activate virtual environment first (see Step 3.2)
python main.py
```

Backend will be available at: http://localhost:8000

#### Start Frontend Only

```bash
cd frontend
npm start
```

Frontend will be available at: http://localhost:3000

## 🧪 Testing the Setup

### 1. Check Backend Health

Visit: http://localhost:8000/health

You should see: `{"status": "healthy"}`

### 2. Check API Documentation

Visit: http://localhost:8000/docs

You should see the FastAPI interactive documentation.

### 3. Test Frontend

Visit: http://localhost:3000

You should see the AI Image Gallery interface.

### 4. Test Image Upload

1. Create an account or log in
2. Try uploading an image
3. Check if AI analysis works
4. Test the search functionality

## 🛠️ Development Commands

### Backend Development

```bash
cd backend
source .venv/bin/activate  # or .venv\Scripts\activate on Windows
python main.py
```

### Frontend Development

```bash
cd frontend
npm start
```

### Build for Production

```bash
# Frontend build
cd frontend
npm run build

# Backend is production-ready as-is
```

## 🔧 Troubleshooting

### Common Issues and Solutions

#### 1. Port Already in Use

If port 3000 or 8000 is already in use:

```bash
# Kill processes on specific ports
# Windows
netstat -ano | findstr :3000
taskkill /PID <process_id> /F

# Linux/Mac
lsof -ti:3000 | xargs kill -9
```

#### 2. Python Virtual Environment Issues

```bash
# Recreate virtual environment
cd backend
rm -rf .venv
python -m venv .venv
# Activate and reinstall dependencies
```

#### 3. Node Modules Issues

```bash
# Clear npm cache and reinstall
cd frontend
rm -rf node_modules package-lock.json
npm install
```

#### 4. Environment Variables Not Loading

- Ensure `.env` files are in the correct directories
- Check that variable names match exactly
- Restart the servers after changing environment variables

#### 5. Database Connection Issues

- Verify Supabase credentials in `.env` files
- Check that RLS policies are set up correctly
- Ensure database tables are created

#### 6. OpenAI API Issues

- Verify your OpenAI API key is valid
- Check your OpenAI account has sufficient credits
- Ensure the API key has correct permissions

## 📁 Project Structure

```
ai-image-gallery/
├── backend/                 # FastAPI backend
│   ├── main.py             # Main application
│   ├── models/             # Data models
│   ├── services/           # Business logic
│   ├── utils/              # Utilities
│   ├── database/           # SQL scripts
│   ├── uploads/            # Local file storage
│   ├── requirements.txt    # Python dependencies
│   └── .env               # Backend environment variables
├── frontend/               # React frontend
│   ├── src/               # Source code
│   ├── public/            # Static assets
│   ├── package.json       # Dependencies
│   └── .env              # Frontend environment variables
├── package.json           # Root dependencies
├── setup.bat/.sh         # Setup scripts
└── README.md             # This file
```

## 🎯 Next Steps

After successful setup:

1. **Upload some images** to test AI analysis
2. **Try the search functionality** with keywords
3. **Explore the AI-generated tags** and descriptions
4. **Customize the UI** to match your preferences
5. **Deploy to production** when ready

## 🤝 Need Help?

If you encounter any issues:

1. Check the troubleshooting section above
2. Verify all environment variables are set correctly
3. Ensure all dependencies are installed
4. Check the console logs for error messages
5. Create an issue in the repository

## ✨ Features

Once running, you'll have access to:

- **AI-Powered Image Analysis** - Automatic descriptions and tags
- **Smart Search** - Find images by content, tags, or filename
- **Modern UI** - Clean, responsive interface
- **Fast Performance** - Local search with debouncing
- **Secure Authentication** - User accounts and data protection

Happy coding! 🚀
