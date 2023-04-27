

import 'package:delivery_app/src/base/views/LoadingView.dart';
import 'package:delivery_app/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:delivery_app/src/features/presentation/state_providers/ErrorStateProvider.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/state_providers/LoadingStateProvider.dart';

class BaseView {

  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();

}

abstract class BaseViewModel {

  late LoadingStateProvider loadingState;
  void initState({ required LoadingStateProvider loadingStateProvider });
}