import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modal_activity/modal_activity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'notification_trigger_model.dart';
export 'notification_trigger_model.dart';

class NotificationTriggerWidget extends StatefulWidget {
  const NotificationTriggerWidget({super.key});

  @override
  State<NotificationTriggerWidget> createState() =>
      _NotificationTriggerWidgetState();
}

class _NotificationTriggerWidgetState extends State<NotificationTriggerWidget> {
  late NotificationTriggerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationTriggerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: queryActivityRecordCount(
        queryBuilder: (activityRecord) => activityRecord
            .where(
              'unreadByUser',
              arrayContains: currentUserReference,
            )
            .where(
              'otherUser',
              isNotEqualTo: currentUserReference,
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
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        int badgeCount = snapshot.data!;

        return badges.Badge(
          badgeContent: Text(
            badgeCount.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          showBadge: true,
          shape: badges.BadgeShape.circle,
          badgeColor: FlutterFlowTheme.of(context).tertiary,
          elevation: 4.0,
          padding: EdgeInsets.all(8.0),
          position: badges.BadgePosition.topEnd(),
          animationType: badges.BadgeAnimationType.scale,
          toAnimate: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
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
                      child: ModalActivityWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Stack(
              children: [
                if (badgeCount == 0)
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.notifications_none,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                if (badgeCount >= 1)
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.notifications,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
