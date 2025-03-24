import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_team_members_widget.dart' show AddTeamMembersWidget;
import 'package:flutter/material.dart';

class AddTeamMembersModel extends FlutterFlowModel<AddTeamMembersWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '41umybiv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i5wagnfq' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for titleRole widget.
  FocusNode? titleRoleFocusNode;
  TextEditingController? titleRoleTextController;
  String? Function(BuildContext, String?)? titleRoleTextControllerValidator;
  String? _titleRoleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h5euxn0m' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for teamSelect widget.
  String? teamSelectValue;
  FormFieldController<String>? teamSelectValueController;
  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioTextController;
  String? Function(BuildContext, String?)? shortBioTextControllerValidator;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    titleRoleTextControllerValidator = _titleRoleTextControllerValidator;
  }

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    titleRoleFocusNode?.dispose();
    titleRoleTextController?.dispose();

    shortBioFocusNode?.dispose();
    shortBioTextController?.dispose();
  }
}
