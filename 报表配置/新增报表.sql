//梦网网关BHSM统计指标(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.O_RE_ST_MWWG_N31_01_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_MWWG_N31_01_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --SEND_BHSM_VALUE=发送BHSM值 --RECV_BHSM_VALUE=接收BHSM值 --SYS_PEAK_FLUX=系统峰值 --STOP_TIME_INT=整型结束时间  
</select>

SELECT 
<if2 test=" '@timeType'=='hour' ">to_char(STARTTIME,'yyyy-MM-dd hh24') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SEND_BHSM_VALUE,
RECV_BHSM_VALUE,
SYS_PEAK_FLUX,
STOP_TIME_INT
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//SP流量指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdm.DM_WLRPT_ENODEB_SAVM_15M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_JRWG_N31_03_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_JRWG_N31_03_D</if>   
</select>


<select id="resultMapping">
 --START_TIME=开始时间 --END_TIME=结束时间 --NETYPE=类型 --VER=版本 --SP_NAME=sp企业名称 --SP_CODE=sp企业代码 --SP_SERV_CODE=sp服务代码 --SP_ACCESS_ADDR=sp接入地 --CDGW_SEND_SP_MO_NUM=接入网关向sp转发mo总数 --CDGW_SEND_SP_MO_SUC_NUM=接入网关向sp转发mo成功总数 --CDGW_SEND_SP_MO_FAIL_NUM=接入网关向sp转发mo失败总数 --CDGW_SEND_SP_MO_SUC_UTIL=接入网关向sp转发mo成功率 --SP_SEND_CDGW_MT_NUM=sp向接入网关发送mt总数 --CDGW_RET_SP_RESP_SUC_NUM=接入网关向sp返回成功应答总数 --CDGW_RET_SP_RESP_FAIL_NUM=接入网关向sp返回失败应答总数 --SP_COMM_MT_SUC_UTIL=sp提交mt成功率(%) --CDGW_TRANS_SP_STATE_NUM=接入网关向sp转发状态报告总数 --ISMG_TRANS_SP_SUCC_STATE_NUM=接入网关向sp转发成功状态报告总数 --ISMG_TRANS_SP_FAIL_STATE_NUM=接入网关向sp转发失败状态报告总数 --MT_STATE_RTN_RATIO=mt状态报告返回率(%) --MT_SUCC_RATIO=mt最终成功率(%) 
</select>

SELECT 
<if2 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if2>
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SP_NAME,
SP_CODE,
SP_SERV_CODE,
SP_ACCESS_ADDR,
CDGW_SEND_SP_MO_NUM,
CDGW_SEND_SP_MO_SUC_NUM,
CDGW_SEND_SP_MO_FAIL_NUM,
CDGW_SEND_SP_MO_SUC_UTIL,
SP_SEND_CDGW_MT_NUM,
CDGW_RET_SP_RESP_SUC_NUM,
CDGW_RET_SP_RESP_FAIL_NUM,
SP_COMM_MT_SUC_UTIL,
CDGW_TRANS_SP_STATE_NUM,
ISMG_TRANS_SP_SUCC_STATE_NUM,
ISMG_TRANS_SP_FAIL_STATE_NUM,
MT_STATE_RTN_RATIO,
MT_SUCC_RATIO

FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//网关收发消息性能指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">IPMSDW.O_RE_ST_HYWG_N31_12_5M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_N31_12_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HYWG_N31_12_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --SEND_SUBMIT_MESSAGE=发送Submit消息数(条)【网关到短信中心】 --SEND_DELIVER_MESSAGE=发送Deliver消息数（条）【网关到EC】 --SEND_STATUS_REPORT_MESSAGE=发送状态报告消息数（条）【网关给EC的Report】 --SEND_MESS_NUM=发送消息总数（条） --SEND_MAX_FLOW=发送峰值流量(秒/条) --RECE_SUBMIT_MESSAGE=接收Submit消息数（条）【EC到网关】 --RECE_DELIVER_MESSAGE=接收Deliver消息数（条）【短信中心到网关】 --RECE_STATUS_REPORT_MESSAGE=接收状态报告消息数（条）【短信中心和异省网关到本地网关】 --RECE_MESS_NUM=接收消息总数（条） --RECE_MAX_FLOW=接收峰值流量(秒/条)
</select>

SELECT 
<if2 test=" '@timeType'=='min' ">to_char(STARTTIME,'yyyy-MM-dd hh24:mi') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24:mi') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24:mi') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if3> 
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER,
SEND_SUBMIT_MESSAGE,
SEND_DELIVER_MESSAGE,
SEND_STATUS_REPORT_MESSAGE,
SEND_MESS_NUM,
SEND_MAX_FLOW,
RECE_SUBMIT_MESSAGE,
RECE_DELIVER_MESSAGE,
RECE_STATUS_REPORT_MESSAGE,
RECE_MESS_NUM,
RECE_MAX_FLOW
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//互通网关统计指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">IPMSDW.O_RE_ST_HLHTWG_02_5M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HLHTWG_02_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.DW_FT_RE_ST_HLHTWG_02_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --TELE_ID=运营商 --TO_SM_SUBMIT_NUM=送往运营商的短信尝试提交总条数 --TO_SM_SUBMIT_SUC_NUM=送往运营商的短信成功提交总条数 --TO_SM_SUBMIT_SUC_UTIL=送往运营商的短信提交成功率 --RETN_STATE_NUM=运营商返回状态报告总数 --RETN_STATE_SUC_NUM=运营商返回成功状态报告总数 --RETN_STATE_SUC_UTIL=送往运营商短信发送成功率 --SM_SUBMIT_NUM=运营商送来短信尝试提交总条数 --SM_SUBMIT_SUC_NUM=运营商送来短信成功提交总条数 --SM_SUBMIT_SUC_UTIL=运营商送来短信提交成功率 --TO_RETN_STATE_NUM=移动返回运营商状态报告总数 --TO_RETN_STATE_SUC_NUM=移动返回运营商成功状态报告总数 --SM_SEND_SUC_UTIL=运营商送来短信发送成功率
</select>

SELECT 
<if2 test=" '@timeType'=='min' ">to_char(STARTTIME,'yyyy-MM-dd hh24:mi') STARTTIME,to_char(ENDTIME,'yyyy-MM-dd hh24:mi') ENDTIME,to_char(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24:mi') END_TIME,DATASOURCEID,</if2>
<if3 test=" '@timeType'=='hour' ">to_char(START_TIME,'yyyy-MM-dd hh24') START_TIME,to_char(END_TIME,'yyyy-MM-dd hh24') END_TIME,</if3> 
<if3 test=" '@timeType'=='day' ">to_char(START_TIME,'yyyy-MM-dd') START_TIME,to_char(END_TIME,'yyyy-MM-dd') END_TIME,</if3> 
NETYPE,
NODEID,
VER
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//TD_MMS业务KPI接通率统计指标组
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">IPMSDW.O_RE_ST_HYWG_N31_12_5M</if>
     <if test=" '@timeType'=='hour' ">IPMSDW.DW_FT_RE_ST_HYWG_N31_12_H</if>
     <if test=" '@timeType'=='day' ">IPMSDW.O_RE_ST_MMS_KPI_D</if>   
</select>


<select id="resultMapping">
  --STARTTIME=开始时间 --DATASOURCEID=资源编码 --ENDTIME=结束时间 --START_TIME=开始时间(兼容数据网管) --END_TIME=结束时间(兼容数据网管) --MMS_SEND_NUM=MMS发送总条数 --MMS_TOP_NUM=MMS忙时业务量 --MMS_REGISTER_USER_NUM=MMS注册用户总数 --USE_MMS_USER_NUM=本时段使用用户数 --MMS_ALBUM_NUM=转梦网相册条数 --MMS_ALBUM_SUCC_NUM=转梦网相册成功条数 --MMS_ALBUM_SUCC_RATIO=转梦网相册成功率 --MMS_SUBMIT_NUM_2=MMS发送总条数-2 --MMS_DELV_NUM_2=MMS接收总条数-2 --MMS_NETWOER_SUBMIT_FAIL_NUM=网络失败提交数 --MMS_USER_SUBMIT_FAIL_NUM=用户失败提交数 --MMS_NETWORK_DELV_FAIL_NUM=网络失败下发数 --MMS_USER_DELV_FAIL_NUM=用户失败下发数 --MMS_TOTAL_NETWORK_SUCC_RATIO=彩信网络全程接通率 --MMS_TOTAL_USER_SUCC_RATIO=彩信用户全程接通率 --MMS_TOTAL_SUCC_RAIO=彩信全程接通率 --SERVICE_IP=被管设备IP地址
</select>

SELECT 
to_char(START_TIME,'yyyy-MM-dd') START_TIME,
to_char(END_TIME,'yyyy-MM-dd') END_TIME,
MMS_SEND_NUM,
MMS_TOP_NUM,
MMS_REGISTER_USER_NUM,
USE_MMS_USER_NUM,
MMS_ALBUM_NUM,
MMS_ALBUM_SUCC_NUM,
MMS_ALBUM_SUCC_RATIO,
MMS_SUBMIT_NUM_2,
MMS_DELV_NUM_2,
MMS_NETWOER_SUBMIT_FAIL_NUM,
MMS_USER_SUBMIT_FAIL_NUM,
MMS_NETWORK_DELV_FAIL_NUM,
MMS_USER_DELV_FAIL_NUM,
MMS_TOTAL_NETWORK_SUCC_RATIO,
MMS_TOTAL_USER_SUCC_RATIO,
MMS_TOTAL_SUCC_RAIO,
SERVICE_IP
FROM <included id="tableChooseSE"/>
WHERE 1=1
<if test=" '@isContinue'=='f' ">
  and START_TIME in(#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>
union all 


//骨干网互联链路带宽利用率超阈值报表
select TIME_STAMP,
       B.CITY,
       B.IP_ADDR,
       B.SYS_NAME,
       c.IF_ALIAS,
       IF_IN_UTILITY,
       IF_OUT_UTILITY,
       to_char(max_if_in_time, 'YYYY-MM-DD hh24:mi:ss') max_if_in_time,
       to_char(max_if_out_time, 'YYYY-MM-DD hh24:mi:ss') max_if_out_time,
       IF_IN_TRAFFIC,
       IF_OUT_TRAFFIC,
       C.IF_NAME,
       case
         when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then
          ROUND(c.if_speed / 1024 / 1024 / 1000)
         else
          ROUND(c.if_speed / 1024 / 1024 / 1000)
       end if_speed
  from (select 
         TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周' as TIME_STAMP,
         A.UUID,
         ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
         ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time,
         ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
         ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC
          from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
               (select uuid
                  from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
                       IPMSDW.O_RM_DEVICE             B,
                       IPMSDW.O_RM_INTERFACE          c
                 where c.DEVICE_ID = B.DEVICE_ID
                   and c.ID = A.UUID
                   AND CITY IS NOT NULL
                   and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
                   and c.IF_ALIAS like '%CMNET%'
                   and c.if_name like '%/%'
                   and a.time_stamp >= trunc(sysdate - 7, 'iw')
                   and time_stamp < trunc(sysdate, 'iw') - 0.0001
                 group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周',
                          uuid,
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          C.IF_NAME,
                          c.IF_ALIAS,
                          c.if_speed
                having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
         where A.UUID = B.UUID
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
           and time_stamp < trunc(sysdate, 'iw') - 0.0001
         group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周', A.UUID) A,
       IPMSDW.O_RM_DEVICE B,
       IPMSDW.O_RM_INTERFACE c
 where c.DEVICE_ID = B.DEVICE_ID
   and c.ID = A.UUID
   AND CITY IS NOT NULL
   and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
   and c.IF_ALIAS like '%CMNET%'
   and c.if_name like '%/%'
union all
select 
 '合计' as TIME_STAMP,
 '--' CITY,
 '--' IP_ADDR,
 '--' SYS_NAME,
 '--' IF_ALIAS,
 ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
 ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_in_time,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_out_time,
 ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
 ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,
 '--' IF_NAME,
 null if_seed
  from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
       (select uuid
          from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
               IPMSDW.O_RM_DEVICE             B,
               IPMSDW.O_RM_INTERFACE          c
         where c.DEVICE_ID = B.DEVICE_ID
           and c.ID = A.UUID
           AND CITY IS NOT NULL
           and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
           and c.IF_ALIAS like '%CMNET%'
           and c.if_name like '%/%'
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
           and time_stamp < trunc(sysdate, 'iw') - 0.0001
         group by uuid,
                  B.CITY,
                  B.SYS_NAME,
                  B.IP_ADDR,
                  C.IF_NAME,
                  c.IF_ALIAS,
                  c.if_speed
        having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
 where A.UUID = B.UUID
   and a.time_stamp >= trunc(sysdate - 7, 'iw')
   and time_stamp < trunc(sysdate, 'iw') - 0.0001
 order by TIME_STAMP,
          IF_IN_UTILITY  desc,
          IF_OUT_UTILITY desc,
          CITY,
          SYS_NAME


//骨干网互联链路带宽利用率超阈值报表_正确
select TIME_STAMP,
       B.CITY,
       B.IP_ADDR,
       B.SYS_NAME,
       c.IF_ALIAS,
       IF_IN_UTILITY,
       IF_OUT_UTILITY,
       to_char(max_if_in_time, 'YYYY-MM-DD hh24:mi:ss') max_if_in_time,
       to_char(max_if_out_time, 'YYYY-MM-DD hh24:mi:ss') max_if_out_time,
       IF_IN_TRAFFIC,
       IF_OUT_TRAFFIC,
       C.IF_NAME,
       case
         when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then
          ROUND(c.if_speed / 1024 / 1024 / 1000)
         else
          ROUND(c.if_speed / 1024 / 1024 / 1000)
       end if_speed
  from (select /*+ no_merge(B) */
         TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周' as TIME_STAMP,
         A.UUID,
         ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
         ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time,
         ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
         ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC
          from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
               (select uuid
                  from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
                       IPMSDW.O_RM_DEVICE             B,
                       IPMSDW.O_RM_INTERFACE          c
                 where c.DEVICE_ID = B.DEVICE_ID
                   and c.ID = A.UUID
                   AND CITY IS NOT NULL
                   and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
                   and c.IF_ALIAS like '%CMNET%'
                   and c.if_name like '%/%'
                   and a.time_stamp >= trunc(sysdate - 7, 'iw')
                
                 group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周',
                          uuid,
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          C.IF_NAME,
                          c.IF_ALIAS,
                          c.if_speed
                having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
         where A.UUID = B.UUID
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
        
         group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周', A.UUID) A,
       IPMSDW.O_RM_DEVICE B,
       IPMSDW.O_RM_INTERFACE c
 where c.DEVICE_ID = B.DEVICE_ID
   and c.ID = A.UUID
   AND CITY IS NOT NULL
   and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
   and c.IF_ALIAS like '%CMNET%'
   and c.if_name like '%/%'
union all
select /*+ no_merge(B) */
 '合计' as TIME_STAMP,
 '--' CITY,
 '--' IP_ADDR,
 '--' SYS_NAME,
 '--' IF_ALIAS,
 ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
 ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_in_time,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_out_time,
 ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
 ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,
 '--' IF_NAME,
 null if_seed
  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
       (select uuid
          from IPMSDW.DW_FT_RE_ST_INTERFACE_D A,
               IPMSDW.O_RM_DEVICE             B,
               IPMSDW.O_RM_INTERFACE          c
         where c.DEVICE_ID = B.DEVICE_ID
           and c.ID = A.UUID
           AND CITY IS NOT NULL
           and b.SERVICE_SYSTEM_NAME = 'CMNET骨干网业务系统'
           and c.IF_ALIAS like '%CMNET%'
           and c.if_name like '%/%'
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
        
         group by uuid,
                  B.CITY,
                  B.SYS_NAME,
                  B.IP_ADDR,
                  C.IF_NAME,
                  c.IF_ALIAS,
                  c.if_speed
        having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
 where A.UUID = B.UUID
   and a.time_stamp >= trunc(sysdate - 7, 'iw')

 order by TIME_STAMP,
          IF_IN_UTILITY  desc,
          IF_OUT_UTILITY desc,
          CITY,
          SYS_NAME


//城域网互联链路带宽利用率超阈值报表
select TIME_STAMP,
       B.CITY,
       B.IP_ADDR,
       B.SYS_NAME,
       c.IF_ALIAS,
       IF_IN_UTILITY,
       IF_OUT_UTILITY,
       to_char(max_if_in_time, 'YYYY-MM-DD hh24:mi:ss') max_if_in_time,
       to_char(max_if_out_time, 'YYYY-MM-DD hh24:mi:ss') max_if_out_time,
       IF_IN_TRAFFIC,
       IF_OUT_TRAFFIC,
       C.IF_NAME,
       case
         when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then
          ROUND(c.if_speed / 1024 / 1024 / 1000)
         else
          ROUND(c.if_speed / 1024 / 1024 / 1000)
       end if_speed
  from (select 
         TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周' as TIME_STAMP,
         A.UUID,
         ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
         ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time,
         max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time,
         ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
         ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC
          from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
               (select uuid
                  from ipmsdw.DW_FT_RE_ST_INTERFACE_D A,
                       IPMSDW.O_RM_DEVICE             B,
                       IPMSDW.O_RM_INTERFACE          c
                 where c.DEVICE_ID = B.DEVICE_ID
                   and c.ID = A.UUID
                   AND CITY IS NOT NULL
                   and b.SERVICE_SYSTEM_NAME = 'CMNET城域网业务系统'
                   and (SYS_NAME like '%PB-CMNET%' or
                       SYS_NAME like '%PC-CMNET%' or
                       SYS_NAME like '%PA-CMNET%' or
                       SYS_NAME like '%PI-CMNET%' or
                       SYS_NAME like '%MB-CMNET%' or
                       SYS_NAME like '%MC-CMNET%' or
                       SYS_NAME like '%MA-CMNET%')
                   and c.IF_ALIAS like '%CMNET%'
                   and c.if_name like '%/%'
                   and a.time_stamp >= trunc(sysdate - 7, 'iw')
                   and time_stamp < trunc(sysdate, 'iw') - 0.0001
                 group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周',
                          uuid,
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          C.IF_NAME,
                          c.IF_ALIAS,
                          c.if_speed
                having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
         where A.UUID = B.UUID
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
           and time_stamp < trunc(sysdate, 'iw') - 0.0001
         group by TO_CHAR(TIME_STAMP, 'yyyy-IW') || '周', A.UUID) A,
       IPMSDW.O_RM_DEVICE B,
       IPMSDW.O_RM_INTERFACE c
 where c.DEVICE_ID = B.DEVICE_ID
   and c.ID = A.UUID
   AND CITY IS NOT NULL
   and b.SERVICE_SYSTEM_NAME = 'CMNET城域网业务系统'
   and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' or
       SYS_NAME like '%PA-CMNET%' or SYS_NAME like '%PI-CMNET%' or
       SYS_NAME like '%MB-CMNET%' or SYS_NAME like '%MC-CMNET%' or
       SYS_NAME like '%MA-CMNET%')
   and c.IF_ALIAS like '%CMNET%'
   and c.IF_ALIAS like '%CMNET%'
   and c.if_name like '%/%'
union all
select
 '合计' as TIME_STAMP,
 '--' CITY,
 '--' IP_ADDR,
 '--' SYS_NAME,
 '--' IF_ALIAS,
 ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY,
 ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_in_time,
 to_char(max(TIME_STAMP)
         KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc),
         'yyyy-MM-dd HH24:mi:ss') max_if_out_time,
 ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
 ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,
 '--' IF_NAME,
 null if_seed
  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
       (select uuid
          from ipmsdw.DW_FT_RE_ST_INTERFACE_D A,
               IPMSDW.O_RM_DEVICE             B,
               IPMSDW.O_RM_INTERFACE          c
         where c.DEVICE_ID = B.DEVICE_ID
           and c.ID = A.UUID
           AND CITY IS NOT NULL
           and b.SERVICE_SYSTEM_NAME = 'CMNET城域网业务系统'
           and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' or
               SYS_NAME like '%PA-CMNET%' or SYS_NAME like '%PI-CMNET%' or
               SYS_NAME like '%MB-CMNET%' or SYS_NAME like '%MC-CMNET%' or
               SYS_NAME like '%MA-CMNET%')
           and c.IF_ALIAS like '%CMNET%'
           and c.IF_ALIAS like '%CMNET%'
           and c.if_name like '%/%'
           and a.time_stamp >= trunc(sysdate - 7, 'iw')
           and time_stamp < trunc(sysdate, 'iw') - 0.0001
         group by uuid,
                  B.CITY,
                  B.SYS_NAME,
                  B.IP_ADDR,
                  C.IF_NAME,
                  c.IF_ALIAS,
                  c.if_speed
        having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50) B
 where A.UUID = B.UUID
   and a.time_stamp >= trunc(sysdate - 7, 'iw')
   and time_stamp < trunc(sysdate, 'iw') - 0.0001
 order by TIME_STAMP,
          IF_IN_UTILITY  desc,
          IF_OUT_UTILITY desc,
          CITY,
          SYS_NAME

//城域网互联链路带宽利用率超阈值报表_原来
<jdbcType name="discteteTime" type="array-date"/>
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
    <if test=" '@timeType'=='week' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大） --IF_SPEED=采集的接口速率 --IF_DESCR=接口描述 --
</select>





select 
<if3 test=" '@timeType'=='min' "> to_char(TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>

 B.CITY, B.IP_ADDR,B.SYS_NAME, c.IF_ALIAS, IF_IN_UTILITY, IF_OUT_UTILITY, to_char( max_if_in_time,'YYYY-MM-DD hh24:mi:ss') max_if_in_time,to_char( max_if_out_time,'YYYY-MM-DD hh24:mi:ss') max_if_out_time,IF_IN_TRAFFIC, IF_OUT_TRAFFIC, C.IF_NAME, 
    case when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then ROUND(c.if_speed / 1024 / 1024 / 1000) else ROUND(c.if_speed / 1024 / 1024 / 1000) end if_speed 
    from (select TO_CHAR(TIME_STAMP,'yyyy-IW')||'周' as TIME_STAMP, A.UUID, 
          ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time, 
          max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time, 
          ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC  from <included id="tableChooseSE"/> A,(select uuid 
          from <included id="tableChooseSE"/> A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c  where 
              c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL  
              and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  
              and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' 
                or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' 
                or SYS_NAME like '%MB-CMNET%' or SYS_NAME like'%MC-CMNET%' 
                or SYS_NAME like '%MA-CMNET%') 
              and c.IF_ALIAS like '%CMNET%' 
              and  c.if_name  like '%/%' 
              <if test=" '@isContinue'=='t' ">
                  and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
              </if>
              <if test=" '@isContinue'=='f' ">
                  and A.TIME_STAMP in (#discteteTime#)
              </if> 

group by 
TIME_STAMP,
uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,c.IF_ALIAS,
c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 
or max(A.MAX_IF_OUT_UTILITY) > 50)B  
          where A.UUID = B.UUID   
          <if test=" '@isContinue'=='t' ">
              and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
          </if>
          <if test=" '@isContinue'=='f' ">
              and A.TIME_STAMP in (#discteteTime#)
          </if>  
group by 
TIME_STAMP,
 A.UUID) A,   ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c 
    where  c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL 
    and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  
    and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' 
      or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' 
      or SYS_NAME like '%MB-CMNET%' 
      or SYS_NAME like'%MC-CMNET%' or SYS_NAME like '%MA-CMNET%') 
    and c.IF_ALIAS like '%CMNET%' and c.IF_ALIAS like '%CMNET%'
    and c.if_name like '%/%'  
    union all
 select  '合计' as TIME_STAMP,'--' CITY, '--'  IP_ADDR,'--'  SYS_NAME,'--' IF_ALIAS, 
             ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,
             to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_in_time, 
             to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_out_time, 
             ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,
             ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,'--' IF_NAME,
             null if_seed 
             from <included id="tableChooseSE"/> A,
             (select uuid 
             from <included id="tableChooseSE"/> A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c 
             where   c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL 
             and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  
             and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' 
              or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' 
              or SYS_NAME like '%MB-CMNET%' or SYS_NAME like'%MC-CMNET%' 
              or SYS_NAME like '%MA-CMNET%') and c.IF_ALIAS like '%CMNET%' 
             and c.IF_ALIAS like '%CMNET%' and  c.if_name  like '%/%' 
             <if test=" '@isContinue'=='t' ">
                 and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
             </if>
             <if test=" '@isContinue'=='f' ">
                  and A.TIME_STAMP in (#discteteTime#)
             </if>  
             group by 
             uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,
             c.IF_ALIAS,
             c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50)B 
              where A.UUID = B.UUID 
              <if test=" '@isContinue'=='t' ">
                  and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
              </if>
              <if test=" '@isContinue'=='f' ">
                   and A.TIME_STAMP in (#discteteTime#)
              </if>  
             order by TIME_STAMP, IF_IN_UTILITY desc,IF_OUT_UTILITY desc ,CITY, SYS_NAME 
