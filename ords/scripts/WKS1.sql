prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_default_workspace_id=>4434177535915918
);
end;
/
prompt  WORKSPACE 4434177535915918
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   04:17 Saturday November 1, 2025
--   Exported By:     ADMIN
--   Export Type:     Workspace Export
--   Version:         24.2.0
--   Instance ID:     1000116281801342
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_240200
 
begin
    wwv_flow_imp.set_security_group_id(p_security_group_id=>4434177535915918);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace WKS1...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 4434332055916080
 ,p_provisioning_company_id => 4434177535915918
 ,p_short_name => 'WKS1'
 ,p_display_name => 'WKS1'
 ,p_first_schema_provisioned => 'MBG'
 ,p_company_schemas => 'MBG'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'WKS1'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'WKS1'
 ,p_files_version => 1
 ,p_is_extension_yn => 'N'
 ,p_env_banner_yn => 'N'
 ,p_env_banner_pos => 'LEFT'
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 3231440569831072,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 3231397050831072,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 3231282102831071,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 3433951197003566,
  p_GROUP_NAME => 'Ahli Gizi',
  p_SECURITY_GROUP_ID => 4434177535915918,
  p_GROUP_DESC => '');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 3434012401004447,
  p_GROUP_NAME => 'Akuntan',
  p_SECURITY_GROUP_ID => 4434177535915918,
  p_GROUP_DESC => '');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '4434065356915918',
  p_user_name                    => 'ADMIN',
  p_first_name                   => 'FRANS',
  p_last_name                    => 'MAZHAR',
  p_description                  => '',
  p_email_address                => 'frans.mazhar@gmail.com',
  p_web_password                 => '27C07DF211378C36E7E5E5E240281721FEEACA2835F80AE1FD1586ABC1857C4271CCFF56293971D6FD6A5D60BF071D2500C23604DDFF7563BCB850863EF781C6',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MBG',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202511010354','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '3434372980010929',
  p_user_name                    => 'AYRA',
  p_first_name                   => 'Ayra',
  p_last_name                    => 'Aqila',
  p_description                  => '',
  p_email_address                => 'ayra.dibaq@gmail.com',
  p_web_password                 => '11F349E5FC67A4E67138606D0AE49301AE79AB59723A404CCCC2498A358DF7672EE29EDE252C6470DAEF0A8551BEDD61EE3A0DF95E968BA6565C02E8DDA824A4',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => '',
  p_default_schema               => 'MBG',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202511010000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'N',
  p_allow_sql_workshop_yn        => 'N',
  p_allow_team_development_yn    => 'N',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '3434500112016769',
  p_user_name                    => 'ERWIN',
  p_first_name                   => 'Erwin',
  p_last_name                    => 'Umar',
  p_description                  => '',
  p_email_address                => 'faturananta@yahoo.com	',
  p_web_password                 => '0DD9F90194747F3D6EE99F1D03FBD4D817C8B86289E4F714D4B1E8BBB19A0030D0B66EBF5D6F1F4856D3C9FB7A449F63E81F6D63F3CF4C2964CBADBFC38C1BA7',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'CREATE:EDIT:HELP:MONITOR:SQL:MONITOR:DATA_LOADER',
  p_default_schema               => 'MBG',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202511010000','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '3432857498984082',
  p_user_name                    => 'FRANS',
  p_first_name                   => 'FRANS',
  p_last_name                    => 'MAZHAR',
  p_description                  => '',
  p_email_address                => 'frans.mazhar@gmail.com',
  p_web_password                 => 'A66C1B0F847FEE38C473119EE570FD3EB62DB3F9C22DE0A1C70899E6AC9F0D9007A6BB6517AD50B344249DFEEEA5C24DC9EDACAEBF94B68F8B0EEAE0D2A1C34E',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'MBG',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202511010357','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
---------------------------
-- D G  B L U E P R I N T S
-- Creating Data Generator Blueprints...
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...Issue Templates
--
begin
null;
end;
/
--
prompt ...Issue Email Prefs
--
begin
null;
end;
/
--
prompt ...Label Groups
--
begin
null;
end;
/
--
prompt ...Labels
--
begin
null;
end;
/
--
prompt ... Milestones
--
begin
null;
end;
/
--
prompt ... Issues
--
begin
null;
end;
/
--
prompt ... Issue Attachments
--
begin
null;
end;
/
--
prompt ... Issues Milestones
--
begin
null;
end;
/
--
prompt ... Issues Labels
--
begin
null;
end;
/
--
prompt ... Issues stakeholders
--
begin
null;
end;
/
--
prompt ... Issues Comments
--
begin
null;
end;
/
--
prompt ... Issues Events
--
begin
null;
end;
/
--
prompt ... Issues Notifications
--
begin
null;
end;
/
 
prompt ... Extension Links
 
 
prompt ... Extension Grants
 
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
