import React, { useState, useEffect, useCallback } from 'react';
import { Header } from '../components/Header';
import { UploadZone } from '../components/UploadZone';
import { SearchBar } from '../components/SearchBar';
import { ImageGrid } from '../components/ImageGrid';
import { ImageModal } from '../components/ImageModal';
import { ImageItem } from '../types';
import { apiService } from '../services/api';

export const Gallery: React.FC = () => {
  const [images, setImages] = useState<ImageItem[]>([]);
  const [loading, setLoading] = useState(false);
  const [selectedImage, setSelectedImage] = useState<ImageItem | null>(null);
  const [currentView, setCurrentView] = useState<
    'all' | 'search' | 'similar' | 'color'
  >('all');
  const [currentQuery, setCurrentQuery] = useState('');

  const loadImages = useCallback(async () => {
    setLoading(true);
    try {
      const fetchedImages = await apiService.getImages();
      setImages(fetchedImages);
      setCurrentView('all');
    } catch (error) {
      console.error('Failed to load images:', error);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadImages();
  }, [loadImages]);

  const handleUploadComplete = () => {
    loadImages();
  };

  const handleSearch = useCallback(
    async (query: string) => {
      if (query.trim() === '') {
        loadImages();
        return;
      }

      setLoading(true);
      setCurrentQuery(query);
      try {
        const searchResults = await apiService.searchImages(query);
        setImages(searchResults.images);
        setCurrentView('search');
      } catch (error) {
        console.error('Search failed:', error);
      } finally {
        setLoading(false);
      }
    },
    [loadImages]
  );

  const handleClearSearch = useCallback(() => {
    setCurrentQuery('');
    loadImages();
  }, [loadImages]);

  const handleSimilarImages = (similarImages: ImageItem[]) => {
    setImages(similarImages);
    setCurrentView('similar');
  };

  const handleColorFilter = (colorImages: ImageItem[]) => {
    setImages(colorImages);
    setCurrentView('color');
  };

  const getViewTitle = () => {
    switch (currentView) {
      case 'search':
        return `Search results for "${currentQuery}"`;
      case 'similar':
        return 'Similar images';
      case 'color':
        return 'Color filtered images';
      default:
        return 'All images';
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <Header />

      <main className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="px-4 py-6 sm:px-0">
          {/* Upload Zone */}
          <div className="mb-8">
            <h2 className="text-lg font-medium text-gray-900 mb-4">
              Upload Images
            </h2>
            <UploadZone onUploadComplete={handleUploadComplete} />
          </div>

          {/* Search */}
          <div className="mb-8">
            <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
              <div>
                <h2 className="text-lg font-medium text-gray-900">
                  {getViewTitle()}
                </h2>
                <p className="text-sm text-gray-600">{images.length} images</p>
              </div>

              <div className="flex items-center gap-4">
                <SearchBar
                  onSearch={handleSearch}
                  onClear={handleClearSearch}
                  isLoading={loading}
                />
                {currentView !== 'all' && (
                  <button
                    onClick={loadImages}
                    className="px-4 py-2 text-sm font-medium text-indigo-600 bg-white border border-indigo-600 rounded-md hover:bg-indigo-50"
                  >
                    Show All
                  </button>
                )}
              </div>
            </div>
          </div>

          {/* Image Grid */}
          <ImageGrid
            images={images}
            onImageClick={setSelectedImage}
            loading={loading}
          />

          {/* Pagination could be added here */}

          {/* Load more button for simplicity */}
          {!loading && images.length > 0 && images.length % 20 === 0 && (
            <div className="mt-8 text-center">
              <button
                onClick={() => {
                  // Load more images logic would go here
                  console.log('Load more images');
                }}
                className="px-6 py-2 text-sm font-medium text-white bg-indigo-600 rounded-md hover:bg-indigo-700"
              >
                Load More
              </button>
            </div>
          )}
        </div>
      </main>

      {/* Image Modal */}
      {selectedImage && (
        <ImageModal
          image={selectedImage}
          onClose={() => setSelectedImage(null)}
          onSimilarImages={handleSimilarImages}
          onColorFilter={handleColorFilter}
        />
      )}
    </div>
  );
};
