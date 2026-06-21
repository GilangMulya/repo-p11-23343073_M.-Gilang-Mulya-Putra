import '../datasources/remote_data_source.dart';
import '../datasources/local_data_source.dart';

class DataRepositoryImpl {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  DataRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<String> getData() async {
    try {
      final remoteData = await remoteDataSource.fetchData();
      await localDataSource.cacheData(remoteData);
      return remoteData;
    } catch (e) {
      final localData = await localDataSource.getCachedData();
      if (localData != null) return localData;
      throw Exception('Gagal mengambil data dari API dan Cache');
    }
  }
}
