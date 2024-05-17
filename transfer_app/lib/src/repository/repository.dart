import '../data/remote/remote_service.dart';
import '../domain/entity/transfer_entity.dart';
import '../mapper/get_transfers_mapper.dart';

abstract class Repository {
  Future<List<TransferEntity>> getAllTransfers();
}

class RepositoryImpl implements Repository {
  const RepositoryImpl(this._remoteService);

  final RemoteService _remoteService;

  @override
  Future<List<TransferEntity>> getAllTransfers() async {
    final transfers = await _remoteService.getAllTransfers();
    return transfers.map((model) => mapToTransferEntity(model)).toList();
  }
}
