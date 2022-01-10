// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'core/models/product_model.dart';
import 'core/models/user_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8589052386386415030),
      name: 'Market',
      lastPropertyId: const IdUid(3, 7402270574866273032),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4545299448187115517),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2845880362545708293),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7402270574866273032),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'productElement', srcEntity: 'ProductElement', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 6482807724286733120),
      name: 'ProductElement',
      lastPropertyId: const IdUid(8, 6026185898087695866),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 834411817067052528),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 5555049391915661910),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2326377184377449426),
            name: 'price',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4468656951562382323),
            name: 'rate',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3647054194328066858),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8034198478270214221),
            name: 'imageUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7062877717473568914),
            name: 'count',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6026185898087695866),
            name: 'marketId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 6619731454828555034),
            relationTarget: 'Market')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5860345452715664718),
      name: 'User',
      lastPropertyId: const IdUid(7, 533931192156276800),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6838990546750879396),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7751195177601746353),
            name: 'isLog',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4165462413696803),
            name: 'userName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6647354591428286671),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8475696885033359934),
            name: 'fullName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6206052698883209596),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 533931192156276800),
            name: 'city',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 5860345452715664718),
      lastIndexId: const IdUid(1, 6619731454828555034),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Market: EntityDefinition<Market>(
        model: _entities[0],
        toOneRelations: (Market object) => [],
        toManyRelations: (Market object) => {
              RelInfo<ProductElement>.toOneBacklink(8, object.id,
                      (ProductElement srcObject) => srcObject.market):
                  object.productElement
            },
        getId: (Market object) => object.id,
        setId: (Market object, int id) {
          object.id = id;
        },
        objectToFB: (Market object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Market(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              address: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8));
          InternalToManyAccess.setRelInfo(
              object.productElement,
              store,
              RelInfo<ProductElement>.toOneBacklink(
                  8, object.id, (ProductElement srcObject) => srcObject.market),
              store.box<Market>());
          return object;
        }),
    ProductElement: EntityDefinition<ProductElement>(
        model: _entities[1],
        toOneRelations: (ProductElement object) => [object.market],
        toManyRelations: (ProductElement object) => {},
        getId: (ProductElement object) => object.id,
        setId: (ProductElement object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field ProductElement.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (ProductElement object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final descriptionOffset = fbb.writeString(object.description);
          final imageUrlOffset = fbb.writeString(object.imageUrl);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.price);
          fbb.addFloat64(3, object.rate);
          fbb.addOffset(4, descriptionOffset);
          fbb.addOffset(5, imageUrlOffset);
          fbb.addInt64(6, object.count);
          fbb.addInt64(7, object.market.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ProductElement(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              price: const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              rate:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0),
              description:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              imageUrl:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 14, ''),
              count:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0));
          object.market.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          object.market.attach(store);
          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[2],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final userNameOffset = object.userName == null
              ? null
              : fbb.writeString(object.userName!);
          final passwordOffset = object.password == null
              ? null
              : fbb.writeString(object.password!);
          final fullNameOffset = object.fullName == null
              ? null
              : fbb.writeString(object.fullName!);
          final phoneNumberOffset = object.phoneNumber == null
              ? null
              : fbb.writeString(object.phoneNumber!);
          final cityOffset =
              object.city == null ? null : fbb.writeString(object.city!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.isLog);
          fbb.addOffset(2, userNameOffset);
          fbb.addOffset(3, passwordOffset);
          fbb.addOffset(4, fullNameOffset);
          fbb.addOffset(5, phoneNumberOffset);
          fbb.addOffset(6, cityOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              userName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              password: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              fullName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              phoneNumber: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              city: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              isLog: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 6, false));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Market] entity fields to define ObjectBox queries.
class Market_ {
  /// see [Market.id]
  static final id = QueryIntegerProperty<Market>(_entities[0].properties[0]);

  /// see [Market.name]
  static final name = QueryStringProperty<Market>(_entities[0].properties[1]);

  /// see [Market.address]
  static final address =
      QueryStringProperty<Market>(_entities[0].properties[2]);
}

/// [ProductElement] entity fields to define ObjectBox queries.
class ProductElement_ {
  /// see [ProductElement.id]
  static final id =
      QueryIntegerProperty<ProductElement>(_entities[1].properties[0]);

  /// see [ProductElement.name]
  static final name =
      QueryStringProperty<ProductElement>(_entities[1].properties[1]);

  /// see [ProductElement.price]
  static final price =
      QueryIntegerProperty<ProductElement>(_entities[1].properties[2]);

  /// see [ProductElement.rate]
  static final rate =
      QueryDoubleProperty<ProductElement>(_entities[1].properties[3]);

  /// see [ProductElement.description]
  static final description =
      QueryStringProperty<ProductElement>(_entities[1].properties[4]);

  /// see [ProductElement.imageUrl]
  static final imageUrl =
      QueryStringProperty<ProductElement>(_entities[1].properties[5]);

  /// see [ProductElement.count]
  static final count =
      QueryIntegerProperty<ProductElement>(_entities[1].properties[6]);

  /// see [ProductElement.market]
  static final market =
      QueryRelationToOne<ProductElement, Market>(_entities[1].properties[7]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[2].properties[0]);

  /// see [User.isLog]
  static final isLog = QueryBooleanProperty<User>(_entities[2].properties[1]);

  /// see [User.userName]
  static final userName = QueryStringProperty<User>(_entities[2].properties[2]);

  /// see [User.password]
  static final password = QueryStringProperty<User>(_entities[2].properties[3]);

  /// see [User.fullName]
  static final fullName = QueryStringProperty<User>(_entities[2].properties[4]);

  /// see [User.phoneNumber]
  static final phoneNumber =
      QueryStringProperty<User>(_entities[2].properties[5]);

  /// see [User.city]
  static final city = QueryStringProperty<User>(_entities[2].properties[6]);
}
