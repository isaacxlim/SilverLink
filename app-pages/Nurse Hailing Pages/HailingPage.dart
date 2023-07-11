import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

import 'hailing_page_model.dart';
export 'hailing_page_model.dart';

class HailingPageWidget extends StatefulWidget {
  const HailingPageWidget({
    Key? key,
    required this.datePicked,
  }) : super(key: key);

  final DateTime? datePicked;

  @override
  _HailingPageWidgetState createState() => _HailingPageWidgetState();
}

class _HailingPageWidgetState extends State<HailingPageWidget>
    with TickerProviderStateMixin {
  late HailingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HailingPageModel());

    _model.textController ??= TextEditingController();
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
              context.pushNamed('HailingSearchPage');

              setState(() {
                FFAppState().dateEntered = false;
              });
            },
          ),
          title: Text(
            'Search nurses',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: Colors.black,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: TextFormField(
                  controller: _model.textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 2000),
                    () async {
                      await queryNursesRecordOnce()
                          .then(
                            (records) => _model.simpleSearchResults =
                                TextSearch(
                              records
                                  .map(
                                    (record) =>
                                        TextSearchItem(record, [record.name!]),
                                  )
                                  .toList(),
                            )
                                    .search(_model.textController.text)
                                    .map((r) => r.object)
                                    .toList(),
                          )
                          .onError((_, __) => _model.simpleSearchResults = [])
                          .whenComplete(() => setState(() {}));
                    },
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Search for nurses...',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData('Male', Icons.tag_faces_outlined),
                            ChipData('Female', Icons.face)
                          ],
                          onChanged: (val) =>
                              setState(() => _model.choiceChipsValues = val),
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18,
                            elevation: 4,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            iconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            iconSize: 18,
                            elevation: 0,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          chipSpacing: 12,
                          rowSpacing: 12,
                          multiselect: true,
                          initialized: _model.choiceChipsValues != null,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      'Nurses matching search: ',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  if (FFAppState().dateEntered)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 12, 0, 0),
                      child: FutureBuilder<int>(
                        future: queryNursesRecordCount(
                          queryBuilder: (nursesRecord) => nursesRecord
                              .where('endDateAvailable',
                                  isGreaterThanOrEqualTo: widget.datePicked)
                              .whereIn('gender', _model.choiceChipsValues),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: SpinKitChasingDots(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15,
                                ),
                              ),
                            );
                          }
                          int textCount = snapshot.data!;
                          return Text(
                            textCount.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.black,
                                ),
                          );
                        },
                      ),
                    ),
                  if (!FFAppState().dateEntered)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        'Date not Entered!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFFF2D2D),
                            ),
                      ),
                    ),
                ],
              ),
              if (FFAppState().dateEntered)
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: StreamBuilder<List<NursesRecord>>(
                      stream: queryNursesRecord(
                        queryBuilder: (nursesRecord) => nursesRecord
                            .where('endDateAvailable',
                                isGreaterThanOrEqualTo: widget.datePicked)
                            .whereIn('gender', _model.choiceChipsValues),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<NursesRecord> listViewNursesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNursesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewNursesRecord =
                                listViewNursesRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'HailingConfirmation',
                                    queryParameters: {
                                      'nurseName': serializeParam(
                                        listViewNursesRecord.name,
                                        ParamType.String,
                                      ),
                                      'nurseVisitPrice': serializeParam(
                                        listViewNursesRecord.visitPrice,
                                        ParamType.double,
                                      ),
                                      'nurseEmail': serializeParam(
                                        listViewNursesRecord.email,
                                        ParamType.String,
                                      ),
                                      'nursePhoneNumber': serializeParam(
                                        listViewNursesRecord.phoneNumber,
                                        ParamType.int,
                                      ),
                                      'visitDateTime': serializeParam(
                                        widget.datePicked,
                                        ParamType.DateTime,
                                      ),
                                      'invoiceNumber': serializeParam(
                                        random_data.randomInteger(
                                            100000, 999999),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 0,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(6, 0, 0, 0),
                                                child: Text(
                                                  listViewNursesRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                6, 0, 0, 0),
                                                    child: Text(
                                                      listViewNursesRecord
                                                          .yearsOfExp
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.black,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    ' Years of Experience',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                6, 0, 0, 0),
                                                    child: Text(
                                                      '\$',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewNursesRecord
                                                        .visitPrice
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'HailingConfirmation',
                                              queryParameters: {
                                                'nurseName': serializeParam(
                                                  listViewNursesRecord.name,
                                                  ParamType.String,
                                                ),
                                                'nurseVisitPrice':
                                                    serializeParam(
                                                  listViewNursesRecord
                                                      .visitPrice,
                                                  ParamType.double,
                                                ),
                                                'nurseEmail': serializeParam(
                                                  listViewNursesRecord.email,
                                                  ParamType.String,
                                                ),
                                                'nursePhoneNumber':
                                                    serializeParam(
                                                  listViewNursesRecord
                                                      .phoneNumber,
                                                  ParamType.int,
                                                ),
                                                'visitDateTime': serializeParam(
                                                  widget.datePicked,
                                                  ParamType.DateTime,
                                                ),
                                                'invoiceNumber': serializeParam(
                                                  random_data.randomInteger(
                                                      100000, 999999),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 4, 4, 4),
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
