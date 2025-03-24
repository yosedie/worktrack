import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_task_widget.dart' show CreateTaskWidget;
import 'package:flutter/material.dart';

class CreateTaskModel extends FlutterFlowModel<CreateTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameTextController;
  String? Function(BuildContext, String?)? taskNameTextControllerValidator;
  String? _taskNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3nx43hj1' /* Please add a task name. */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'tjxg3net' /* Please enter at least 3 letter... */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for statusSelect widget.
  String? statusSelectValue;
  FormFieldController<String>? statusSelectValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllTasksRecord? newTask;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityCreated;

  @override
  void initState(BuildContext context) {
    taskNameTextControllerValidator = _taskNameTextControllerValidator;
  }

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
