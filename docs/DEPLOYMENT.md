# 🚀 AI Image Gallery - Deployment Guide

## 📋 Quick Start (Development)

### Windows

1. Run `start.bat` - This will:
   - Set up Python virtual environment
   - Install all dependencies
   - Start backend on http://localhost:8001
   - Start frontend on http://localhost:3000

### Linux/Mac

1. Run `./start.sh` - Similar to Windows but for Unix systems

## 🏗️ Production Build

### Option 1: Manual Build

1. Run `build.bat` (Windows) to create production builds
2. Frontend build will be in `frontend/build/`
3. Backend is production-ready

### Option 2: Docker Deployment

```bash
# Build and run with Docker Compose
docker-compose up --build -d

# Access the app
# Frontend: http://localhost
# Backend API: http://localhost:8001
# API Documentation: http://localhost:8001/docs
```

## 🔧 Environment Setup

### Required Environment Variables

#### Backend (.env in backend/)

```env
# Supabase Configuration
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_anon_key
SUPABASE_SERVICE_KEY=your_service_role_key

# OpenAI Configuration
OPENAI_API_KEY=your_openai_api_key

# App Configuration
UPLOAD_DIR=./uploads
ENVIRONMENT=development
```

#### Frontend (.env in frontend/)

```env
REACT_APP_API_URL=http://localhost:8001
REACT_APP_SUPABASE_URL=your_supabase_url
REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
```

## 📦 Dependencies

### Backend Requirements

- Python 3.11+
- FastAPI
- Uvicorn
- OpenAI
- Supabase
- Pillow (PIL)
- python-multipart

### Frontend Requirements

- Node.js 18+
- React 18
- TypeScript
- Custom CSS (Airbnb-inspired)

## 🏭 Production Deployment

### Backend Deployment

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --host 0.0.0.0 --port 8001 --workers 4
```

### Frontend Deployment

```bash
cd frontend
npm install
npm run build
# Serve build/ folder with nginx or your preferred web server
```

### Docker Deployment

```bash
# Production deployment
docker-compose -f docker-compose.yml up -d

# View logs
docker-compose logs -f

# Scale services
docker-compose up -d --scale backend=2
```

## 🔒 Security Considerations

1. **Environment Variables**: Never commit .env files
2. **CORS**: Configure proper CORS origins for production
3. **Authentication**: Uses Supabase Auth with JWT tokens
4. **File Uploads**: Validates file types and sizes
5. **Rate Limiting**: Consider adding rate limiting for production

## 📊 Monitoring

- Health check endpoint: `GET /health`
- API documentation: `http://localhost:8001/docs`
- Frontend metrics available in browser dev tools

## 🗂️ Project Structure

```
ai-image-gallery/
├── backend/
│   ├── main.py              # FastAPI app
│   ├── requirements.txt     # Python dependencies
│   ├── Dockerfile          # Backend container
│   ├── models/             # Data models
│   ├── services/           # Business logic
│   └── utils/              # Helper functions
├── frontend/
│   ├── src/                # React source code
│   ├── public/             # Static assets
│   ├── package.json        # Node dependencies
│   ├── Dockerfile          # Frontend container
│   └── nginx.conf          # Nginx config
├── docker-compose.yml      # Container orchestration
├── start.bat              # Windows development start
├── build.bat              # Production build script
└── README.md              # This file
```

## 🎨 Features

- ✅ Airbnb-inspired UI design
- ✅ AI-powered image analysis
- ✅ User authentication
- ✅ Image upload and management
- ✅ Search and filtering
- ✅ Responsive design
- ✅ Production-ready deployment
