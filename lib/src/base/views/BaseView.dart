

import 'package:delivery_app/src/base/views/LoadingView.dart';
import 'package:delivery_app/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:delivery_app/src/features/presentation/state_providers/ErrorStateProvider.dart';
import 'package:flutter/material.dart';

class BaseView {

  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();

}