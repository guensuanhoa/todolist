class DataRequest<T> {
  Function(T) onSuccess;
  Function(dynamic error) onFailure;
  Function() onRetry;

  DataRequest({
    this.onSuccess,
    this.onFailure,
    this.onRetry,
  });
}
