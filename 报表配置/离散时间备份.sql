//上报异常情况统计表
select 
To_Char(IF_FILE_TIME,'yyyy-mm-dd hh24:mi:ss') as "数据时间",  
IF_FILE_NAME as "文件名称",
IF_NAME as "接口名称",
To_Char(SMMOTHTIME,'yyyy-mm-dd hh24:mi:ss') as "平滑时间",
ACTUALNUM as "实际数据量",
SMOOTHNUM as "平滑数据量"

       
     from ipmsds.SYS_LOGS_DS_FTP where 1=1  

           <if test=" '@isContinue'=='t' ">
         and IF_FILE_TIME between to_Date(#startTime#,'yyyymmddhh24miss') and                    
                       to_Date(#endTime#,'yyyymmddhh24miss')
 
       </if>
       <if test=" '@isContinue'=='f' ">
            AND to_char(IF_FILE_TIME,'yyyymmddhh24mi') IN (#discteteTime#) 
       </if> 

    and IF_STATUS =1


    and IF_PROCESS =2


//界面查询时延明细报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">log_view</if>
    <if test=" '@timeType'=='hour' ">log_view</if>
    <if test=" '@timeType'=='day' ">log_view</if>
    <if test=" '@timeType'=='week' ">log_view</if>
    <if test=" '@timeType'=='month' ">log_view</if>
</select>
<select id="timeChoose">
  <if test=" '@timeType'=='min' ">
    and substr(record_time,0,16)>=to_char(to_date(#startTime#,'yyyymmddhh24mi'),'yyyy-mm-dd hh24:mi')   
    and substr(record_time,0,16)<=to_char(to_date(#endTime#,'yyyymmddhh24mi'),'yyyy-mm-dd hh24:mi')  
  </if>
  <if test=" '@timeType'=='hour' ">
    and substr(record_time,0,13)>=to_char(to_date(substr(#startTime#,0,10),'yyyymmddhh24'),'yyyy-mm-dd hh24')   
    and substr(record_time,0,13)<=to_char(to_date(substr(#endTime#,0,10),'yyyymmddhh24'),'yyyy-mm-dd hh24')
  </if>
  <if test=" '@timeType'=='day' ">
    and substr(record_time,0,10)>=to_char(to_date(substr(#startTime#,0,8),'yyyymmdd'),'yyyy-mm-dd')   
    and substr(record_time,0,10)<=to_char(to_date(substr(#endTime#,0,8),'yyyymmdd'),'yyyy-mm-dd')  
  </if>
  <if test=" '@timeType'=='month' ">
    and substr(record_time,0,7)>=to_char(to_date(substr(#startTime#,0,6),'yyyymm'),'yyyy-mm')   
    and substr(record_time,0,7)<=to_char(to_date(substr(#endTime#,0,6),'yyyymm'),'yyyy-mm')  
  </if>
</select>
with log_view as (select "ID_",
       "APP_HOST",
       "HOST_",
       "LOG_LEVEL",
       "MESSAGE_",
       "MODULE_CODE",
       "OPERATE_TYPE",
       "QRYUSED_TIME",
       "RECORD_TIME",
       "USERNAME_",
       "AUDIT_ID",
       "AUTH_FLAG",
       "OPT_REASON",
       "ORDER_ID_",
       "OUTER_USER_"
  from ipmsp.SYS_LOGS_ORI
 where 1=1
   and  HOST_ <> '10.221.15.59'
   and  HOST_ <> '127.0.0.1'
   and  HOST_ <> '0:0:0:0:0:0:0:1'
  )



    select
record_time as "记录时间",
module_code as "模块名称",
ORDER_ID_ as "查询记录数",
case when u.username is null and u.fullname is null then null else u.username||'('||u.fullname||')' end as "用户名",
d.name_cn as "部门",
host_ as "IP地址",
app_host as "响应服务器",
qryused_time as "用时(ms)"


     from <included id="tableChooseSE"/> l
      left join ipmsp.sys_user u on l.username_ = u.username
      left join ipmsp.sys_userdepartment ud on u.id_ = ud.user_id
      left join ipmsp.sys_department d on ud.dept_id = d.id_
      where 1 = 1
      and l.OPT_REASON in ('local_sh')
 
       <if test=" '@isContinue'=='t' ">
                        <included id="timeChoose"/>

       </if>
       <if test=" '@isContinue'=='f' ">
           and substr(record_time,0,12) in (#discteteTime#)
       </if> 

//ESB模块


//DNS域名解析请求排行统计指标报表


//VOLTE报表业务统计模块

//行业网关模块

