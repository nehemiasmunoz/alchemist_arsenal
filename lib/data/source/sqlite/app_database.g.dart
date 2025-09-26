// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IngredientTable extends Ingredient
    with TableInfo<$IngredientTable, IngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _propertiesMeta = const VerificationMeta(
    'properties',
  );
  @override
  late final GeneratedColumn<String> properties = GeneratedColumn<String>(
    'properties',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    price,
    properties,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('properties')) {
      context.handle(
        _propertiesMeta,
        properties.isAcceptableOrUnknown(data['properties']!, _propertiesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      properties: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}properties'],
      ),
    );
  }

  @override
  $IngredientTable createAlias(String alias) {
    return $IngredientTable(attachedDatabase, alias);
  }
}

class IngredientData extends DataClass implements Insertable<IngredientData> {
  final int id;
  final String title;
  final String? description;
  final double price;
  final String? properties;
  const IngredientData({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.properties,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || properties != null) {
      map['properties'] = Variable<String>(properties);
    }
    return map;
  }

  IngredientCompanion toCompanion(bool nullToAbsent) {
    return IngredientCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price: Value(price),
      properties: properties == null && nullToAbsent
          ? const Value.absent()
          : Value(properties),
    );
  }

  factory IngredientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      price: serializer.fromJson<double>(json['price']),
      properties: serializer.fromJson<String?>(json['properties']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'price': serializer.toJson<double>(price),
      'properties': serializer.toJson<String?>(properties),
    };
  }

  IngredientData copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    double? price,
    Value<String?> properties = const Value.absent(),
  }) => IngredientData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    price: price ?? this.price,
    properties: properties.present ? properties.value : this.properties,
  );
  IngredientData copyWithCompanion(IngredientCompanion data) {
    return IngredientData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      price: data.price.present ? data.price.value : this.price,
      properties: data.properties.present
          ? data.properties.value
          : this.properties,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('properties: $properties')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, price, properties);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.price == this.price &&
          other.properties == this.properties);
}

class IngredientCompanion extends UpdateCompanion<IngredientData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<double> price;
  final Value<String?> properties;
  const IngredientCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.properties = const Value.absent(),
  });
  IngredientCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required double price,
    this.properties = const Value.absent(),
  }) : title = Value(title),
       price = Value(price);
  static Insertable<IngredientData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<double>? price,
    Expression<String>? properties,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (properties != null) 'properties': properties,
    });
  }

  IngredientCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<double>? price,
    Value<String?>? properties,
  }) {
    return IngredientCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      properties: properties ?? this.properties,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (properties.present) {
      map['properties'] = Variable<String>(properties.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('properties: $properties')
          ..write(')'))
        .toString();
  }
}

class $RecipeTable extends Recipe with TableInfo<$RecipeTable, RecipeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, instructions];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
    );
  }

  @override
  $RecipeTable createAlias(String alias) {
    return $RecipeTable(attachedDatabase, alias);
  }
}

class RecipeData extends DataClass implements Insertable<RecipeData> {
  final int id;
  final String title;
  final String description;
  final String instructions;
  const RecipeData({
    required this.id,
    required this.title,
    required this.description,
    required this.instructions,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['instructions'] = Variable<String>(instructions);
    return map;
  }

  RecipeCompanion toCompanion(bool nullToAbsent) {
    return RecipeCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      instructions: Value(instructions),
    );
  }

  factory RecipeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      instructions: serializer.fromJson<String>(json['instructions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'instructions': serializer.toJson<String>(instructions),
    };
  }

  RecipeData copyWith({
    int? id,
    String? title,
    String? description,
    String? instructions,
  }) => RecipeData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    instructions: instructions ?? this.instructions,
  );
  RecipeData copyWithCompanion(RecipeCompanion data) {
    return RecipeData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, instructions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.instructions == this.instructions);
}

class RecipeCompanion extends UpdateCompanion<RecipeData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> instructions;
  const RecipeCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.instructions = const Value.absent(),
  });
  RecipeCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String instructions,
  }) : title = Value(title),
       description = Value(description),
       instructions = Value(instructions);
  static Insertable<RecipeData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? instructions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (instructions != null) 'instructions': instructions,
    });
  }

  RecipeCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? instructions,
  }) {
    return RecipeCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('instructions: $instructions')
          ..write(')'))
        .toString();
  }
}

class $UnitOfMeasureTable extends UnitOfMeasure
    with TableInfo<$UnitOfMeasureTable, UnitOfMeasureData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitOfMeasureTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, symbol, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_of_measure';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitOfMeasureData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitOfMeasureData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitOfMeasureData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $UnitOfMeasureTable createAlias(String alias) {
    return $UnitOfMeasureTable(attachedDatabase, alias);
  }
}

class UnitOfMeasureData extends DataClass
    implements Insertable<UnitOfMeasureData> {
  final int id;
  final String symbol;
  final String name;
  final String? description;
  const UnitOfMeasureData({
    required this.id,
    required this.symbol,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['symbol'] = Variable<String>(symbol);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  UnitOfMeasureCompanion toCompanion(bool nullToAbsent) {
    return UnitOfMeasureCompanion(
      id: Value(id),
      symbol: Value(symbol),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory UnitOfMeasureData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitOfMeasureData(
      id: serializer.fromJson<int>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  UnitOfMeasureData copyWith({
    int? id,
    String? symbol,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => UnitOfMeasureData(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  UnitOfMeasureData copyWithCompanion(UnitOfMeasureCompanion data) {
    return UnitOfMeasureData(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitOfMeasureData(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, symbol, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitOfMeasureData &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.description == this.description);
}

class UnitOfMeasureCompanion extends UpdateCompanion<UnitOfMeasureData> {
  final Value<int> id;
  final Value<String> symbol;
  final Value<String> name;
  final Value<String?> description;
  const UnitOfMeasureCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  UnitOfMeasureCompanion.insert({
    this.id = const Value.absent(),
    required String symbol,
    required String name,
    this.description = const Value.absent(),
  }) : symbol = Value(symbol),
       name = Value(name);
  static Insertable<UnitOfMeasureData> custom({
    Expression<int>? id,
    Expression<String>? symbol,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  UnitOfMeasureCompanion copyWith({
    Value<int>? id,
    Value<String>? symbol,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return UnitOfMeasureCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitOfMeasureCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $RecipeIngredientTable extends RecipeIngredient
    with TableInfo<$RecipeIngredientTable, RecipeIngredientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeIngredientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<int> recipeId = GeneratedColumn<int>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe (id)',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<int> ingredientId = GeneratedColumn<int>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredient (id)',
    ),
  );
  static const VerificationMeta _unitOfMeasureIdMeta = const VerificationMeta(
    'unitOfMeasureId',
  );
  @override
  late final GeneratedColumn<int> unitOfMeasureId = GeneratedColumn<int>(
    'unit_of_measure_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES unit_of_measure (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recipeId,
    ingredientId,
    unitOfMeasureId,
    quantity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_ingredient';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeIngredientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('unit_of_measure_id')) {
      context.handle(
        _unitOfMeasureIdMeta,
        unitOfMeasureId.isAcceptableOrUnknown(
          data['unit_of_measure_id']!,
          _unitOfMeasureIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitOfMeasureIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeIngredientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeIngredientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recipe_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ingredient_id'],
      )!,
      unitOfMeasureId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_of_measure_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $RecipeIngredientTable createAlias(String alias) {
    return $RecipeIngredientTable(attachedDatabase, alias);
  }
}

class RecipeIngredientData extends DataClass
    implements Insertable<RecipeIngredientData> {
  final int id;
  final int recipeId;
  final int ingredientId;
  final int unitOfMeasureId;
  final double quantity;
  const RecipeIngredientData({
    required this.id,
    required this.recipeId,
    required this.ingredientId,
    required this.unitOfMeasureId,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['recipe_id'] = Variable<int>(recipeId);
    map['ingredient_id'] = Variable<int>(ingredientId);
    map['unit_of_measure_id'] = Variable<int>(unitOfMeasureId);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  RecipeIngredientCompanion toCompanion(bool nullToAbsent) {
    return RecipeIngredientCompanion(
      id: Value(id),
      recipeId: Value(recipeId),
      ingredientId: Value(ingredientId),
      unitOfMeasureId: Value(unitOfMeasureId),
      quantity: Value(quantity),
    );
  }

  factory RecipeIngredientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeIngredientData(
      id: serializer.fromJson<int>(json['id']),
      recipeId: serializer.fromJson<int>(json['recipeId']),
      ingredientId: serializer.fromJson<int>(json['ingredientId']),
      unitOfMeasureId: serializer.fromJson<int>(json['unitOfMeasureId']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recipeId': serializer.toJson<int>(recipeId),
      'ingredientId': serializer.toJson<int>(ingredientId),
      'unitOfMeasureId': serializer.toJson<int>(unitOfMeasureId),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  RecipeIngredientData copyWith({
    int? id,
    int? recipeId,
    int? ingredientId,
    int? unitOfMeasureId,
    double? quantity,
  }) => RecipeIngredientData(
    id: id ?? this.id,
    recipeId: recipeId ?? this.recipeId,
    ingredientId: ingredientId ?? this.ingredientId,
    unitOfMeasureId: unitOfMeasureId ?? this.unitOfMeasureId,
    quantity: quantity ?? this.quantity,
  );
  RecipeIngredientData copyWithCompanion(RecipeIngredientCompanion data) {
    return RecipeIngredientData(
      id: data.id.present ? data.id.value : this.id,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      unitOfMeasureId: data.unitOfMeasureId.present
          ? data.unitOfMeasureId.value
          : this.unitOfMeasureId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientData(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('unitOfMeasureId: $unitOfMeasureId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recipeId, ingredientId, unitOfMeasureId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeIngredientData &&
          other.id == this.id &&
          other.recipeId == this.recipeId &&
          other.ingredientId == this.ingredientId &&
          other.unitOfMeasureId == this.unitOfMeasureId &&
          other.quantity == this.quantity);
}

class RecipeIngredientCompanion extends UpdateCompanion<RecipeIngredientData> {
  final Value<int> id;
  final Value<int> recipeId;
  final Value<int> ingredientId;
  final Value<int> unitOfMeasureId;
  final Value<double> quantity;
  const RecipeIngredientCompanion({
    this.id = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.unitOfMeasureId = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  RecipeIngredientCompanion.insert({
    this.id = const Value.absent(),
    required int recipeId,
    required int ingredientId,
    required int unitOfMeasureId,
    required double quantity,
  }) : recipeId = Value(recipeId),
       ingredientId = Value(ingredientId),
       unitOfMeasureId = Value(unitOfMeasureId),
       quantity = Value(quantity);
  static Insertable<RecipeIngredientData> custom({
    Expression<int>? id,
    Expression<int>? recipeId,
    Expression<int>? ingredientId,
    Expression<int>? unitOfMeasureId,
    Expression<double>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recipeId != null) 'recipe_id': recipeId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (unitOfMeasureId != null) 'unit_of_measure_id': unitOfMeasureId,
      if (quantity != null) 'quantity': quantity,
    });
  }

  RecipeIngredientCompanion copyWith({
    Value<int>? id,
    Value<int>? recipeId,
    Value<int>? ingredientId,
    Value<int>? unitOfMeasureId,
    Value<double>? quantity,
  }) {
    return RecipeIngredientCompanion(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
      ingredientId: ingredientId ?? this.ingredientId,
      unitOfMeasureId: unitOfMeasureId ?? this.unitOfMeasureId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<int>(recipeId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<int>(ingredientId.value);
    }
    if (unitOfMeasureId.present) {
      map['unit_of_measure_id'] = Variable<int>(unitOfMeasureId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeIngredientCompanion(')
          ..write('id: $id, ')
          ..write('recipeId: $recipeId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('unitOfMeasureId: $unitOfMeasureId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IngredientTable ingredient = $IngredientTable(this);
  late final $RecipeTable recipe = $RecipeTable(this);
  late final $UnitOfMeasureTable unitOfMeasure = $UnitOfMeasureTable(this);
  late final $RecipeIngredientTable recipeIngredient = $RecipeIngredientTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ingredient,
    recipe,
    unitOfMeasure,
    recipeIngredient,
  ];
}

typedef $$IngredientTableCreateCompanionBuilder =
    IngredientCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      required double price,
      Value<String?> properties,
    });
typedef $$IngredientTableUpdateCompanionBuilder =
    IngredientCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<double> price,
      Value<String?> properties,
    });

final class $$IngredientTableReferences
    extends BaseReferences<_$AppDatabase, $IngredientTable, IngredientData> {
  $$IngredientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeIngredientTable, List<RecipeIngredientData>>
  _recipeIngredientRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeIngredient,
    aliasName: $_aliasNameGenerator(
      db.ingredient.id,
      db.recipeIngredient.ingredientId,
    ),
  );

  $$RecipeIngredientTableProcessedTableManager get recipeIngredientRefs {
    final manager = $$RecipeIngredientTableTableManager(
      $_db,
      $_db.recipeIngredient,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IngredientTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientTable> {
  $$IngredientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get properties => $composableBuilder(
    column: $table.properties,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientRefs(
    Expression<bool> Function($$RecipeIngredientTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IngredientTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientTable> {
  $$IngredientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get properties => $composableBuilder(
    column: $table.properties,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientTable> {
  $$IngredientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get properties => $composableBuilder(
    column: $table.properties,
    builder: (column) => column,
  );

  Expression<T> recipeIngredientRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IngredientTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientTable,
          IngredientData,
          $$IngredientTableFilterComposer,
          $$IngredientTableOrderingComposer,
          $$IngredientTableAnnotationComposer,
          $$IngredientTableCreateCompanionBuilder,
          $$IngredientTableUpdateCompanionBuilder,
          (IngredientData, $$IngredientTableReferences),
          IngredientData,
          PrefetchHooks Function({bool recipeIngredientRefs})
        > {
  $$IngredientTableTableManager(_$AppDatabase db, $IngredientTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String?> properties = const Value.absent(),
              }) => IngredientCompanion(
                id: id,
                title: title,
                description: description,
                price: price,
                properties: properties,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                required double price,
                Value<String?> properties = const Value.absent(),
              }) => IngredientCompanion.insert(
                id: id,
                title: title,
                description: description,
                price: price,
                properties: properties,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeIngredientRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeIngredientRefs) db.recipeIngredient,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeIngredientRefs)
                    await $_getPrefetchedData<
                      IngredientData,
                      $IngredientTable,
                      RecipeIngredientData
                    >(
                      currentTable: table,
                      referencedTable: $$IngredientTableReferences
                          ._recipeIngredientRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$IngredientTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeIngredientRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.ingredientId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$IngredientTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientTable,
      IngredientData,
      $$IngredientTableFilterComposer,
      $$IngredientTableOrderingComposer,
      $$IngredientTableAnnotationComposer,
      $$IngredientTableCreateCompanionBuilder,
      $$IngredientTableUpdateCompanionBuilder,
      (IngredientData, $$IngredientTableReferences),
      IngredientData,
      PrefetchHooks Function({bool recipeIngredientRefs})
    >;
typedef $$RecipeTableCreateCompanionBuilder =
    RecipeCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String instructions,
    });
typedef $$RecipeTableUpdateCompanionBuilder =
    RecipeCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> instructions,
    });

final class $$RecipeTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeTable, RecipeData> {
  $$RecipeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeIngredientTable, List<RecipeIngredientData>>
  _recipeIngredientRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeIngredient,
    aliasName: $_aliasNameGenerator(db.recipe.id, db.recipeIngredient.recipeId),
  );

  $$RecipeIngredientTableProcessedTableManager get recipeIngredientRefs {
    final manager = $$RecipeIngredientTableTableManager(
      $_db,
      $_db.recipeIngredient,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientRefs(
    Expression<bool> Function($$RecipeIngredientTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTable> {
  $$RecipeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  Expression<T> recipeIngredientRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTable,
          RecipeData,
          $$RecipeTableFilterComposer,
          $$RecipeTableOrderingComposer,
          $$RecipeTableAnnotationComposer,
          $$RecipeTableCreateCompanionBuilder,
          $$RecipeTableUpdateCompanionBuilder,
          (RecipeData, $$RecipeTableReferences),
          RecipeData,
          PrefetchHooks Function({bool recipeIngredientRefs})
        > {
  $$RecipeTableTableManager(_$AppDatabase db, $RecipeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> instructions = const Value.absent(),
              }) => RecipeCompanion(
                id: id,
                title: title,
                description: description,
                instructions: instructions,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String instructions,
              }) => RecipeCompanion.insert(
                id: id,
                title: title,
                description: description,
                instructions: instructions,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RecipeTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({recipeIngredientRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeIngredientRefs) db.recipeIngredient,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeIngredientRefs)
                    await $_getPrefetchedData<
                      RecipeData,
                      $RecipeTable,
                      RecipeIngredientData
                    >(
                      currentTable: table,
                      referencedTable: $$RecipeTableReferences
                          ._recipeIngredientRefsTable(db),
                      managerFromTypedResult: (p0) => $$RecipeTableReferences(
                        db,
                        table,
                        p0,
                      ).recipeIngredientRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.recipeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RecipeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTable,
      RecipeData,
      $$RecipeTableFilterComposer,
      $$RecipeTableOrderingComposer,
      $$RecipeTableAnnotationComposer,
      $$RecipeTableCreateCompanionBuilder,
      $$RecipeTableUpdateCompanionBuilder,
      (RecipeData, $$RecipeTableReferences),
      RecipeData,
      PrefetchHooks Function({bool recipeIngredientRefs})
    >;
typedef $$UnitOfMeasureTableCreateCompanionBuilder =
    UnitOfMeasureCompanion Function({
      Value<int> id,
      required String symbol,
      required String name,
      Value<String?> description,
    });
typedef $$UnitOfMeasureTableUpdateCompanionBuilder =
    UnitOfMeasureCompanion Function({
      Value<int> id,
      Value<String> symbol,
      Value<String> name,
      Value<String?> description,
    });

final class $$UnitOfMeasureTableReferences
    extends
        BaseReferences<_$AppDatabase, $UnitOfMeasureTable, UnitOfMeasureData> {
  $$UnitOfMeasureTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RecipeIngredientTable, List<RecipeIngredientData>>
  _recipeIngredientRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeIngredient,
    aliasName: $_aliasNameGenerator(
      db.unitOfMeasure.id,
      db.recipeIngredient.unitOfMeasureId,
    ),
  );

  $$RecipeIngredientTableProcessedTableManager get recipeIngredientRefs {
    final manager = $$RecipeIngredientTableTableManager(
      $_db,
      $_db.recipeIngredient,
    ).filter((f) => f.unitOfMeasureId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeIngredientRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnitOfMeasureTableFilterComposer
    extends Composer<_$AppDatabase, $UnitOfMeasureTable> {
  $$UnitOfMeasureTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeIngredientRefs(
    Expression<bool> Function($$RecipeIngredientTableFilterComposer f) f,
  ) {
    final $$RecipeIngredientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.unitOfMeasureId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableFilterComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitOfMeasureTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitOfMeasureTable> {
  $$UnitOfMeasureTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitOfMeasureTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitOfMeasureTable> {
  $$UnitOfMeasureTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> recipeIngredientRefs<T extends Object>(
    Expression<T> Function($$RecipeIngredientTableAnnotationComposer a) f,
  ) {
    final $$RecipeIngredientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeIngredient,
      getReferencedColumn: (t) => t.unitOfMeasureId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeIngredientTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeIngredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitOfMeasureTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitOfMeasureTable,
          UnitOfMeasureData,
          $$UnitOfMeasureTableFilterComposer,
          $$UnitOfMeasureTableOrderingComposer,
          $$UnitOfMeasureTableAnnotationComposer,
          $$UnitOfMeasureTableCreateCompanionBuilder,
          $$UnitOfMeasureTableUpdateCompanionBuilder,
          (UnitOfMeasureData, $$UnitOfMeasureTableReferences),
          UnitOfMeasureData,
          PrefetchHooks Function({bool recipeIngredientRefs})
        > {
  $$UnitOfMeasureTableTableManager(_$AppDatabase db, $UnitOfMeasureTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitOfMeasureTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitOfMeasureTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitOfMeasureTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => UnitOfMeasureCompanion(
                id: id,
                symbol: symbol,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String symbol,
                required String name,
                Value<String?> description = const Value.absent(),
              }) => UnitOfMeasureCompanion.insert(
                id: id,
                symbol: symbol,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UnitOfMeasureTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeIngredientRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeIngredientRefs) db.recipeIngredient,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeIngredientRefs)
                    await $_getPrefetchedData<
                      UnitOfMeasureData,
                      $UnitOfMeasureTable,
                      RecipeIngredientData
                    >(
                      currentTable: table,
                      referencedTable: $$UnitOfMeasureTableReferences
                          ._recipeIngredientRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UnitOfMeasureTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeIngredientRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.unitOfMeasureId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UnitOfMeasureTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitOfMeasureTable,
      UnitOfMeasureData,
      $$UnitOfMeasureTableFilterComposer,
      $$UnitOfMeasureTableOrderingComposer,
      $$UnitOfMeasureTableAnnotationComposer,
      $$UnitOfMeasureTableCreateCompanionBuilder,
      $$UnitOfMeasureTableUpdateCompanionBuilder,
      (UnitOfMeasureData, $$UnitOfMeasureTableReferences),
      UnitOfMeasureData,
      PrefetchHooks Function({bool recipeIngredientRefs})
    >;
typedef $$RecipeIngredientTableCreateCompanionBuilder =
    RecipeIngredientCompanion Function({
      Value<int> id,
      required int recipeId,
      required int ingredientId,
      required int unitOfMeasureId,
      required double quantity,
    });
typedef $$RecipeIngredientTableUpdateCompanionBuilder =
    RecipeIngredientCompanion Function({
      Value<int> id,
      Value<int> recipeId,
      Value<int> ingredientId,
      Value<int> unitOfMeasureId,
      Value<double> quantity,
    });

final class $$RecipeIngredientTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeIngredientTable,
          RecipeIngredientData
        > {
  $$RecipeIngredientTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTable _recipeIdTable(_$AppDatabase db) => db.recipe.createAlias(
    $_aliasNameGenerator(db.recipeIngredient.recipeId, db.recipe.id),
  );

  $$RecipeTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<int>('recipe_id')!;

    final manager = $$RecipeTableTableManager(
      $_db,
      $_db.recipe,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IngredientTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredient.createAlias(
        $_aliasNameGenerator(
          db.recipeIngredient.ingredientId,
          db.ingredient.id,
        ),
      );

  $$IngredientTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<int>('ingredient_id')!;

    final manager = $$IngredientTableTableManager(
      $_db,
      $_db.ingredient,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UnitOfMeasureTable _unitOfMeasureIdTable(_$AppDatabase db) =>
      db.unitOfMeasure.createAlias(
        $_aliasNameGenerator(
          db.recipeIngredient.unitOfMeasureId,
          db.unitOfMeasure.id,
        ),
      );

  $$UnitOfMeasureTableProcessedTableManager get unitOfMeasureId {
    final $_column = $_itemColumn<int>('unit_of_measure_id')!;

    final manager = $$UnitOfMeasureTableTableManager(
      $_db,
      $_db.unitOfMeasure,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitOfMeasureIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeIngredientTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeIngredientTable> {
  $$RecipeIngredientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipeTableFilterComposer get recipeId {
    final $$RecipeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableFilterComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientTableFilterComposer get ingredientId {
    final $$IngredientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableFilterComposer(
            $db: $db,
            $table: $db.ingredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitOfMeasureTableFilterComposer get unitOfMeasureId {
    final $$UnitOfMeasureTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitOfMeasureId,
      referencedTable: $db.unitOfMeasure,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitOfMeasureTableFilterComposer(
            $db: $db,
            $table: $db.unitOfMeasure,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeIngredientTable> {
  $$RecipeIngredientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipeTableOrderingComposer get recipeId {
    final $$RecipeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableOrderingComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientTableOrderingComposer get ingredientId {
    final $$IngredientTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableOrderingComposer(
            $db: $db,
            $table: $db.ingredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitOfMeasureTableOrderingComposer get unitOfMeasureId {
    final $$UnitOfMeasureTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitOfMeasureId,
      referencedTable: $db.unitOfMeasure,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitOfMeasureTableOrderingComposer(
            $db: $db,
            $table: $db.unitOfMeasure,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeIngredientTable> {
  $$RecipeIngredientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$RecipeTableAnnotationComposer get recipeId {
    final $$RecipeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipe,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableAnnotationComposer(
            $db: $db,
            $table: $db.recipe,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$IngredientTableAnnotationComposer get ingredientId {
    final $$IngredientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitOfMeasureTableAnnotationComposer get unitOfMeasureId {
    final $$UnitOfMeasureTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitOfMeasureId,
      referencedTable: $db.unitOfMeasure,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitOfMeasureTableAnnotationComposer(
            $db: $db,
            $table: $db.unitOfMeasure,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeIngredientTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeIngredientTable,
          RecipeIngredientData,
          $$RecipeIngredientTableFilterComposer,
          $$RecipeIngredientTableOrderingComposer,
          $$RecipeIngredientTableAnnotationComposer,
          $$RecipeIngredientTableCreateCompanionBuilder,
          $$RecipeIngredientTableUpdateCompanionBuilder,
          (RecipeIngredientData, $$RecipeIngredientTableReferences),
          RecipeIngredientData,
          PrefetchHooks Function({
            bool recipeId,
            bool ingredientId,
            bool unitOfMeasureId,
          })
        > {
  $$RecipeIngredientTableTableManager(
    _$AppDatabase db,
    $RecipeIngredientTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeIngredientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeIngredientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeIngredientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recipeId = const Value.absent(),
                Value<int> ingredientId = const Value.absent(),
                Value<int> unitOfMeasureId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
              }) => RecipeIngredientCompanion(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                unitOfMeasureId: unitOfMeasureId,
                quantity: quantity,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recipeId,
                required int ingredientId,
                required int unitOfMeasureId,
                required double quantity,
              }) => RecipeIngredientCompanion.insert(
                id: id,
                recipeId: recipeId,
                ingredientId: ingredientId,
                unitOfMeasureId: unitOfMeasureId,
                quantity: quantity,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeIngredientTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recipeId = false,
                ingredientId = false,
                unitOfMeasureId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$RecipeIngredientTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$RecipeIngredientTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (ingredientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ingredientId,
                                    referencedTable:
                                        $$RecipeIngredientTableReferences
                                            ._ingredientIdTable(db),
                                    referencedColumn:
                                        $$RecipeIngredientTableReferences
                                            ._ingredientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (unitOfMeasureId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.unitOfMeasureId,
                                    referencedTable:
                                        $$RecipeIngredientTableReferences
                                            ._unitOfMeasureIdTable(db),
                                    referencedColumn:
                                        $$RecipeIngredientTableReferences
                                            ._unitOfMeasureIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$RecipeIngredientTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeIngredientTable,
      RecipeIngredientData,
      $$RecipeIngredientTableFilterComposer,
      $$RecipeIngredientTableOrderingComposer,
      $$RecipeIngredientTableAnnotationComposer,
      $$RecipeIngredientTableCreateCompanionBuilder,
      $$RecipeIngredientTableUpdateCompanionBuilder,
      (RecipeIngredientData, $$RecipeIngredientTableReferences),
      RecipeIngredientData,
      PrefetchHooks Function({
        bool recipeId,
        bool ingredientId,
        bool unitOfMeasureId,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IngredientTableTableManager get ingredient =>
      $$IngredientTableTableManager(_db, _db.ingredient);
  $$RecipeTableTableManager get recipe =>
      $$RecipeTableTableManager(_db, _db.recipe);
  $$UnitOfMeasureTableTableManager get unitOfMeasure =>
      $$UnitOfMeasureTableTableManager(_db, _db.unitOfMeasure);
  $$RecipeIngredientTableTableManager get recipeIngredient =>
      $$RecipeIngredientTableTableManager(_db, _db.recipeIngredient);
}
