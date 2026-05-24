const LoadingSpinner = ({ size = 'large' }) => {
  const sizeClasses = {
    small: 'h-6 w-6',
    medium: 'h-10 w-10',
    large: 'h-16 w-16',
  };

  return (
    <div className="flex justify-center items-center min-h-[200px]">
      <div className={`animate-spin rounded-full border-b-4 border-primary-600 ${sizeClasses[size]}`}></div>
    </div>
  );
};

export default LoadingSpinner;
