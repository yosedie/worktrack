import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_states/empty_members/empty_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'team_members_model.dart';
export 'team_members_model.dart';

class TeamMembersWidget extends StatefulWidget {
  const TeamMembersWidget({
    super.key,
    this.projectRef,
  });

  final ProjectsRecord? projectRef;

  static String routeName = 'teamMembers';
  static String routePath = 'teamMembers';

  @override
  State<TeamMembersWidget> createState() => _TeamMembersWidgetState();
}

class _TeamMembersWidgetState extends State<TeamMembersWidget> {
  late TeamMembersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamMembersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'teamMembers',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 54.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'cr7ls6ar' /* Add Members */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.search_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        SearchMembersWidget.routeName,
                        queryParameters: {
                          'projectRef': serializeParam(
                            widget.projectRef,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'projectRef': widget.projectRef,
                        },
                      );
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'gxfshi24' /* Members in Project */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 170.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Builder(
                      builder: (context) {
                        final members =
                            widget.projectRef?.usersAssigned.toList() ?? [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: members.length,
                          itemBuilder: (context, membersIndex) {
                            final membersItem = members[membersIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 4.0, 12.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(membersItem),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final containerUsersRecord = snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.projectRef!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'usersAssigned':
                                                FieldValue.arrayRemove([
                                              containerUsersRecord.reference
                                            ]),
                                          },
                                        ),
                                      });
                                      // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                      // createActivity

                                      var activityRecordReference =
                                          ActivityRecord.collection.doc();
                                      await activityRecordReference.set({
                                        ...createActivityRecordData(
                                          activityName:
                                              'Member Removed from Project',
                                          activityTime: getCurrentTimestamp,
                                          activityType:
                                              widget.projectRef?.projectName,
                                          projectRef:
                                              widget.projectRef?.reference,
                                          otherUser: currentUserReference,
                                          activitySubText:
                                              'A member has been removed from ',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'targetUserRef': [
                                              containerUsersRecord.reference
                                            ],
                                            'unreadByUser': [
                                              containerUsersRecord.reference
                                            ],
                                          },
                                        ),
                                      });
                                      _model.activityCreated =
                                          ActivityRecord.getDocumentFromData({
                                        ...createActivityRecordData(
                                          activityName:
                                              'Member Removed from Project',
                                          activityTime: getCurrentTimestamp,
                                          activityType:
                                              widget.projectRef?.projectName,
                                          projectRef:
                                              widget.projectRef?.reference,
                                          otherUser: currentUserReference,
                                          activitySubText:
                                              'A member has been removed from ',
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'targetUserRef': [
                                              containerUsersRecord.reference
                                            ],
                                            'unreadByUser': [
                                              containerUsersRecord.reference
                                            ],
                                          },
                                        ),
                                      }, activityRecordReference);

                                      context.pushNamed(
                                        ProjectDetailsPageWidget.routeName,
                                        queryParameters: {
                                          'projectRef': serializeParam(
                                            widget.projectRef,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'projectRef': widget.projectRef,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.leftToRight,
                                            duration:
                                                Duration(milliseconds: 240),
                                          ),
                                        },
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'You have removed a member from the project.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 160.0,
                                      height: 110.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x34090F13),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  containerUsersRecord.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-jnvhvf/assets/xc10k3tgih2u/app_projects@1x.png',
                                                ),
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                containerUsersRecord
                                                    .displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                await widget
                                                    .projectRef!.reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'usersAssigned':
                                                          FieldValue
                                                              .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'prexm7ph' /* Remove */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 32.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '78fdfkdh' /* Add Members */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 44.0),
                    child: FutureBuilder<List<UsersRecord>>(
                      future: (_model.firestoreRequestCompleter ??=
                              Completer<List<UsersRecord>>()
                                ..complete(queryUsersRecordOnce()))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        if (listViewUsersRecordList.isEmpty) {
                          return Center(
                            child: Container(
                              height: 300.0,
                              child: EmptyMembersWidget(
                                title: 'No Search Results',
                                bodyText: 'Find users by searching above.',
                              ),
                            ),
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            safeSetState(
                                () => _model.firestoreRequestCompleter = null);
                            await _model.waitForFirestoreRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUsersRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewUsersRecord =
                                  listViewUsersRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        TeamMemberDetailsWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x32000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(26.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                listViewUsersRecord.photoUrl,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-jnvhvf/assets/xc10k3tgih2u/app_projects@1x.png',
                                              ),
                                              width: 36.0,
                                              height: 36.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          listViewUsersRecord
                                                              .email,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await widget
                                                  .projectRef!.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'usersAssigned':
                                                        FieldValue.arrayUnion([
                                                      listViewUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                              // createActivity

                                              var activityRecordReference =
                                                  ActivityRecord.collection
                                                      .doc();
                                              await activityRecordReference
                                                  .set({
                                                ...createActivityRecordData(
                                                  activityName:
                                                      'New Member in Project',
                                                  activityTime:
                                                      getCurrentTimestamp,
                                                  activityType: widget
                                                      .projectRef?.projectName,
                                                  projectRef: widget
                                                      .projectRef?.reference,
                                                  otherUser:
                                                      currentUserReference,
                                                  activitySubText:
                                                      '${listViewUsersRecord.displayName} has been added to ',
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'targetUserRef': [
                                                      listViewUsersRecord
                                                          .reference
                                                    ],
                                                    'unreadByUser': widget
                                                        .projectRef
                                                        ?.usersAssigned,
                                                  },
                                                ),
                                              });
                                              _model.newActivity =
                                                  ActivityRecord
                                                      .getDocumentFromData({
                                                ...createActivityRecordData(
                                                  activityName:
                                                      'New Member in Project',
                                                  activityTime:
                                                      getCurrentTimestamp,
                                                  activityType: widget
                                                      .projectRef?.projectName,
                                                  projectRef: widget
                                                      .projectRef?.reference,
                                                  otherUser:
                                                      currentUserReference,
                                                  activitySubText:
                                                      '${listViewUsersRecord.displayName} has been added to ',
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'targetUserRef': [
                                                      listViewUsersRecord
                                                          .reference
                                                    ],
                                                    'unreadByUser': widget
                                                        .projectRef
                                                        ?.usersAssigned,
                                                  },
                                                ),
                                              }, activityRecordReference);

                                              context.pushNamed(
                                                ProjectDetailsPageWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'projectRef': serializeParam(
                                                    widget.projectRef,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'projectRef':
                                                      widget.projectRef,
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .leftToRight,
                                                    duration: Duration(
                                                        milliseconds: 240),
                                                  ),
                                                },
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'You have added a member to the project!',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'rzrf0zsp' /* Assign */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 70.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
