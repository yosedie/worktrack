import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_states/empty_members/empty_members_widget.dart';
import '/components/modal_task_create_2/modal_task_create2_widget.dart';
import '/components/modal_user_profile/modal_user_profile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'modal_create_project_model.dart';
export 'modal_create_project_model.dart';

class ModalCreateProjectWidget extends StatefulWidget {
  const ModalCreateProjectWidget({super.key});

  @override
  State<ModalCreateProjectWidget> createState() =>
      _ModalCreateProjectWidgetState();
}

class _ModalCreateProjectWidgetState extends State<ModalCreateProjectWidget> {
  late ModalCreateProjectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalCreateProjectModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().searchUsers = false;
      safeSetState(() {});
    });

    _model.projectNameTextController ??= TextEditingController();
    _model.projectNameFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 6.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 700.0,
            constraints: BoxConstraints(
              maxWidth: 570.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  FFLocalizations.of(context).getText(
                                    'd3zhz60s' /* Create Project */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 16.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 44.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              FFLocalizations.of(context).getText(
                                'ndua9r0o' /* Please add the name & descript... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.projectNameTextController,
                              focusNode: _model.projectNameFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'ijnwlsug' /* Project Name */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 32.0, 20.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              textAlign: TextAlign.start,
                              validator: _model
                                  .projectNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model.descriptionTextController,
                              focusNode: _model.descriptionFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'l7qnilp2' /* Enter description here... */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 32.0, 20.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              validator: _model
                                  .descriptionTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'iou7k3x8' /* Assign Users */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'h40v3y8u' /* Find members by searching belo... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 44.0),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: FFAppState().appUsers(
                                        requestFn: () => queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.orderBy(
                                                  'display_name',
                                                  descending: true),
                                          limit: 25,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            userListUsersRecordList =
                                            snapshot.data!;
                                        if (userListUsersRecordList.isEmpty) {
                                          return Center(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 230.0,
                                              child: EmptyMembersWidget(
                                                title: 'No Users Found',
                                                bodyText:
                                                    'No members are present for your search, try the search bar again.',
                                              ),
                                            ),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              userListUsersRecordList.length,
                                          itemBuilder:
                                              (context, userListIndex) {
                                            final userListUsersRecord =
                                                userListUsersRecordList[
                                                    userListIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x10000000),
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              ModalUserProfileWidget(
                                                            userRef:
                                                                userListUsersRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x32000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      26.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                userListUsersRecord
                                                                    .photoUrl,
                                                            width: 36.0,
                                                            height: 36.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    userListUsersRecord
                                                                        .displayName,
                                                                    'Ghost User',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        userListUsersRecord
                                                                            .email,
                                                                        'user@domainname.com',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (!_model
                                                            .createdProject!
                                                            .usersAssigned
                                                            .contains(
                                                                userListUsersRecord
                                                                    .reference))
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                              // createActivity

                                                              var activityRecordReference =
                                                                  ActivityRecord
                                                                      .collection
                                                                      .doc();
                                                              await activityRecordReference
                                                                  .set({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'New Member in Project',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityType: _model
                                                                      .createdProject
                                                                      ?.projectName,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  activitySubText:
                                                                      '${userListUsersRecord.displayName} has been added to ',
                                                                  projectRef: _model
                                                                      .createdProject
                                                                      ?.reference,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'targetUserRef':
                                                                        [
                                                                      userListUsersRecord
                                                                          .reference
                                                                    ],
                                                                    'unreadByUser':
                                                                        [
                                                                      userListUsersRecord
                                                                          .reference
                                                                    ],
                                                                  },
                                                                ),
                                                              });
                                                              _model.newActivity2 =
                                                                  ActivityRecord
                                                                      .getDocumentFromData({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'New Member in Project',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityType: _model
                                                                      .createdProject
                                                                      ?.projectName,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  activitySubText:
                                                                      '${userListUsersRecord.displayName} has been added to ',
                                                                  projectRef: _model
                                                                      .createdProject
                                                                      ?.reference,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'targetUserRef':
                                                                        [
                                                                      userListUsersRecord
                                                                          .reference
                                                                    ],
                                                                    'unreadByUser':
                                                                        [
                                                                      userListUsersRecord
                                                                          .reference
                                                                    ],
                                                                  },
                                                                ),
                                                              }, activityRecordReference);

                                                              await _model
                                                                  .createdProject!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'usersAssigned':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      userListUsersRecord
                                                                          .reference
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'New Member Added!',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                ),
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '74kovm7t' /* Assign */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 80.0,
                                                              height: 36.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            // This creates the project for tasks to be assigned to.
                            // createProject

                            var projectsRecordReference =
                                ProjectsRecord.collection.doc();
                            await projectsRecordReference.set({
                              ...createProjectsRecordData(
                                owner: currentUserReference,
                                projectName:
                                    _model.projectNameTextController.text,
                                description:
                                    _model.descriptionTextController.text,
                                numberTasks: 0,
                                completedTasks: 0,
                                lastEdited: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'usersAssigned': [currentUserReference],
                                },
                              ),
                            });
                            _model.createdProject =
                                ProjectsRecord.getDocumentFromData({
                              ...createProjectsRecordData(
                                owner: currentUserReference,
                                projectName:
                                    _model.projectNameTextController.text,
                                description:
                                    _model.descriptionTextController.text,
                                numberTasks: 0,
                                completedTasks: 0,
                                lastEdited: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'usersAssigned': [currentUserReference],
                                },
                              ),
                            }, projectsRecordReference);
                            Navigator.pop(context);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: double.infinity,
                                    child: ModalTaskCreate2Widget(
                                      projectParameter: _model.createdProject,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'p9mvmaob' /* Create Project */,
                          ),
                          options: FFButtonOptions(
                            width: 270.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
