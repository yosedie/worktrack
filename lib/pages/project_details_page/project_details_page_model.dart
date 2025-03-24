import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'project_details_page_widget.dart' show ProjectDetailsPageWidget;
import 'package:flutter/material.dart';

class ProjectDetailsPageModel
    extends FlutterFlowModel<ProjectDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
