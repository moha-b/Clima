part of 'network_cubit.dart';

@immutable
abstract class NetworkState {}

class ConnectedInitial extends NetworkState {}

class ConnectedSuccess extends NetworkState {}

class ConnectedFailure extends NetworkState {}
