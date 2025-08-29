# 🎨 AI Image Gallery

A complete full-stack AI-powered image gallery with React frontend, FastAPI backend, and Supabase integration.

## ✨ Features

- **🔐 Authentication**: Secure login/signup with Supabase Auth
- **📤 Image Upload**: Drag & drop multiple image upload with thumbnails
- **🤖 AI Analysis**: Automatic tag generation, descriptions, and color extraction using OpenAI Vision API
- **🔍 Smart Search**: Text search, similar image finding, and color filtering
- **📱 Responsive UI**: Modern, mobile-friendly interface

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ and npm
- Python 3.8+
- Supabase account
- OpenAI API key

### 1. Environment Setup

**Backend (.env)**:

```bash
cd backend
cp .env.example .env
# Edit .env with your keys:
# SUPABASE_URL=your-supabase-url
# SUPABASE_KEY=your-supabase-anon-key
# SUPABASE_SERVICE_KEY=your-supabase-service-key
# OPENAI_API_KEY=your-openai-api-key
```

**Frontend (.env)**:

```bash
cd frontend
cp .env.example .env
# Edit .env with your keys:
# REACT_APP_SUPABASE_URL=your-supabase-url
# REACT_APP_SUPABASE_ANON_KEY=your-supabase-anon-key
```

### 2. Database Setup

Follow the complete guide in [`DATABASE_SETUP.md`](DATABASE_SETUP.md) to:

- Create Supabase tables and policies
- Set up storage buckets
- Configure Row Level Security

### 3. Start the Application

**Backend**:

```bash
cd backend
py -m pip install -r requirements.txt
py -m uvicorn main:app --reload
# Server runs on http://localhost:8000
```

**Frontend**:

```bash
cd frontend
npm install
npm start
# App opens at http://localhost:3000
```

## 🏗️ Architecture

- **Frontend**: React 18 + TypeScript + Tailwind CSS
- **Backend**: FastAPI + Python 3.8+
- **Database**: Supabase PostgreSQL with Row Level Security
- **AI**: OpenAI Vision API for image analysis
- **Storage**: Local file system (configurable)

## 📁 Project Structure

```
├── frontend/           # React TypeScript app
├── backend/            # FastAPI Python server
├── docs/              # Documentation and scripts
├── DATABASE_SETUP.md  # Database configuration guide
└── README.md          # This file
```

## 🛠️ Development

The application supports:

- Hot reload for both frontend and backend
- TypeScript type checking
- Responsive design testing
- Real-time search with debouncing
- Background AI processing

## 📚 Additional Documentation

See the [`docs/`](docs/) folder for:

- Feature implementation status
- AI service comparison analysis
- Deployment guides
- Convenience scripts
- Development tools

## 🔧 Troubleshooting

1. **Backend issues**: Check `DATABASE_SETUP.md` for Python environment setup
2. **Database errors**: Ensure Supabase schema is properly created
3. **Frontend errors**: Verify Node.js version and npm dependencies
4. **AI analysis**: Confirm OpenAI API key is valid and has credits

---

**Status**: ✅ Production Ready | 🎯 100% Requirements Compliant
