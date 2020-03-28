prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1177226447624950292
,p_default_application_id=>103160
,p_default_id_offset=>0
,p_default_owner=>'ONTOOR'
);
end;
/
 
prompt APPLICATION 103160 - Graph
--
-- Application Export:
--   Application:     103160
--   Name:            Graph
--   Date and Time:   18:19 Saturday March 28, 2020
--   Exported By:     CANDC.VIKAS@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 2833044527247082566
--   Manifest End
--   Version:         20.1.0.00.11
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/print_region_to_pdf_v_2_0
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2833044527247082566)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'PRINT.REGION.TO.PDF.V.2.0'
,p_display_name=>'Print Region Into PDF V 2.0'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js',
''))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION PREVIEW_REGION_TO_PDF (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'',
'    APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''printpdf'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL',
'        , p_check_to_add_minified => true',
'    ); ',
'    ',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () {printpdf(this); }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'PREVIEW_REGION_TO_PDF'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'2.0'
,p_files_version=>14
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E207072696E74706466286E297B636F6E736F6C652E6C6F67286E293B76617220653D6E2E74726967676572696E67456C656D656E742E69643B636F6E7374206F3D5B24286E2E6166666563746564456C656D656E7473295D3B242E65';
wwv_flow_api.g_varchar2_table(2) := '616368286F2C66756E6374696F6E286E2C6F297B76617220743D6F5B305D2E69643B636F6E736F6C652E6C6F672874292C24282223222B65292E7375626D697428293B76617220693D646F63756D656E742E676574456C656D656E74427949642874292E';
wwv_flow_api.g_varchar2_table(3) := '696E6E657248544D4C2C643D646F63756D656E742E626F64792E696E6E657248544D4C3B646F63756D656E742E626F64792E696E6E657248544D4C3D692C77696E646F772E7072696E7428292C646F63756D656E742E626F64792E696E6E657248544D4C';
wwv_flow_api.g_varchar2_table(4) := '3D647D297D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(2833133794932707913)
,p_plugin_id=>wwv_flow_api.id(2833044527247082566)
,p_file_name=>'printpdf.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
