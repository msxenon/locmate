// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lang_state.dart';

class LangStateMapper extends ClassMapperBase<LangState> {
  LangStateMapper._();

  static LangStateMapper? _instance;
  static LangStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LangStateMapper._());
      LangRowModelMapper.ensureInitialized();
      ValueContainerMapper.ensureInitialized();
      LangModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LangState';

  static List<LangRowModel<ValueContainer>> _$rows(LangState v) => v.rows;
  static const Field<LangState, List<LangRowModel<ValueContainer>>> _f$rows =
      Field('rows', _$rows);
  static List<LangModel> _$orderdLangs(LangState v) => v.orderdLangs;
  static const Field<LangState, List<LangModel>> _f$orderdLangs =
      Field('orderdLangs', _$orderdLangs);
  static int _$selectedKeysCount(LangState v) => v.selectedKeysCount;
  static const Field<LangState, int> _f$selectedKeysCount =
      Field('selectedKeysCount', _$selectedKeysCount);
  static int _$allKeysCount(LangState v) => v.allKeysCount;
  static const Field<LangState, int> _f$allKeysCount =
      Field('allKeysCount', _$allKeysCount);
  static MainTabs _$selectedTab(LangState v) => v.selectedTab;
  static const Field<LangState, MainTabs> _f$selectedTab =
      Field('selectedTab', _$selectedTab);
  static int _$sortColumnIndex(LangState v) => v.sortColumnIndex;
  static const Field<LangState, int> _f$sortColumnIndex =
      Field('sortColumnIndex', _$sortColumnIndex, opt: true, def: 0);
  static bool _$isSortAscending(LangState v) => v.isSortAscending;
  static const Field<LangState, bool> _f$isSortAscending =
      Field('isSortAscending', _$isSortAscending, opt: true, def: false);
  static int _$overallCompletionPercentage(LangState v) =>
      v.overallCompletionPercentage;
  static const Field<LangState, int> _f$overallCompletionPercentage = Field(
      'overallCompletionPercentage', _$overallCompletionPercentage,
      opt: true, def: 0);
  static String? _$focusedKey(LangState v) => v.focusedKey;
  static const Field<LangState, String> _f$focusedKey =
      Field('focusedKey', _$focusedKey, opt: true);
  static List<LangRowModel<ValueContainer>> _$problems(LangState v) =>
      v.problems;
  static const Field<LangState, List<LangRowModel<ValueContainer>>>
      _f$problems = Field('problems', _$problems, mode: FieldMode.member);
  static List<LangRowModel<ValueContainer>> _$uncompleted(LangState v) =>
      v.uncompleted;
  static const Field<LangState, List<LangRowModel<ValueContainer>>>
      _f$uncompleted =
      Field('uncompleted', _$uncompleted, mode: FieldMode.member);
  static List<LangRowModel<ValueContainer>> _$selected(LangState v) =>
      v.selected;
  static const Field<LangState, List<LangRowModel<ValueContainer>>>
      _f$selected = Field('selected', _$selected, mode: FieldMode.member);

  @override
  final MappableFields<LangState> fields = const {
    #rows: _f$rows,
    #orderdLangs: _f$orderdLangs,
    #selectedKeysCount: _f$selectedKeysCount,
    #allKeysCount: _f$allKeysCount,
    #selectedTab: _f$selectedTab,
    #sortColumnIndex: _f$sortColumnIndex,
    #isSortAscending: _f$isSortAscending,
    #overallCompletionPercentage: _f$overallCompletionPercentage,
    #focusedKey: _f$focusedKey,
    #problems: _f$problems,
    #uncompleted: _f$uncompleted,
    #selected: _f$selected,
  };

  static LangState _instantiate(DecodingData data) {
    return LangState(
        rows: data.dec(_f$rows),
        orderdLangs: data.dec(_f$orderdLangs),
        selectedKeysCount: data.dec(_f$selectedKeysCount),
        allKeysCount: data.dec(_f$allKeysCount),
        selectedTab: data.dec(_f$selectedTab),
        sortColumnIndex: data.dec(_f$sortColumnIndex),
        isSortAscending: data.dec(_f$isSortAscending),
        overallCompletionPercentage: data.dec(_f$overallCompletionPercentage),
        focusedKey: data.dec(_f$focusedKey));
  }

  @override
  final Function instantiate = _instantiate;

  static LangState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LangState>(map);
  }

  static LangState fromJson(String json) {
    return ensureInitialized().decodeJson<LangState>(json);
  }
}

mixin LangStateMappable {
  String toJson() {
    return LangStateMapper.ensureInitialized()
        .encodeJson<LangState>(this as LangState);
  }

  Map<String, dynamic> toMap() {
    return LangStateMapper.ensureInitialized()
        .encodeMap<LangState>(this as LangState);
  }

  LangStateCopyWith<LangState, LangState, LangState> get copyWith =>
      _LangStateCopyWithImpl<LangState, LangState>(
          this as LangState, $identity, $identity);
  @override
  String toString() {
    return LangStateMapper.ensureInitialized()
        .stringifyValue(this as LangState);
  }

  @override
  bool operator ==(Object other) {
    return LangStateMapper.ensureInitialized()
        .equalsValue(this as LangState, other);
  }

  @override
  int get hashCode {
    return LangStateMapper.ensureInitialized().hashValue(this as LangState);
  }
}

extension LangStateValueCopy<$R, $Out> on ObjectCopyWith<$R, LangState, $Out> {
  LangStateCopyWith<$R, LangState, $Out> get $asLangState =>
      $base.as((v, t, t2) => _LangStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LangStateCopyWith<$R, $In extends LangState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      LangRowModel<ValueContainer>,
      LangRowModelCopyWith<$R, LangRowModel<ValueContainer>,
          LangRowModel<ValueContainer>, ValueContainer>> get rows;
  ListCopyWith<$R, LangModel, LangModelCopyWith<$R, LangModel, LangModel>>
      get orderdLangs;
  $R call(
      {List<LangRowModel<ValueContainer>>? rows,
      List<LangModel>? orderdLangs,
      int? selectedKeysCount,
      int? allKeysCount,
      MainTabs? selectedTab,
      int? sortColumnIndex,
      bool? isSortAscending,
      int? overallCompletionPercentage,
      String? focusedKey});
  LangStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LangStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LangState, $Out>
    implements LangStateCopyWith<$R, LangState, $Out> {
  _LangStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LangState> $mapper =
      LangStateMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      LangRowModel<ValueContainer>,
      LangRowModelCopyWith<$R, LangRowModel<ValueContainer>,
          LangRowModel<ValueContainer>, ValueContainer>> get rows =>
      ListCopyWith(
          $value.rows, (v, t) => v.copyWith.$chain(t), (v) => call(rows: v));
  @override
  ListCopyWith<$R, LangModel, LangModelCopyWith<$R, LangModel, LangModel>>
      get orderdLangs => ListCopyWith($value.orderdLangs,
          (v, t) => v.copyWith.$chain(t), (v) => call(orderdLangs: v));
  @override
  $R call(
          {List<LangRowModel<ValueContainer>>? rows,
          List<LangModel>? orderdLangs,
          int? selectedKeysCount,
          int? allKeysCount,
          MainTabs? selectedTab,
          int? sortColumnIndex,
          bool? isSortAscending,
          int? overallCompletionPercentage,
          Object? focusedKey = $none}) =>
      $apply(FieldCopyWithData({
        if (rows != null) #rows: rows,
        if (orderdLangs != null) #orderdLangs: orderdLangs,
        if (selectedKeysCount != null) #selectedKeysCount: selectedKeysCount,
        if (allKeysCount != null) #allKeysCount: allKeysCount,
        if (selectedTab != null) #selectedTab: selectedTab,
        if (sortColumnIndex != null) #sortColumnIndex: sortColumnIndex,
        if (isSortAscending != null) #isSortAscending: isSortAscending,
        if (overallCompletionPercentage != null)
          #overallCompletionPercentage: overallCompletionPercentage,
        if (focusedKey != $none) #focusedKey: focusedKey
      }));
  @override
  LangState $make(CopyWithData data) => LangState(
      rows: data.get(#rows, or: $value.rows),
      orderdLangs: data.get(#orderdLangs, or: $value.orderdLangs),
      selectedKeysCount:
          data.get(#selectedKeysCount, or: $value.selectedKeysCount),
      allKeysCount: data.get(#allKeysCount, or: $value.allKeysCount),
      selectedTab: data.get(#selectedTab, or: $value.selectedTab),
      sortColumnIndex: data.get(#sortColumnIndex, or: $value.sortColumnIndex),
      isSortAscending: data.get(#isSortAscending, or: $value.isSortAscending),
      overallCompletionPercentage: data.get(#overallCompletionPercentage,
          or: $value.overallCompletionPercentage),
      focusedKey: data.get(#focusedKey, or: $value.focusedKey));

  @override
  LangStateCopyWith<$R2, LangState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LangStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
