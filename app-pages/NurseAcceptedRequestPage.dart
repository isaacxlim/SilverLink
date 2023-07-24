import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'nurse_accepted_request_page_model.dart';
export 'nurse_accepted_request_page_model.dart';

class NurseAcceptedRequestPageWidget extends StatefulWidget {
  const NurseAcceptedRequestPageWidget({Key? key}) : super(key: key);

  @override
  _NurseAcceptedRequestPageWidgetState createState() =>
      _NurseAcceptedRequestPageWidgetState();
}

class _NurseAcceptedRequestPageWidgetState
    extends State<NurseAcceptedRequestPageWidget> {
  late NurseAcceptedRequestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NurseAcceptedRequestPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NurseAcceptedRequestPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('ProfilePage');
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Accepted Request List',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
                  child: Text(
                    'Your accepted requests will be shown below',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                  child: StreamBuilder<List<RequestsRecord>>(
                    stream: queryRequestsRecord(
                      queryBuilder: (requestsRecord) => requestsRecord
                          .where('uidNurse', isEqualTo: currentUserUid)
                          .whereIn('requestStatus',
                              ['Accepted', 'Confirmed']).orderBy('requestDate'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<RequestsRecord> columnRequestsRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnRequestsRecordList.length, (columnIndex) {
                            final columnRequestsRecord =
                                columnRequestsRecordList[columnIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'NurseAcceptedSummaryPage',
                                    queryParameters: {
                                      'nurseName': serializeParam(
                                        columnRequestsRecord.nurseName,
                                        ParamType.String,
                                      ),
                                      'nursePhoneNumber': serializeParam(
                                        columnRequestsRecord.nursePhoneNumber,
                                        ParamType.String,
                                      ),
                                      'requestDate': serializeParam(
                                        columnRequestsRecord.requestDate,
                                        ParamType.DateTime,
                                      ),
                                      'requestStatus': serializeParam(
                                        columnRequestsRecord.requestStatus,
                                        ParamType.String,
                                      ),
                                      'customerName': serializeParam(
                                        columnRequestsRecord.customerName,
                                        ParamType.String,
                                      ),
                                      'consultationPrice': serializeParam(
                                        columnRequestsRecord.consultationPrice,
                                        ParamType.double,
                                      ),
                                      'consultationPriceInCents':
                                          serializeParam(
                                        columnRequestsRecord
                                            .consultationPriceInCents,
                                        ParamType.int,
                                      ),
                                      'orderID': serializeParam(
                                        columnRequestsRecord.reference.id,
                                        ParamType.String,
                                      ),
                                      'customerPhoneNumber': serializeParam(
                                        columnRequestsRecord
                                            .customerPhoneNumber,
                                        ParamType.String,
                                      ),
                                      'customerAddress': serializeParam(
                                        columnRequestsRecord.customerAddress,
                                        ParamType.String,
                                      ),
                                      'uidCustomer': serializeParam(
                                        columnRequestsRecord.uidCustomer,
                                        ParamType.String,
                                      ),
                                      'uidNurse': serializeParam(
                                        columnRequestsRecord.uidNurse,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 570,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x0014181B),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Order #: ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: columnRequestsRecord
                                                          .reference.id,
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 11,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'MMMMEEEEd',
                                                      columnRequestsRecord
                                                          .requestDate!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 129,
                                                height: 73,
                                                decoration: BoxDecoration(
                                                  color: Color(0x0014181B),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    columnRequestsRecord
                                                        .customerAddress,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Container(
                                                  height: 32,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x001D2428),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7, 0, 7, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'jm',
                                                            columnRequestsRecord
                                                                .requestDate!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Wrap(
                                              spacing: 0,
                                              runSpacing: 0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection:
                                                  VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '\$',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.black,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Text(
                                                      columnRequestsRecord
                                                          .consultationPrice
                                                          .toString(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.black,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child: Container(
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if (columnRequestsRecord
                                                              .requestStatus ==
                                                          'Pending') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else if (columnRequestsRecord
                                                              .requestStatus ==
                                                          'Accepted') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .tertiary;
                                                      } else if (columnRequestsRecord
                                                              .requestStatus ==
                                                          'Confirmed') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .success;
                                                      } else if (columnRequestsRecord
                                                              .requestStatus ==
                                                          'Completed') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBtnText;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 12, 0),
                                                    child: Text(
                                                      columnRequestsRecord
                                                          .requestStatus,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: columnRequestsRecord
                                                                        .requestStatus ==
                                                                    'Completed'
                                                                ? Colors.black
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                          ),
                                                    ),
                                                  ),
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
                            );
                          }).divide(SizedBox(height: 12)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
