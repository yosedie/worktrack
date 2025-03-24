import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'team_members_widget.dart' show TeamMembersWidget;
import 'package:flutter/material.dart';

class TeamMembersModel extends FlutterFlowModel<TeamMembersWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ActivityRecord? activityCreated;
  Completer<List<UsersRecord>>? firestoreRequestCompleter;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
