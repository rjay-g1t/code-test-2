# 🎨 AI Image Gallery - Airbnb Style

A complete full-stack AI-powered image gallery with Airbnb-inspired design, featuring React frontend, FastAPI backend, and intelligent image analysis.

![AI Image Gallery](https://img.shields.io/badge/React-18-blue) ![FastAPI](https://img.shields.io/badge/FastAPI-Latest-green) ![TypeScript](https://img.shields.io/badge/TypeScript-5-blue) ![Python](https://img.shields.io/badge/Python-3.11+-green)

## ✨ Features

- 🎨 **Airbnb-Inspired UI** - Professional design system matching Airbnb's exact styling
- 🤖 **AI Image Analysis** - OpenAI Vision API for automatic descriptions and tagging
- 🔐 **Secure Authentication** - Supabase Auth with JWT tokens
- 📱 **Responsive Design** - Works perfectly on desktop and mobile
- 🔍 **Smart Search** - Text search and AI-powered similarity matching
- 🎯 **Color Filtering** - Filter images by dominant colors
- ⚡ **Fast Upload** - Drag & drop multiple file uploads
- 🚀 **Production Ready** - Docker deployment with health checks

## 🚀 Quick Start

### Windows
```bash
# Clone and run
git clone <repository>
cd ai-image-gallery
start.bat
```

### Linux/Mac
```bash
# Clone and run
git clone <repository>
cd ai-image-gallery
./start.sh
```

## 🏗️ Architecture

- **Frontend**: React 18 + TypeScript + Custom CSS (Airbnb Design System)
- **Backend**: FastAPI + Python 3.11+ + OpenAI Integration
- **Database**: Supabase PostgreSQL with Row Level Security
- **Authentication**: Supabase Auth (Email/Password)
- **AI**: OpenAI Vision API for image analysis
- **Storage**: Local filesystem with thumbnail generation

## 📋 Requirements

### Development
- **Node.js** 18+ 
- **Python** 3.11+
- **Git**

### Production
- **Docker** & **Docker Compose** (recommended)
- Or manual deployment with Node.js + Python

## ⚙️ Environment Setup

### 1. Copy Environment Files
```bash
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env
```

### 2. Configure Backend (.env)
```env
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_anon_key
SUPABASE_SERVICE_KEY=your_service_role_key
OPENAI_API_KEY=your_openai_api_key
```

### 3. Configure Frontend (.env)
```env
REACT_APP_API_URL=http://localhost:8001
REACT_APP_SUPABASE_URL=your_supabase_url
REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
```

## 🏭 Production Deployment

### Docker (Recommended)
```bash
# Build and deploy
docker-compose up --build -d

# Access the application
# Frontend: http://localhost
# Backend: http://localhost:8001
```

### Manual Deployment
See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed instructions.

## 🗂️ Project Structure

```
ai-image-gallery/
├── backend/                 # FastAPI backend
│   ├── main.py             # Application entry point
│   ├── models/             # Data models
│   ├── services/           # Business logic
│   ├── utils/              # Helper functions
│   └── requirements.txt    # Python dependencies
├── frontend/               # React frontend
│   ├── src/                # Source code
│   ├── public/             # Static assets
│   └── package.json        # Node dependencies
├── docker-compose.yml      # Container orchestration
├── start.bat              # Windows development
├── start.sh               # Unix development
└── DEPLOYMENT.md          # Deployment guide
```

## 🎨 Design System

The application features a comprehensive Airbnb-inspired design system:

- **Colors**: Exact Airbnb palette (#FF385C primary, professional grays)
- **Typography**: Cereal/Circular font families with proper hierarchy
- **Components**: Authentic button styles, form inputs, and cards
- **Layout**: Professional spacing and responsive grid system
- **Interactions**: Smooth animations and hover effects

## 📚 API Documentation

Once running, visit:
- **Interactive Docs**: http://localhost:8001/docs
- **OpenAPI Schema**: http://localhost:8001/openapi.json

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Airbnb** for design inspiration
- **OpenAI** for Vision API
- **Supabase** for backend services
- **React** and **FastAPI** communities
# code-test-2
