/// 数据实体信息提供类,在网络层生成数据实体对象的时候会在这个map中查询相关的的对象
class EntityProvider {
  static final entityMap = <String, EntityCreator>{
    // "List<HomeBannerEntity>": HomeBannerEntity.fromJson,
  };
}

/// 对象转换方法
typedef EntityCreator<T> = T Function(Map<String, dynamic> json);
