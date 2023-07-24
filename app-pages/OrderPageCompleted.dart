import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'order_page_completed_model.dart';
export 'order_page_completed_model.dart';

class OrderPageCompletedWidget extends StatefulWidget {
  const OrderPageCompletedWidget({Key? key}) : super(key: key);

  @override
  _OrderPageCompletedWidgetState createState() =>
      _OrderPageCompletedWidgetState();
}

class _OrderPageCompletedWidgetState extends State<OrderPageCompletedWidget> {
  late OrderPageCompletedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPageCompletedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OrderPageCompleted'});
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
              context.pushNamed('OrderPage');
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Completed Orders',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
                child: Text(
                  'Your completed orders will be shown below',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<RequestsRecord>>(
                      stream: queryRequestsRecord(
                        queryBuilder: (requestsRecord) => requestsRecord
                            .where('uidCustomer', isEqualTo: currentUserUid)
                            .where('requestStatus', isEqualTo: 'Completed')
                            .orderBy('requestDate'),
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
                        List<RequestsRecord> listViewRequestsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewRequestsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewRequestsRecord =
                                listViewRequestsRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'OrderSummary',
                                    queryParameters: {
                                      'nurseName': serializeParam(
                                        listViewRequestsRecord.nurseName,
                                        ParamType.String,
                                      ),
                                      'nursePhoneNumber': serializeParam(
                                        listViewRequestsRecord.nursePhoneNumber,
                                        ParamType.String,
                                      ),
                                      'requestDate': serializeParam(
                                        listViewRequestsRecord.requestDate,
                                        ParamType.DateTime,
                                      ),
                                      'requestStatus': serializeParam(
                                        listViewRequestsRecord.requestStatus,
                                        ParamType.String,
                                      ),
                                      'customerAddress': serializeParam(
                                        listViewRequestsRecord.customerAddress,
                                        ParamType.String,
                                      ),
                                      'customerName': serializeParam(
                                        listViewRequestsRecord.customerName,
                                        ParamType.String,
                                      ),
                                      'consultationPrice': serializeParam(
                                        listViewRequestsRecord
                                            .consultationPrice,
                                        ParamType.double,
                                      ),
                                      'consultationPriceInCents':
                                          serializeParam(
                                        listViewRequestsRecord
                                            .consultationPriceInCents,
                                        ParamType.int,
                                      ),
                                      'orderID': serializeParam(
                                        listViewRequestsRecord.reference.id,
                                        ParamType.String,
                                      ),
                                      'customerPhoneNumber': serializeParam(
                                        listViewRequestsRecord
                                            .customerPhoneNumber,
                                        ParamType.String,
                                      ),
                                      'uidCustomer': serializeParam(
                                        listViewRequestsRecord.uidCustomer,
                                        ParamType.String,
                                      ),
                                      'uidNurse': serializeParam(
                                        listViewRequestsRecord.uidNurse,
                                        ParamType.String,
                                      ),
                                      'customerEmail': serializeParam(
                                        currentUserEmail,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      text:
                                                          listViewRequestsRecord
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
                                                        fontFamily: 'Outfit',
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
                                                      listViewRequestsRecord
                                                          .requestDate!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 129,
                                                height: 67,
                                                decoration: BoxDecoration(
                                                  color: Color(0x0014181B),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    listViewRequestsRecord
                                                        .customerAddress,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 30, 0, 0),
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
                                                            listViewRequestsRecord
                                                                .requestDate!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
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
                                          mainAxisSize: MainAxisSize.min,
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
                                                      listViewRequestsRecord
                                                          .consultationPrice
                                                          .toString(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
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
                                                      if (listViewRequestsRecord
                                                              .requestStatus ==
                                                          'Pending') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else if (listViewRequestsRecord
                                                              .requestStatus ==
                                                          'Accepted') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .tertiary;
                                                      } else if (listViewRequestsRecord
                                                              .requestStatus ==
                                                          'Confirmed') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .success;
                                                      } else if (listViewRequestsRecord
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
                                                      listViewRequestsRecord
                                                          .requestStatus,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: listViewRequestsRecord
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Container(
                                                width: 114,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                                child: Visibility(
                                                  visible:
                                                      !listViewRequestsRecord
                                                          .isReviewed,
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                        'OrderCompletedSummary',
                                                        queryParameters: {
                                                          'nurseName':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .nurseName,
                                                            ParamType.String,
                                                          ),
                                                          'nursePhoneNumber':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .nursePhoneNumber,
                                                            ParamType.String,
                                                          ),
                                                          'requestDate':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .requestDate,
                                                            ParamType.DateTime,
                                                          ),
                                                          'requestStatus':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .requestStatus,
                                                            ParamType.String,
                                                          ),
                                                          'customerAddress':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .customerAddress,
                                                            ParamType.String,
                                                          ),
                                                          'customerName':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .customerName,
                                                            ParamType.String,
                                                          ),
                                                          'consultationPrice':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .consultationPrice,
                                                            ParamType.double,
                                                          ),
                                                          'consultationPriceInCents':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .consultationPriceInCents,
                                                            ParamType.int,
                                                          ),
                                                          'orderID':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .reference.id,
                                                            ParamType.String,
                                                          ),
                                                          'customerPhoneNumber':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .customerPhoneNumber,
                                                            ParamType.String,
                                                          ),
                                                          'uidCustomer':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .uidCustomer,
                                                            ParamType.String,
                                                          ),
                                                          'uidNurse':
                                                              serializeParam(
                                                            listViewRequestsRecord
                                                                .uidNurse,
                                                            ParamType.String,
                                                          ),
                                                          'customerEmail':
                                                              serializeParam(
                                                            currentUserEmail,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    text: 'Leave Review',
                                                    icon: Icon(
                                                      Icons.check,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 26,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 1,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 114,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                              child: Visibility(
                                                visible: listViewRequestsRecord
                                                    .isReviewed,
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'Reviewed',
                                                  icon: Icon(
                                                    Icons.check,
                                                    size: 15,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 26,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .success,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    elevation: 1,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
