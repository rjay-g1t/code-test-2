import React, { useState, useEffect } from 'react';
import { MagnifyingGlassIcon, XMarkIcon } from '@heroicons/react/24/outline';

interface SearchBarProps {
  onSearch: (query: string) => void;
  onClear: () => void;
  placeholder?: string;
  isLoading?: boolean;
}

export const SearchBar: React.FC<SearchBarProps> = ({
  onSearch,
  onClear,
  placeholder = 'Search by tags or description...',
  isLoading = false,
}) => {
  const [query, setQuery] = useState('');
  const [isFocused, setIsFocused] = useState(false);

  useEffect(() => {
    const timeoutId = setTimeout(() => {
      if (query.trim()) {
        onSearch(query.trim());
      } else {
        onClear();
      }
    }, 300); // Debounce search

    return () => clearTimeout(timeoutId);
  }, [query, onSearch, onClear]);

  const handleClear = () => {
    setQuery('');
    onClear();
  };

  return (
    <div className="search-container">
      <div className={`search-input-wrapper ${isFocused ? 'focused' : ''}`}>
        <MagnifyingGlassIcon className="search-icon" />
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={() => setIsFocused(true)}
          onBlur={() => setIsFocused(false)}
          placeholder={placeholder}
          className="search-input-field"
          disabled={isLoading}
        />
        {query && (
          <button
            onClick={handleClear}
            className="search-clear-button"
            type="button"
          >
            <XMarkIcon style={{ width: '16px', height: '16px' }} />
          </button>
        )}
        {isLoading && (
          <div className="search-loading">
            <div className="loading-spinner"></div>
          </div>
        )}
      </div>
    </div>
  );
};
