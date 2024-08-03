// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TasksStateInitialImplCopyWith<$Res> {
  factory _$$TasksStateInitialImplCopyWith(_$TasksStateInitialImpl value,
          $Res Function(_$TasksStateInitialImpl) then) =
      __$$TasksStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksStateInitialImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateInitialImpl>
    implements _$$TasksStateInitialImplCopyWith<$Res> {
  __$$TasksStateInitialImplCopyWithImpl(_$TasksStateInitialImpl _value,
      $Res Function(_$TasksStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TasksStateInitialImpl implements TasksStateInitial {
  const _$TasksStateInitialImpl();

  @override
  String toString() {
    return 'TasksState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TasksStateInitial implements TasksState {
  const factory TasksStateInitial() = _$TasksStateInitialImpl;
}

/// @nodoc
abstract class _$$LoadingTasksImplCopyWith<$Res> {
  factory _$$LoadingTasksImplCopyWith(
          _$LoadingTasksImpl value, $Res Function(_$LoadingTasksImpl) then) =
      __$$LoadingTasksImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingTasksImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$LoadingTasksImpl>
    implements _$$LoadingTasksImplCopyWith<$Res> {
  __$$LoadingTasksImplCopyWithImpl(
      _$LoadingTasksImpl _value, $Res Function(_$LoadingTasksImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingTasksImpl implements LoadingTasks {
  const _$LoadingTasksImpl();

  @override
  String toString() {
    return 'TasksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingTasksImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingTasks implements TasksState {
  const factory LoadingTasks() = _$LoadingTasksImpl;
}

/// @nodoc
abstract class _$$SavingTaskImplCopyWith<$Res> {
  factory _$$SavingTaskImplCopyWith(
          _$SavingTaskImpl value, $Res Function(_$SavingTaskImpl) then) =
      __$$SavingTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingTaskImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$SavingTaskImpl>
    implements _$$SavingTaskImplCopyWith<$Res> {
  __$$SavingTaskImplCopyWithImpl(
      _$SavingTaskImpl _value, $Res Function(_$SavingTaskImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavingTaskImpl implements SavingTask {
  const _$SavingTaskImpl();

  @override
  String toString() {
    return 'TasksState.saving()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavingTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class SavingTask implements TasksState {
  const factory SavingTask() = _$SavingTaskImpl;
}

/// @nodoc
abstract class _$$SavedTaskImplCopyWith<$Res> {
  factory _$$SavedTaskImplCopyWith(
          _$SavedTaskImpl value, $Res Function(_$SavedTaskImpl) then) =
      __$$SavedTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavedTaskImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$SavedTaskImpl>
    implements _$$SavedTaskImplCopyWith<$Res> {
  __$$SavedTaskImplCopyWithImpl(
      _$SavedTaskImpl _value, $Res Function(_$SavedTaskImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavedTaskImpl implements SavedTask {
  const _$SavedTaskImpl();

  @override
  String toString() {
    return 'TasksState.saved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavedTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class SavedTask implements TasksState {
  const factory SavedTask() = _$SavedTaskImpl;
}

/// @nodoc
abstract class _$$DeletedTaskImplCopyWith<$Res> {
  factory _$$DeletedTaskImplCopyWith(
          _$DeletedTaskImpl value, $Res Function(_$DeletedTaskImpl) then) =
      __$$DeletedTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedTaskImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$DeletedTaskImpl>
    implements _$$DeletedTaskImplCopyWith<$Res> {
  __$$DeletedTaskImplCopyWithImpl(
      _$DeletedTaskImpl _value, $Res Function(_$DeletedTaskImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeletedTaskImpl implements DeletedTask {
  const _$DeletedTaskImpl();

  @override
  String toString() {
    return 'TasksState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class DeletedTask implements TasksState {
  const factory DeletedTask() = _$DeletedTaskImpl;
}

/// @nodoc
abstract class _$$TasksErrorsImplCopyWith<$Res> {
  factory _$$TasksErrorsImplCopyWith(
          _$TasksErrorsImpl value, $Res Function(_$TasksErrorsImpl) then) =
      __$$TasksErrorsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TasksErrorsImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksErrorsImpl>
    implements _$$TasksErrorsImplCopyWith<$Res> {
  __$$TasksErrorsImplCopyWithImpl(
      _$TasksErrorsImpl _value, $Res Function(_$TasksErrorsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TasksErrorsImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TasksErrorsImpl implements TasksErrors {
  const _$TasksErrorsImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TasksState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksErrorsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksErrorsImplCopyWith<_$TasksErrorsImpl> get copyWith =>
      __$$TasksErrorsImplCopyWithImpl<_$TasksErrorsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TasksErrors implements TasksState {
  const factory TasksErrors(final String message) = _$TasksErrorsImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TasksErrorsImplCopyWith<_$TasksErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksLoadedImplCopyWith<$Res> {
  factory _$$TasksLoadedImplCopyWith(
          _$TasksLoadedImpl value, $Res Function(_$TasksLoadedImpl) then) =
      __$$TasksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TasksLoadedImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksLoadedImpl>
    implements _$$TasksLoadedImplCopyWith<$Res> {
  __$$TasksLoadedImplCopyWithImpl(
      _$TasksLoadedImpl _value, $Res Function(_$TasksLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TasksLoadedImpl(
      null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$TasksLoadedImpl implements TasksLoaded {
  const _$TasksLoadedImpl(final List<Task> tasks) : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksState.loaded(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksLoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      __$$TasksLoadedImplCopyWithImpl<_$TasksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function() deleted,
    required TResult Function(String message) error,
    required TResult Function(List<Task> tasks) loaded,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? saving,
    TResult? Function()? saved,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
    TResult? Function(List<Task> tasks)? loaded,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    TResult Function(List<Task> tasks)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksStateInitial value) initial,
    required TResult Function(LoadingTasks value) loading,
    required TResult Function(SavingTask value) saving,
    required TResult Function(SavedTask value) saved,
    required TResult Function(DeletedTask value) deleted,
    required TResult Function(TasksErrors value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksStateInitial value)? initial,
    TResult? Function(LoadingTasks value)? loading,
    TResult? Function(SavingTask value)? saving,
    TResult? Function(SavedTask value)? saved,
    TResult? Function(DeletedTask value)? deleted,
    TResult? Function(TasksErrors value)? error,
    TResult? Function(TasksLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksStateInitial value)? initial,
    TResult Function(LoadingTasks value)? loading,
    TResult Function(SavingTask value)? saving,
    TResult Function(SavedTask value)? saved,
    TResult Function(DeletedTask value)? deleted,
    TResult Function(TasksErrors value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TasksLoaded implements TasksState {
  const factory TasksLoaded(final List<Task> tasks) = _$TasksLoadedImpl;

  List<Task> get tasks;
  @JsonKey(ignore: true)
  _$$TasksLoadedImplCopyWith<_$TasksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
