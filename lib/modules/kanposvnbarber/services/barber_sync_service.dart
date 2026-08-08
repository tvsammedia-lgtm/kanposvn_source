class BarberSyncService {
  final String apiEndpoint;

  BarberSyncService({this.apiEndpoint = 'https://vercel.api/sync'});

  Future<void> syncUp() async {
    // TODO: Thực hiện lấy dữ liệu từ Isar (isSynced == false) và đẩy lên Cloud
    print('Syncing up barber data to cloud...');
  }

  Future<void> syncDown() async {
    // TODO: Lấy dữ liệu mới từ Cloud về và lưu vào Isar
    print('Syncing down barber data from cloud...');
  }
}
