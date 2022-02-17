import 'package:github_app/features/repositories/domain/entities/license_entity.dart';

extension LicenseDto on LicenseEntity {
  static fromJson(Map<String, dynamic> json) {
    return LicenseEntity(
      key: json['key'],
      name: json['name'],
      spdxId: json['spdx_id'],
      url: json['url'] ?? '',
      nodeId: json['node_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['name'] = name;
    _data['spdx_id'] = spdxId;
    _data['url'] = url;
    _data['node_id'] = nodeId;
    return _data;
  }
}
