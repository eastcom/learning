/**
 * 报表配置备份
 * @authors Kerry W (wangxuan@eastcom-sw.com)
 * @date    2016-08-25 10:36:39
 * @version $Id$
 */
//LTE小区维度报表
<select id="resultMapping">
--BigDataDlTraffic=大流量(包>500KB)总下行流量(Byte)--BigDataDlRate=http平均下载速率(包>500KB)(kbps)
</select>

select 
to_char(starttime) as "开始时间",   
city_id as "地市",
province_id as "省",
cell_id as "小区id",
cell_property as "小区属性",
HttpSuccNbr as "http访问成功次数(次)",
HttpAttNbr as "http访问请求次数(次)",
HttpSuccRate as "http访问成功率(%)",
HttpTotalRespTime as "http响应总时延(ms)",
HttpAvgRespTime as "http平均响应时延(ms)",
UlTraffic as "总上行流量(Byte)",
BigDataDlTraffic as "BigDataDlTraffic",
DlTraffic as "总下行流量(Byte)",
HttpAvgDlRate as "http平均下载速率(kbps)",
BigDataDlRate as "BigDataDlRate",
AttachAttNbr as "ATTACH请求次数",
AttachSuccNbr as "ATTACH成功次数",
AttachSuccRate as "ATTACH成功率(%)",
AttachTotalTime as "ATTACH总时延(ms)",
AttachAvgTime as "ATTACH平均时延(ms)",
EpsBearerAttNbr as "承载建立请求次数",
EpsBearerSuccNbr as "承载建立成功次数",
EpsBearerSuccRate as "承载建立成功率(%)",
EpsBearerTotalTime as "承载建立总时延(ms)",
EpsBearerAvgTime as "承载建立平均时延(ms)",
TcpAttNbr as "TCP建立请求次数",
TcpSuccNbr as "TCP建立成功次数",
TcpSuccRate as "TCP建立成功率",
TcpTotalTime as "TCP建立总时延(ms)",
TcpAvgTime as "TCP建立平均时延(ms)"

       
     from ipmsdw.DW_FT_SE_4G_AR_CL_GEN_5M where 1=1  

           <if test=" '@isContinue'=='t' ">
           and STARTTIME>=#startTime#  and STARTTIME<=#endTime#
       </if>
       <if test=" '@isContinue'=='f' ">
           and substr(STARTTIME,0,12) in (#discteteTime#)
       </if> 
  <isNotEmpty property="qry_0">
    and cell_property like '%$qry_0$%'
  </isNotEmpty>



//互通网管统计指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_HLHTWG_02_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_HLHTWG_02_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_HLHTWG_02_D</if>   
</select>

<select id="resultMapping">
  --START_TIME=开始时间 --TELE_ID=运营商 --TO_SM_SUBMIT_NUM=送往运营商的短信尝试提交总数 --TO_SM_SUBMIT_SUC_NUM=送往运营商的短信成功提交总数 --TO_SM_SUBMIT_SUC_UTIL=送往运营商的短信提交成功率 --RETN_STATE_NUM=运营商返回状态报告总数 --RETN_STATE_SUC_NUM=运营商返回状态成功报告总数 --RETN_STATE_SUC_UTIL=送往运营商短信发送成功率 --SM_SUBMIT_NUM=运营商送来短信尝试提交总数 --SM_SUBMIT_SUC_NUM=运营商送来短信成功提交总数 --SM_SUBMIT_SUC_UTIL=运营商送来短信提交成功率 --TO_RETN_STATE_NUM=移动返回运营商状态总报告数 --TO_RETN_STATE_SUC_NUM=移动返回运营商成功状态报告总数 --SM_SEND_SUC_UTIL=运营商送来短信发送成功率
</select>

select 
 to_char(START_TIME,'yyyy-MM-dd') AS "START_TIME",
 TELE_ID as "运营TELE_ID ",
 TO_SM_SUBMIT_NUM as "TO_SM_SUBMIT_NUM",
 TO_SM_SUBMIT_SUC_NUM as "TO_SM_SUBMIT_SUC_NUM",
 TO_SM_SUBMIT_SUC_UTIL as "TO_SM_SUBMIT_SUC_UTIL ",
 RETN_STATE_NUM as "RETN_STATE_NUM",
 RETN_STATE_SUC_NUM as "RETN_STATE_SUC_NUM",
 RETN_STATE_SUC_UTIL as "RETN_STATE_SUC_UTIL",
 SM_SUBMIT_NUM as "SM_SUBMIT_NUM",
 SM_SUBMIT_SUC_NUM as "SM_SUBMIT_SUC_NUM",
 SM_SUBMIT_SUC_UTIL as "SM_SUBMIT_SUC_UTIL",
 TO_RETN_STATE_NUM as "TO_RETN_STATE_NUM",
 TO_RETN_STATE_SUC_NUM as "TO_RETN_STATE_SUC_NUM",
 SM_SEND_SUC_UTIL as "SM_SEND_SUC_UTIL "
from <included id="tableChooseSE"/> where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-date"/>   
union all select '合计' START_TIME, '--' TELE_ID,sum(TO_SM_SUBMIT_NUM),sum(TO_SM_SUBMIT_SUC_NUM),avg(TO_SM_SUBMIT_SUC_UTIL),sum(RETN_STATE_NUM),sum(RETN_STATE_SUC_NUM),avg(RETN_STATE_SUC_UTIL),sum(SM_SUBMIT_NUM),sum(SM_SUBMIT_SUC_NUM),avg(SM_SUBMIT_SUC_UTIL),sum(TO_RETN_STATE_NUM),sum(TO_RETN_STATE_SUC_NUM),avg(SM_SEND_SUC_UTIL) 
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-date"/>

//视频流量指标组(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_JRWG_N31_03_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_JRWG_N31_03_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_JRWG_N31_03_D</if>   
</select>

<select id="resultMapping">
  --START_TIME=开始时间 --SP_NAME=SP企业名称 --SP_CODE=SP企业代码 --SP_SERV_CODE=SP服务代码 --SP_ACCESS_ADDR=SP接入地 --CDGW_SEND_SP_MO_NUM=接入网关向SP转发MO总数 --CDGW_SEND_SP_MO_SUC_NUM=接入网关向SP转发MO成功总数 --CDGW_SEND_SP_MO_FAIL_NUM=接入网关向SP转发MO失败总数 --CDGW_SEND_SP_MO_SUC_UTIL=接入网关向SP转发MO成功率 --SP_SEND_CDGW_MT_NUM=SP向接入网关发送MT总数 --CDGW_RET_SP_RESP_SUC_NUM=接入网关向SP返回成功应答总数 --CDGW_RET_SP_RESP_FAIL_NUM=接入网关向SP返回失败应答总数 --SP_COMM_MT_SUC_UTIL=SP提交MT成功率 --CDGW_TRANS_SP_STATE_NUM=接入网关向SP转发状态报告总数 --ISMG_TRANS_SP_SUCC_STATE_NUM=接入网关向SP转发成功状态报告总数 --ISMG_TRANS_SP_FAIL_STATE_NUM=接入网关向SP转发失败状态报告总数 --MT_STATE_RTN_RATIO=MT状态报告返回率% --MT_SUCC_RATIO=MT最终成功率%
</select>

select to_char(START_TIME,'yyyy-MM-dd hh24:mi')as "START_TIME",
SP_NAME as "SP_NAME",
SP_CODE as "SP_CODE",
SP_SERV_CODE as "SP_SERV_CODE",
SP_ACCESS_ADDR as "SP_ACCESS_ADDR",
sum(CDGW_SEND_SP_MO_NUM) as "CDGW_SEND_SP_MO_NUM",
sum(CDGW_SEND_SP_MO_SUC_NUM) as "CDGW_SEND_SP_MO_SUC_NUM",
sum(CDGW_SEND_SP_MO_FAIL_NUM) as "CDGW_SEND_SP_MO_FAIL_NUM",
avg(CDGW_SEND_SP_MO_SUC_UTIL) as "CDGW_SEND_SP_MO_SUC_UTIL",
sum(SP_SEND_CDGW_MT_NUM) as "SP_SEND_CDGW_MT_NUM",
sum(CDGW_RET_SP_RESP_SUC_NUM) as "CDGW_RET_SP_RESP_SUC_NUM",
sum(CDGW_RET_SP_RESP_FAIL_NUM) as "CDGW_RET_SP_RESP_FAIL_NUM",
avg(SP_COMM_MT_SUC_UTIL) as "SP_COMM_MT_SUC_UTIL",
sum(CDGW_TRANS_SP_STATE_NUM) as "CDGW_TRANS_SP_STATE_NUM",
sum(ISMG_TRANS_SP_SUCC_STATE_NUM) as "ISMG_TRANS_SP_SUCC_STATE_NUM",
sum(ISMG_TRANS_SP_FAIL_STATE_NUM) as "ISMG_TRANS_SP_FAIL_STATE_NUM",
avg(MT_STATE_RTN_RATIO) as "MT_STATE_RTN_RATIO",
avg(MT_SUCC_RATIO) as "MT_SUCC_RATIO"
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>
group by to_char(START_TIME,'yyyy-MM-dd hh24:mi'),SP_NAME,SP_CODE,SP_SERV_CODE,SP_ACCESS_ADDR 
union all select '合计' START_TIME,'--' SP_NAME,'--' SP_CODE,'--' SP_SERV_CODE,'--' SP_ACCESS_ADDR,sum(CDGW_SEND_SP_MO_NUM),sum(CDGW_SEND_SP_MO_SUC_NUM),sum(CDGW_SEND_SP_MO_FAIL_NUM),avg(CDGW_SEND_SP_MO_SUC_UTIL),sum(SP_SEND_CDGW_MT_NUM),sum(CDGW_RET_SP_RESP_SUC_NUM),sum(CDGW_RET_SP_RESP_FAIL_NUM),avg(SP_COMM_MT_SUC_UTIL),sum(CDGW_TRANS_SP_STATE_NUM),sum(ISMG_TRANS_SP_SUCC_STATE_NUM),sum(ISMG_TRANS_SP_FAIL_STATE_NUM),avg(MT_STATE_RTN_RATIO),avg(MT_SUCC_RATIO) 
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//网关间前转流量统计指标(N31)
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_MWWG_N31_05_5M </if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_MWWG_N31_05_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_MWWG_N31_05_D</if>   
</select>

<select id="resultMapping">
  --START_TIME=开始时间 --GW_CODE=网关名称 --MT_FWD_NUM=发送MT前转总数 --MT_FWD_SUC_NUM=发送MT前转成功数 --MT_FWD_FAIL_NUM=发送MT前转失败数 --MT_FWD_SUC_RATIO=发送MT前转成功率(%) --MO_FWD_NUM=发送MO前转总数 --MO_FWD_SUC_NUM=发送MO前转成功数 --MO_FWD_FAIL_NUM=发送MO前转失败数 --MO_FWD_SUC_RATIO=发送MO前转成功率(%) --RCV_MT_FWD_NUM=接收MT前转总数 --RCV_MT_FWD_SUC_NUM=接收MT前转成功数 --RCV_MT_FWD_FAIL_NUM=接收MT前转失败数 --RCV_MT_FWD_SUC_RATIO=接收MT前转成功率(%) --RCV_MO_FWD_NUM=接收MO前转总数 --RCV_MO_FWD_SUC_NUM=接收MO前转成功数 --RCV_MO_FWD_FAIL_NUM=接收MO前转失败数 --RCV_MO_FWD_SUC_RATIO=接收MO前转成功率(%)
</select>

select to_char(START_TIME,'yyyy-MM-dd') as "START_TIME",
GW_CODE as "GW_CODE",
MT_FWD_NUM as "MT_FWD_NUM",
MT_FWD_SUC_NUM as "MT_FWD_SUC_NUM",
MT_FWD_FAIL_NUM as "MT_FWD_FAIL_NUM",
MT_FWD_SUC_RATIO as "MT_FWD_SUC_RATIO",
MO_FWD_NUM as "MO_FWD_NUM",
MO_FWD_SUC_NUM as "MO_FWD_SUC_NUM",
MO_FWD_FAIL_NUM as "MO_FWD_FAIL_NUM",
MO_FWD_SUC_RATIO as "MO_FWD_SUC_RATIO",
RCV_MT_FWD_NUM as "RCV_MT_FWD_NUM",
RCV_MT_FWD_SUC_NUM as "RCV_MT_FWD_SUC_NUM",
RCV_MT_FWD_FAIL_NUM as "RCV_MT_FWD_FAIL_NUM",
RCV_MT_FWD_SUC_RATIO as "RCV_MT_FWD_SUC_RATIO",
RCV_MO_FWD_NUM as "RCV_MO_FWD_NUM",
RCV_MO_FWD_SUC_NUM as "RCV_MO_FWD_SUC_NUM",
RCV_MO_FWD_FAIL_NUM as "RCV_MO_FWD_FAIL_NUM",
RCV_MO_FWD_SUC_RATIO as "RCV_MO_FWD_SUC_RATIO"
from <included id="tableChooseSE"/> where  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
union all select '合计' START_TIME,'--'GW_CODE,sum(MT_FWD_NUM) MT_FWD_NUM,sum(MT_FWD_SUC_NUM) MT_FWD_SUC_NUM,sum(MT_FWD_FAIL_NUM) MT_FWD_FAIL_NUM,avg(MT_FWD_SUC_RATIO) MT_FWD_SUC_RATIO,sum(MO_FWD_NUM) MO_FWD_NUM,sum(MO_FWD_SUC_NUM) MO_FWD_SUC_NUM,sum(MO_FWD_FAIL_NUM) MO_FWD_FAIL_NUM,avg(MO_FWD_SUC_RATIO) MO_FWD_SUC_RATIO,sum(RCV_MT_FWD_NUM) RCV_MT_FWD_NUM,sum(RCV_MT_FWD_SUC_NUM) RCV_MT_FWD_SUC_NUM,sum(RCV_MT_FWD_FAIL_NUM)RCV_MT_FWD_FAIL_NUM,avg(RCV_MT_FWD_SUC_RATIO) RCV_MT_FWD_SUC_RATIO,sum(RCV_MO_FWD_NUM) RCV_MO_FWD_NUM,sum(RCV_MO_FWD_SUC_NUM) RCV_MO_FWD_SUC_NUM,sum(RCV_MO_FWD_FAIL_NUM) RCV_MO_FWD_FAIL_NUM,avg(RCV_MO_FWD_SUC_RATIO) RCV_MO_FWD_SUC_RATIO 
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//彩铃门户业务报表
<select id="resultMapping">
  --START_TIME=开始时间 --MusicRingSetNum=铃音设置数 -- MusicRingDownload=铃音下载量 -- MusicRingUser=注册用户总数 --MusicRingSpaceRate=彩铃表空间利用率 -- DISKUserRate=DISK利用率(到网管) --DBDISKUseRate=数据库磁盘利用率(到网管)
</select>

select 
to_char(START_TIME,'yyyy-MM-dd') as "START_TIME",
MusicRingSetNum as "MusicRingSetNum",
MusicRingDownload as "MusicRingDownload",
MusicRingUser as "MusicRingUser",
MusicRingSpaceRate as "MusicRingSpaceRate",
DISKUserRate as "DISKUserRate",
DBDISKUseRate as "DBDISKUseRate"    
from ipmsdw.O_RE_ST_CLMH_D    where 1=1

<if test=" '@isContinue'=='t' ">
      and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

union all 
select '合计' START_TIME, sum(MusicRingSetNum) MusicRingSetNum,sum(MusicRingDownload) MusicRingDownload, sum(MusicRingUser) MusicRingUser,avg(MusicRingSpaceRate) MusicRingSpaceRate, avg(DISKUserRate) DISKUserRate,avg(DBDISKUseRate) DBDISKUseRate   from ipmsdw.O_RE_ST_CLMH_D  where 1=1

<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>
order by START_TIME asc


//MMS业务KPI统计指标组
<select id="resultMapping">
 --START_TIME=开始时间 --SERVICE_IP=被管设备IP地址 -- MMS_SEND_NUM=MMS发送总条数 -- MMS_TOP_NUM=MMS忙时业务量 --MMS_REGISTER_USER_NUM=MMS注册用户总数 -- USE_MMS_USER_NUM=本时段使用用户数 --MMS_ALBUM_NUM=转梦网相册条数 --MMS_ALBUM_SUCC_NUM=转梦网相册成功条数 --MMS_ALBUM_SUCC_RATIO=转梦网相册成功率 --MMS_SUBMIT_NUM_2=MMS发送总条数 --MMS_DELV_NUM_2=MMS接收总条数 --MMS_NETWOER_SUBMIT_FAIL_NUM=网络失败提交数 --MMS_USER_SUBMIT_FAIL_NUM=用户失败提交数 --MMS_NETWORK_DELV_FAIL_NUM=网络失败下发数 --MMS_USER_DELV_FAIL_NUM=用户失败下发数 --MMS_TOTAL_NETWORK_SUCC_RATIO=彩信网络全程接通率 --MMS_TOTAL_USER_SUCC_RATIO=彩信用户全程接通率 --MMS_TOTAL_SUCC_RAIO=彩信全程接通率
</select>
<select id="resultMapping">
  --START_TIME=开始时间 --SERVICE_IP=被管设备IP地址 -- MMS_SEND_NUM=MMS发送总条数 -- MMS_TOP_NUM=MMS忙时业务量 --MMS_REGISTER_USER_NUM=MMS注册用户总数 -- USE_MMS_USER_NUM=本时段使用用户数 --MMS_ALBUM_NUM=转梦网相册条数 --MMS_ALBUM_SUCC_NUM=转梦网相册成功条数 --MMS_ALBUM_SUCC_RATIO=转梦网相册成功率 --MMS_SUBMIT_NUM_2=MMS发送总条数 --MMS_DELV_NUM_2=MMS接收总条数 --MMS_NETWOER_SUBMIT_FAIL_NUM=网络失败提交数 --MMS_USER_SUBMIT_FAIL_NUM=用户失败提交数 --MMS_NETWORK_DELV_FAIL_NUM=网络失败下发数 --MMS_USER_DELV_FAIL_NUM=用户失败下发数 --MMS_TOTAL_NETWORK_SUCC_RATIO=彩信网络全程接通率 --MMS_TOTAL_USER_SUCC_RATIO=彩信用户全程接通率 --MMS_TOTAL_SUCC_RAIO=彩信全程接通率
</select>

select 
 to_char(START_TIME,'yyyy-MM-dd')  as "START_TIME",
 SERVICE_IP as "SERVICE_IP", 
 MMS_SEND_NUM as "MMS_SEND_NUM",
 MMS_TOP_NUM as "MMS_TOP_NUM",
 MMS_REGISTER_USER_NUM as "MMS_REGISTER_USER_NUM",
 USE_MMS_USER_NUM as "USE_MMS_USER_NUM",
 MMS_ALBUM_NUM as "MMS_ALBUM_NUM",
 MMS_ALBUM_SUCC_NUM as "MMS_ALBUM_SUCC_NUM",
 round(MMS_ALBUM_SUCC_RATIO,2) as "MMS_ALBUM_SUCC_RATIO",
 MMS_SUBMIT_NUM_2 as "MMS_SUBMIT_NUM_2",
 MMS_DELV_NUM_2 as "MMS_DELV_NUM_2",
 MMS_NETWOER_SUBMIT_FAIL_NUM as "MMS_NETWOER_SUBMIT_FAIL_NUM",
 MMS_USER_SUBMIT_FAIL_NUM as "MMS_USER_SUBMIT_FAIL_NUM",
 MMS_NETWORK_DELV_FAIL_NUM as "MMS_NETWORK_DELV_FAIL_NUM",
 MMS_USER_DELV_FAIL_NUM as "MMS_USER_DELV_FAIL_NUM",
 round(MMS_TOTAL_NETWORK_SUCC_RATIO,2) as "MMS_TOTAL_NETWORK_SUCC_RATIO",
 round(MMS_TOTAL_USER_SUCC_RATIO,2) as "MMS_TOTAL_USER_SUCC_RATIO",
 MMS_TOTAL_SUCC_RAIO as "MMS_TOTAL_SUCC_RAIO "
from ipmsdw.O_RE_ST_MMS_KPI_D  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>
and SERVICE_IP in ('TD_SH_MMS_HW','@ip1')  
union all 
select '合计' START_TIME1 , 
'---' SERVICE_IP,
sum(MMS_SEND_NUM) MMS_SEND_NUM,
sum(MMS_TOP_NUM) MMS_TOP_NUM,
sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,
sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,
sum(MMS_ALBUM_NUM) MMS_ALBUM_NUM,
sum(MMS_ALBUM_SUCC_NUM) MMS_ALBUM_SUCC_NUM,
round(avg(MMS_ALBUM_SUCC_RATIO),2)  MMS_ALBUM_SUCC_RATIO2,
sum(MMS_SUBMIT_NUM_2) MMS_SUBMIT_NUM_2,
sum(MMS_DELV_NUM_2) MMS_DELV_NUM_2,
sum(MMS_NETWOER_SUBMIT_FAIL_NUM) MMS_NETWOER_SUBMIT_FAIL_NUM,
sum(MMS_USER_SUBMIT_FAIL_NUM) MMS_USER_SUBMIT_FAIL_NUM,
sum(MMS_NETWORK_DELV_FAIL_NUM) MMS_NETWORK_DELV_FAIL_NUM,
sum(MMS_USER_DELV_FAIL_NUM) MMS_USER_DELV_FAIL_NUM,
round((case when sum(MMS_SUBMIT_NUM_2)!=0 then 100*sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_NETWOER_SUBMIT_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end),2)  MMS_TOTAL_NETWORK_SUCC_RATIO2,
round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM-MMS_ALBUM_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end)*100,2)   MMS_TOTAL_USER_SUCC_RATIO2,
round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2)  else 0 end)*100,2)  MMS_TOTAL_SUCC_RAIO    
from ipmsdw.O_RE_ST_MMS_KPI_D  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//MMS业务量统计指标组
<select id="resultMapping">
     --START_TIME=开始时间 --SERVICE_IP=被管设备IP地址 -- MMS_SEND_NUM=MMS发送总条数 -- MMS_TOP_NUM=MMS忙时业务量 --MMS_REGISTER_USER_NUM=MMS注册用户总数 -- USE_MMS_USER_NUM=本时段使用用户数 --busy_time_am=早忙时时间 --busy_time_am_mms_num=早忙时业务量 --busy_time_pm=晚忙时时间 --busy_time_pm_mms_num=晚忙时业务量 --BUSY_TIME_MMS_NUM=MMS忙时并发请求数 --TMNL_SUBMIT_MMS_NUM=终端发送MMS条数 --TMNL_DELV_MMS_NUM=终端接收MMS条数 --APPLY_SUBMIT_MMS_NUM=应用发送MMS条数 --EML_SUBMIT_MMS_NUM=Email发送MMS条数 --FWD_MMS_NUM=前转到其它彩信中心业务量 --REC_FWD_MMS_NUM=接收其它彩信中心前转来业务量 --TMNL_TMNL_NUM=终端到终端条数 --TMNL_APP_NUM=终端到应用条数 --TMNL_MAIL_NUM=终端到Mail条数 --NEWADD_MMS_REGISTER_USER_NUM=新增MMS注册用户数 --EMAIL_USE_USER_NUM=邮件业务使用用户数 --SP_USE_USER_NUM=SP业务使用用户数 --FWD_DP_NUM=转梦网相册条数
</select>

select  
  to_char(START_TIME,'yyyy-MM-dd') as "START_TIME",  
  SERVICE_IP,
  MMS_SEND_NUM,
  MMS_TOP_NUM,
  MMS_REGISTER_USER_NUM, 
  USE_MMS_USER_NUM, 
  busy_time_am as "busy_time_am",
  busy_time_am_mms_num as "busy_time_am_mms_num",
  busy_time_pm as "busy_time_pm",
  busy_time_pm_mms_num as "busy_time_pm_mms_num",
  BUSY_TIME_MMS_NUM,  
  TMNL_SUBMIT_MMS_NUM,
  TMNL_DELV_MMS_NUM,
  APPLY_SUBMIT_MMS_NUM,
  EML_SUBMIT_MMS_NUM,
  FWD_MMS_NUM,
  REC_FWD_MMS_NUM,
  TMNL_TMNL_NUM,
  TMNL_APP_NUM,
  TMNL_MAIL_NUM, 
  NEWADD_MMS_REGISTER_USER_NUM,
  EMAIL_USE_USER_NUM,
  SP_USE_USER_NUM,
  FWD_DP_NUM
from ipmsdw.O_RE_ST_MMS_BUSINESS_D where 1=1

<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
 <if test=" '@isContinue'=='f' ">
     and START_TIME in (#discteteTime#)
 </if>         
<jdbcType name="discteteTime" type="array-date"/>

union all select '合计' START_TIME1 ,  
'---'  SERVICE_IP,
sum(MMS_SEND_NUM) MMS_SEND_NUM,
sum(MMS_TOP_NUM) MMS_TOP_NUM,
sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,
sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,
null busy_time_am,
sum(busy_time_am_mms_num) busy_time_am_mms_num,
null busy_time_pm,
sum(busy_time_pm_mms_num) busy_time_pm_mms_num,
sum(BUSY_TIME_MMS_NUM) BUSY_TIME_MMS_NUM,
sum(TMNL_SUBMIT_MMS_NUM) TMNL_SUBMIT_MMS_NUM,
sum(TMNL_DELV_MMS_NUM) TMNL_DELV_MMS_NUM,
sum(APPLY_SUBMIT_MMS_NUM) APPLY_SUBMIT_MMS_NUM,
sum(EML_SUBMIT_MMS_NUM) EML_SUBMIT_MMS_NUM,
sum(FWD_MMS_NUM) FWD_MMS_NUM,
sum(REC_FWD_MMS_NUM) REC_FWD_MMS_NUM,
sum(TMNL_TMNL_NUM) TMNL_TMNL_NUM,
sum(TMNL_APP_NUM) TMNL_APP_NUM,
sum(TMNL_MAIL_NUM) TMNL_MAIL_NUM,
sum(NEWADD_MMS_REGISTER_USER_NUM) NEWADD_MMS_REGISTER_USER_NUM,
sum(EMAIL_USE_USER_NUM) EMAIL_USE_USER_NUM,
sum(SP_USE_USER_NUM) SP_USE_USER_NUM,
sum(FWD_DP_NUM) FWD_DP_NUM 

from ipmsdw.O_RE_ST_MMS_BUSINESS_D  where 1=1

<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>          
<jdbcType name="discteteTime" type="array-date"/>



//DNS业务量统计报表
<select id="tableChooseSE">    
      <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_DNS_BUSINESS_5M</if>
      <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_DNS_BUSINESS_H</if>
      <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_DNS_BUSINESS_D</if>   
</select>
<select id="resultMapping">
    --DNSPA01=时间 --DNSPA03=DNS服务器IP --DNSPA04=用户解析成功数 --DNSPA05=系统解析成功数 --DNSPA06=失败数 --DNSPA07=递归请求查询数 --DNSPA08=非递归查询数 --DNSPA09=总请求数 --DNSPA10=查询频率 --DNSPA11=系统解析成功率 --DNSPA12=用户解析成功率 --DNSPA13=平均时延
</select>
select  
  to_char(DNSPA01,'yyyy-MM-dd') DNSPA01,
  DNSPA03, 
  DNSPA04, 
  DNSPA05,
  DNSPA06, 
  DNSPA07,
  DNSPA08,
  DNSPA09,
  DNSPA10, 
  CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA05/DNSPA09,2) END DNSPA11,   CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA04/DNSPA09,2) END DNSPA12,  ROUND(DNSPA13,2) DNSPA13  
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and DNSPA01 between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and trunc(DNSPA01,'mi') in (#discteteTime#)
</if>          
and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3') 
union all 
select '合计' DNSPA01, '---' DNSPA03,sum(DNSPA04) DNSPA04,sum(DNSPA05) DNSPA05,sum(DNSPA06) DNSPA06,sum(DNSPA07) DNSPA07,sum(DNSPA08) DNSPA08,sum(DNSPA09) DNSPA09,sum(DNSPA10) DNSPA10,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA05)/SUM(DNSPA09),2) END DNSPA11,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA04)/SUM(DNSPA09),2) END DNSPA12,avg(DNSPA13) DNSPA13 
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and DNSPA01 between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and trunc(DNSPA01,'mi')  in (#discteteTime#)
</if>          
and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3')  
<jdbcType name="discteteTime" type="array-date"/>
order by DNSPA01 asc

//DNS重点域名解析统计报表
<select id="tableChooseSE">    
    <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_DNS_FOCUS_DNAME_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_DNS_FOCUS_DN_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_DNS_FOCUS_DN_D</if>   
</select>
<select id="resultMapping">
    --DNSPB01=时间 --DNSPB03=DNS服务器IP --DNSPB04=解析域名 --DNSPB05=域名解析总数 --DNSPB06=域名解析成功数 --DNSPB07=失败数 --DNSPB08=查询频率(次/秒) --DNSPB09=解析成功率(%) --DNSPB10=平均时延 --DNSPA11=系统解析成功率 --DNSPA12=用户解析成功率 --DNSPA13=平均时延
</select>
select 
  to_char(DNSPB01,'yyyy-MM-dd HH24:mi:ss') AS DNSPB01,DNSPB03,DNSPB04, DNSPB05, DNSPB06,DNSPB07,DNSPB08,DNSPB09,DNSPB10  
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and  trunc( DNSPB01,'mi') between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and trunc( DNSPB01,'mi')  in (#discteteTime#)
</if>          
union all 
select '合计' AS DNSPB01,'---'DNSPB03,'---'DNSPB04,sum(DNSPB05) DNSPB05,sum(DNSPB06) DNSPB06,sum(DNSPB07) DNSPB07,avg(DNSPB08) DNSPB08,avg(DNSPB09)DNSPB09,avg(DNSPB10) DNSPB10 
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and  trunc( DNSPB01,'mi') between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
     and trunc( DNSPB01,'mi')  in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-date"/>

//MISC鉴权批价性能统计报表
<select id="tableChooseSE">      
       <if test=" '@timeType'=='hour' ">ipmsdw.O_RE_ST_MISC_H</if>
       <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_MISC_D</if>   
</select>
<select id="resultMapping">
       --START_TIME=开始时间 --MISCAUTHPRICERECIEVED=MO请求数 -- MISCAUTHPRICESUCCESS=MO成功数 -- MISCAUTHPRICEFAIL=MO失败数 --MISCAUTHPRICERATE=MO成功率 -- MISCTOTALINMMSAUTHREQ=收到的彩信鉴权请求总数 --MISCTOTALINMMSAUTHREQSUC=收到的彩信鉴权网络成功数 --MISCTOTALINMMSAUTHREQBUSSSUC=收到的彩信鉴权业务成功数 --MISCTOTALINMMSAUTHREQRATE=AO彩信鉴权网络成功率 --MISCTOTALINMMSAUTHREQBUSSRATE=AO彩信鉴权业务成功率
</select>

select  to_char(START_TIME,'yyyy-MM-dd HH:mi:ss') START_TIME, 
 MISCAUTHPRICERECIEVED, 
 MISCAUTHPRICESUCCESS, 
 MISCAUTHPRICEFAIL, 
 case when MISCAUTHPRICERECIEVED=0 then 0 else ROUND(100*MISCAUTHPRICESUCCESS / MISCAUTHPRICERECIEVED,3) end MISCAUTHPRICERATE , 
 MISCTOTALINMMSAUTHREQ,  
 MISCTOTALINMMSAUTHREQSUC, 
 MISCTOTALINMMSAUTHREQBUSSSUC,  
 case when MISCTOTALINMMSAUTHREQ=0 then 0 else ROUND(100*MISCTOTALINMMSAUTHREQSUC / MISCTOTALINMMSAUTHREQ,2) end "MISCTOTALINMMSAUTHREQRATE",  
 case when MISCTOTALINMMSAUTHREQ=0 then 0 else ROUND(100*MISCTOTALINMMSAUTHREQBUSSSUC / MISCTOTALINMMSAUTHREQ,2) end "MISCTOTALINMMSAUTHREQBUSSRATE"  
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>
union all 
select '合计' START_TIME, 
SUM(MISCAUTHPRICERECIEVED) MISCAUTHPRICERECIEVED, 
SUM(MISCAUTHPRICESUCCESS) MISCAUTHPRICESUCCESS, 
SUM(MISCAUTHPRICEFAIL) MISCAUTHPRICEFAIL, 
case when SUM(MISCAUTHPRICERECIEVED)=0 then 0 else ROUND(100*sum(MISCAUTHPRICESUCCESS) / sum(MISCAUTHPRICERECIEVED),3) end MISCAUTHPRICERATE , 
SUM(MISCTOTALINMMSAUTHREQ) MISCTOTALINMMSAUTHREQ, 
SUM(MISCTOTALINMMSAUTHREQSUC) MISCTOTALINMMSAUTHREQSUC,
SUM(MISCTOTALINMMSAUTHREQBUSSSUC) MISCTOTALINMMSAUTHREQBUSSSUC, 
case when SUM(MISCTOTALINMMSAUTHREQ)=0 then 0 else ROUND(100*SUM(MISCTOTALINMMSAUTHREQSUC) / SUM(MISCTOTALINMMSAUTHREQ),2) end MISCTOTALINMMSAUTHREQRATE,  
case when SUM(MISCTOTALINMMSAUTHREQ)=0 then 0 else ROUND(100*SUM(MISCTOTALINMMSAUTHREQBUSSSUC) / SUM(MISCTOTALINMMSAUTHREQ),2) end MISCTOTALINMMSAUTHREQBUSSRATE  
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and            to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>

//移动手机点击率,旧
select 
timeid as "统计时间",                
user_group as "用户群",
case when SUPPLIER_NAME IN ('移动直连', '铁通', '移动') then '移动' else SUPPLIER_NAME end as "运营商",
sum(request_cnt) as "各运营商点击总次数"
from DM_DNSLOG_UG_D where 1=1 
<if test=" '@isContinue'=='t' ">
    and TIMEID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIMEID in (#discteteTime#)
</if>           
AND USER_GROUP in( 'GPRS（2/3G）','LTE（4G）')
AND SUPPLIER_NAME IN ('电信', '联通', '其他','移动直连', '铁通', '移动')
group by timeid, user_group, case when SUPPLIER_NAME IN ('移动直连', '铁通', '移动') then '移动' else SUPPLIER_NAME end


//移动手机点击率,新
select 
t1.timeid/10000 "时间",
t1.USER_GROUP "用户群",
t2.total "总数",
t1.SUPPLIER_NAMES "运营商",
t1.req "解析次数",
round(t1.req*1.0 / t2.total*100,2)  "运营商点击率(%)" 
from (select timeid,user_group,SUPPLIER_NAME AS SUPPLIER_NAMES,
  sum(request_cnt) as req 
  from ipmsdm.DM_DNSLOG_UG_D  where 1=1 
<if test=" '@isContinue'=='t' ">
	and timeid between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in (#discteteTime#)
</if> 
AND USER_GROUP = 'GPRS（2/3G）' AND SUPPLIER_NAME IN ('电信','联通','其它')  group by timeid,user_group,SUPPLIER_NAME  
UNION ALL 
SELECT timeid,user_group,'移动' SUPPLIER_NAMES,
  SUM(request_cnt) AS req 
FROM ipmsdm.DM_DNSLOG_UG_D where 1=1
<if test=" '@isContinue'=='t' ">
    and timeid between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in (#discteteTime#)
</if> 
AND USER_GROUP = 'GPRS（2/3G）' AND SUPPLIER_NAME IN ('移动直连','铁通','移动') GROUP BY timeid,user_group ) t1, 
(select timeid,user_group,sum(request_cnt) as total 
from ipmsdm.DM_DNSLOG_UG_D  
where timeid in(201607250000) AND USER_GROUP = 'GPRS（2/3G）'  group by timeid,user_group) t2 
where t1.timeid=t2.timeid and t1.user_group=t2.user_group


//DNS域名解析请求排行统计指标
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_DNS_DNAME_ANAL_RANK_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_DNS_DN_ANAL_RANK_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_DNS_DN_ANAL_RANK_D</if>   
</select>

<select id="resultMapping">
  --DNSPD01=开始时间 --DNSPD02=结束时间 --DNSPD03=DNS服务器IP --DNSPD04=域名 --DNSPD05=系统解析成功数 --DNSPD06=失败数 --DNSPD07=递归请求查询数 --DNSPD08=非递归查询数 --DNSPD09=总请求数 --DNSPA10=查询频率 --DNSPD11=系统解析成功率 --DNSPD12=用户解析成功率 --DNSPD13=平均时延
</select>

SELECT to_char(DNSPD01,'yyyy-MM-dd HH24:mi:ss') DNSPD01,
to_char(DNSPD02,'yyyy-MM-dd HH24:mi:ss') DNSPD02,
DNSPD03,
DNSPD04,
SUM(DNSPD05) DNSPD05, 
SUM(DNSPD06) DNSPD06,  
to_char(SUM(DNSPD05)/SUM(DNSPD06)*100,'999999.99') DNSPD07, 
to_char(MAX(DNSPD08),'999999.99') AS DNSPD08
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and DNSPD01 between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in (#discteteTime#)
</if> 
GROUP BY to_char(DNSPD01,'yyyy-MM-dd HH24:mi:ss'),to_char(DNSPD02,'yyyy-MM-dd HH24:mi:ss'),DNSPD03,DNSPD04 ORDER BY DNSPD01,DNSPD05 DESC


//DNS全网top排名
<select id="resultMapping">
  --DNSPD01=日期 --DNSPD02=运营商 --DNSPD03=二级域名 --DNSPD04=ip地址 --DNSPD05=占比(全网)(%) --DNSPD06=解析总次数
</select>

select 
a.TIMEID/10000 as "日期",
c.SUPPLIER_NAME1 "运营商",
a.DOMAINNAME as "二级域名",
c.DESTINATIONIP as "ip地址",
a.SUM_PART as "占比(全网)(%)",
round(a.sum_part*100.00/b.SUM_ALL,2) as "解析总次数"
from  
(select TIMEID,DOMAINNAME,sum(REQUEST_CNT) SUM_PART from ipmsdm.DM_DNSLOG_DOMAIN_TOPN_D group by TIMEID,DOMAINNAME) a,  
(select TIMEID,sum(REQUEST_CNT) SUM_ALL from ipmsdm.DM_DNSLOG_DOMAIN_TOPN_D group by TIMEID) b ,ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D c 
where a.TIMEID=b.TIMEID  and a.timeid=c.timeid 

<if test=" '@isContinue'=='t' ">
           and a.timeid between to_number(#startTime#) and to_number(#endTime#)
       </if>
       <if test=" '@isContinue'=='f' ">
           and a.timeid = (#discteteTime#)
       </if>  

and a.DOMAINNAME=c.DOMAINNAME

//分运营商解析top排名
 select * from (select a.TIMEID/10000 as "日期",
RANK() OVER (PARTITION BY a.SUPPLIER_NAME ORDER BY SUM_PART DESC) rnmm,
a.SUPPLIER_NAME "运营商",
a.DOMAINNAME as "二级域名",
c.DESTINATIONIP as "IP地址",
a.SUM_PART as "占比(运营商)(%)",
round(a.sum_part*100.00/b.SUM_ALL,2)  as "解析总次数"
 from  (select  TIMEID,DOMAINNAME,(case SUPPLIER_NAME when '电信' then '电信' when '铁通' then '铁通' when '移动' then '移动' when '联通' then '联通' when '未知' then '未知' else '其他' end) SUPPLIER_NAME, sum(REQUEST_CNT) as SUM_PART   
 from  ipmsdm.DM_DNSLOG_SN_TOPN_D 
 group by TIMEID,DOMAINNAME,SUPPLIER_NAME) a,   (select TIMEID,(case SUPPLIER_NAME when '电信' then '电信' when '铁通' then '铁通' when '移动' then '移动' when '联通' then '联通' when '未知' then '未知' else '其他' end)  SUPPLIER_NAME , sum(REQUEST_CNT) as SUM_ALL     
 from ipmsdm.DM_DNSLOG_SN_TOPN_D group by TIMEID,SUPPLIER_NAME) b, (select * from ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D where timeid=201608110000) c  where a.TIMEID=b.TIMEId  and a.timeid=c.timeid  and a.SUPPLIER_NAME=b.SUPPLIER_NAME and a.domainname=c.domainname 
 
<if test=" '@isContinue'=='t' ">
           and a.timeid between to_number(#startTime#) and to_number(#endTime#)
       </if>
       <if test=" '@isContinue'=='f' ">
           and a.timeid = (#discteteTime#)
       </if>  


) t where rnmm<=1000

//解析次数统计样表
select 
TIMEID/10000 as "时间",
DG as "域名组",
DN1 as "一级域名",
DN2 as "二级域名",
IP as "目标IP地址",
REQ as "DNS解析请求数",
TOTAL as "该域名请求数占比"
from (select TIMEID,DG,DN1,DN2,IP,REQ,TOTAL from ipmsdm.DM_DNSLOG_DG2_D 
where 1=1 

<if test=" '@isContinue'=='t' ">
    and timeid between to_number(#startTime#) and to_number(#endTime#) )
</if>
<if test=" '@isContinue'=='f' ">
    and timeid = (#discteteTime#) )
</if>         

//TD_MMS业务
<select id="tableChooseSE">    
     <if test=" '@timeType'=='hour' ">ipmsdw.V_O_MMS_KPI_RARIO </if>
     <if test=" '@timeType'=='day' ">ipmsdw.O_RE_ST_MMS_KPI_D</if>   
 </select>

<select id="resultMapping">
  --START_TIME=时间 --SUBMIT_NUM=MMS发送总条数 --NETWOER_SUBMIT_FAIL=网络失败提交数 --USER_SUBMIT_FAIL=用户失败提交数 --NETWORK_DELV_FAIL=网络失败下发数 --USER_DELV_FAIL=用户失败下发数 --RATIO=网络失败下发率
</select>

select 
to_char(START_TIME,'yyyy-MM-dd') START_TIME, SUBMIT_NUM,
NETWOER_SUBMIT_FAIL,
USER_SUBMIT_FAIL,
NETWORK_DELV_FAIL,
USER_DELV_FAIL,
ratio*100 RATIO
 
from <included id="tableChooseSE"/>  where 1=1

<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if> 

union all select '合计' START_TIME, 
SUM(SUBMIT_NUM)SUBMIT_NUM,
SUM(NETWOER_SUBMIT_FAIL)NETWOER_SUBMIT_FAIL,
SUM(USER_SUBMIT_FAIL)USER_SUBMIT_FAIL,
SUM(NETWORK_DELV_FAIL)NETWORK_DELV_FAIL,
SUM(USER_DELV_FAIL)USER_DELV_FAIL,  
CASE WHEN SUM(SUBMIT_NUM)=0 THEN 0 ELSE  ROUND(SUM(SUBMIT_NUM-NETWOER_SUBMIT_FAIL-USER_SUBMIT_FAIL-NETWORK_DELV_FAIL-USER_DELV_FAIL)/SUM(SUBMIT_NUM) * 100, 2) END ratio 
 
from <included id="tableChooseSE"/>  where 1=1

<if test=" '@isContinue'=='t' ">
    and START_TIME between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and START_TIME in (#discteteTime#)
</if>        
<jdbcType name="discteteTime" type="array-date"/>


//LSTP3负荷统计报表
<select id="tableChooseSE">    
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_LSTP3_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_LSTP3_H</if>     
</select>

<select id="resultMapping">
    --STAT_TIME=时间 --STP_NAME=STP名称 --LINK_NAME=like名称 --MTPLKSLC=slc --MTPOCTSENT=发送负荷SIO/SIF --NBRMTPMSUSENT=发送负荷MSU数 --MEAN_MTPSENT=发送负荷的平均负荷 --MTPOCTRECEIVED=接收负荷SIO/SIF --NBRMTPMSURECEIVED=接收负荷MSU数 --MEAN_MTPRECEIVED=接收负荷的平均负荷 --TOTAL_MTP=总负荷 --MTPCLASS=信令种类
</select>

select 
to_char(STAT_TIME,'yyyy-MM-dd HH24:mi:ss') STAT_TIME,
STP_NAME,
LINK_NAME,
MTPLKSLC,
MTPOCTSENT,
NBRMTPMSUSENT,
MEAN_MTPSENT,
MTPOCTRECEIVED,
NBRMTPMSURECEIVED,
MEAN_MTPRECEIVED,
TOTAL_MTP,
MTPCLASS
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and  trunc( STAT_TIME,'mi') between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and trunc( STAT_TIME,'mi')  in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>

//CMNET设备资源占用情况
<select id="resultMapping">
    --city=地市 --sys_name=系统名称 -- ip_addr=ip地址 -- if_nums=总数 --used_if_nums=使用总数 --rate=成功率
</select>

select 
decode(city, null, '合计', city) as "地市",
sys_name as "系统名称",
ip_addr as "ip地址",
if_nums as "总数",
used_if_nums as "使用总数",
rate as "成功率"
from ( 
select a.city ,
  a.sys_name,
  a.ip_addr,
  count(*) if_nums,  
  sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end) used_if_nums, 
  case when count(*)=0 then 0 else ROUND(sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end)/count(*)*100,2) end rate 
from IPMSDW.O_RM_DEVICE a,
IPMSDW.O_RM_INTERFACE b  
where a.device_id = b.device_id  and  b.device_id IN ('8a5d92aa53e5057b0153e941b2870005')   and not regexp_like(b.if_name, '[(\.)|(Vl)]')  and city is not null  group by rollup((a.city,b.device_id,a.sys_name,a.ip_addr))  order by city nulls last, a.sys_name )


//MR覆盖率汇总表
<select id="resultMapping">
     --STAT_TIME=时间 --SD_NAME =区域 --MR_ROOM_COVER_RT =室内覆盖MR覆盖率 --MR_CELL_COVER_RT =小区覆盖MR覆盖率 --地铁小区MR覆盖率 --MR_MERGE_COVER_RT =MR_MERGE_COVER_RT --VALUE_AREA_COVER_RT =价值区域MR覆盖率
</select>

//城域网专线数量统计周报-OLT专线
<select id="resultMapping">
    --TIME_STAMP=日期 --switch_name=设备名 --olt_name=OLT名称 --line_num=专线数
</select>

SELECT to_char(TIME_STAMP, 'iyyy-IW') || '周' AS TIME_STAMP,
                       switch_name  as "switch_name",
                       olt_name as "olt_name",
                       line_num  as "line_num"                
FROM (select time_stamp,
            e.switch_name,
            e.olt_name,
            e.line_num
from ipmsdw.V_O_OLT_LINE e
order by switch_name, olt_name)
WHERE 1=1                 
<if test=" '@isContinue'=='t' ">
    and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
</if>

//城域网专线数量统计周报-楼宇通、大颗粒专线
<select id="resultMapping">
    --TIME_STAMP=日期 --sr_name=SR设备名 --SWITCH_NUM=设备名称总数 --PTN=PIN大颗粒 --MSTP=MSTP大颗粒
</select>
SELECT to_char(TIME_STAMP, 'iyyy- IW') || '周' AS TIME_STAMP,
                       replace(SR_NAME,'.sh.cnmobile.net','') as "sr_name",
                       rtrim(replace(SWITCH_NUM, chr(10), ';'),';') AS "SWITCH_NUM",
                       rtrim(replace(PTN, chr(10), ';'),';') "PTN",
                       rtrim(replace(MSTP, chr(10), ';'),';') "MSTP"
FROM (select TIME_STAMP, SR_NAME, SWITCH_NUM, PTN, MSTP
      from ipmsdw.V_O_SR_LAG_PTN_MSTP
      WHERE 1=1 
      <if test=" '@isContinue'=='t' ">
          and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
      </if>
      <if test=" '@isContinue'=='f' ">
          and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
      </if>
      order by TIME_STAMP,
              SR_NAME,
              SWITCH_NUM,
              decode(substr(PTN, 1, 6),
                                         'LAG-1:',
                                         1,
                                         'LAG-2:',
                                         2,
                                         'LAG-3:',
                                         3,
                                         'LAG-4:',
                                         4,
                                         'LAG-5:',
                                         5,
                                         'LAG-6:',
                                         6,
                                         'LAG-7:',
                                         7,
                                         'LAG-8:',
                                         8,
                                         'LAG-9:',
                                         9,
                                         10))

//93设备
<select id="resultMapping">
    --TIME_STAMP=日期 --switch_name=转换设备名 --SR_NAME=SR设备名 --line_num=专线数 --a=成功率 --NUMS=总数量
</select>

select 
      to_char(TIME_STAMP, 'iyyy- IW') || '周' AS TIME_STAMP,
      replace(t1.sr_name,'.sh.cnmobile.net','')  sr_name,
      switch_name "switch_name",
      line_num "line_num",
      case
         when line_num >= 500 then
          '1'
         else
          '0'
      end as "a",
      MOD(t2.nums,5) "NUMS"
from ipmsdw.V_O_SR_SWITCH_LINE_NEW t1,
(select sr_name,rownum nums 
  from (select distinct sr_name from ipmsdw.V_O_SR_SWITCH_LINE_NEW 
  where 1=1
  <if test=" '@isContinue'=='t' ">
      and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
  </if>
  <if test=" '@isContinue'=='f' ">
      and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
  </if>
  order by sr_name)) t2
where 1=1 
<if test=" '@isContinue'=='t' ">
    and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
</if>
and t1.sr_name=t2.sr_name
order by sr_name

//PIN大颗粒
<select id="resultMapping">
    --TIME_STAMP=日期 --SYS_NAME=系统名称 --LAG_NAME=LAG名称--LINE_NUM=专线数 --NUMS=总数量
</select>
select 
to_char(TIME_STAMP, 'iyyy- IW') || '周' AS TIME_STAMP,
replace(t1.SYS_NAME,'.sh.cnmobile.net','') sys_name,
nvl(to_char(LAG_NAME),'/') lag_name,
nvl(to_char(LINE_NUM),'/') LINE_NUM,
nvl(to_char(IMS),'/') IMS,
nvl(to_char(CTT),'/') CTT,
nvl(to_char(WLAN),'/') WLAN,
nvl(to_char(DOOIOO),'/') DOOIOO,
MOD(t2.nums,5) NUMS,
case when line_num>=200 then 1 else 0 end a 
from ipmsdw.V_O_SR_LAG_PTN_LINE_SRVLINE t1,
(select sys_name,rownum nums from 
  (select distinct sys_name from ipmsdw.V_O_SR_LAG_PTN_LINE_SRVLINE 
  where 1=1
  <if test=" '@isContinue'=='t' ">
      and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
  </if>
  <if test=" '@isContinue'=='f' ">
      and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
  </if>
  order by sys_name)
) t2
where 1=1
<if test=" '@isContinue'=='t' ">
    and  to_char(TIME_STAMP, 'iyyyIW') between #startTime# and #endTime#
</if>
<if test=" '@isContinue'=='f' ">
    and to_char(TIME_STAMP, 'iyyyIW')  in (#discteteTime#)
</if>
and t1.sys_name=t2.sys_name
order by sys_name,decode(lag_name,
                                         'LAG-1',
                                         1,
                                         'LAG-2',
                                         2,
                                         'LAG-3',
                                         3,
                                         'LAG-4',
                                         4,
                                         'LAG-5',
                                         5,
                                         'LAG-6',
                                         6,
                                         'LAG-7',
                                         7,
                                         'LAG-8',
                                         8,
                                         'LAG-9',
                                         9,
                                         10)




//eMSC性能
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_15M</if>
    <if test=" '@timeType'=='hour' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_H</if>
    <if test=" '@timeType'=='day' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_D</if>
    <if test=" '@timeType'=='week' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_W</if>
    <if test=" '@timeType'=='month' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_M</if>
</select>

<select id="resultMapping">
    --TIME_ID=日期 --USER_LABEL=网元名称 --KPI_001=SRVCC切入请求次数 --line_num=SRVCC切入取消次数 --a=SRVCC切入接受次数 --NUMS=SRVCC切入接受率(%) --ss=SRVCC切入完成次数 --bb=SRVCC切入完成率(%) --cc=SRVCC切入成功次数 --dd=SRVCC切入成功率(%) --ee=SRVCC切入累计时长 --ff=SRVCC切入平均时长
</select>

select
TIME_ID as "报表日期",
USER_LABEL as "网元名称",
KPI_001 as "SRVCC切入请求次数",
KPI_002 as "SRVCC切入取消次数",
KPI_003 as "SRVCC切入接受次数",
KPI_004 as "SRVCC切入接受率(%)",
KPI_005 as "SRVCC切入完成次数",
KPI_006 as "SRVCC切入完成率(%)",
KPI_007 as "SRVCC切入成功次数",
KPI_008 as "SRVCC切入成功率(%)",
KPI_009 as "SRVCC切入累计时长",
KPI_010 as "SRVCC切入平均时长"
from <included id="tableChooseSE"/> where 1=1 and user_label <> 'ALL'
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_ID in (#discteteTime#)
</if>  
        
<isNotEmpty property="qry_0">
    and USER_LABEL like '%$qry_0$%'
</isNotEmpty>
union all select to_number(#endTime#),
'合计',
sum(KPI_001) KPI_001,
sum(KPI_002) KPI_002,
sum(KPI_003) KPI_003,
round(avg(KPI_004),2) KPI_004,
sum(KPI_005) KPI_005,
round(avg(KPI_006),2) KPI_006,
sum(KPI_007) KPI_007,
round(avg(KPI_008),2) KPI_008,
round(sum(KPI_009),2) KPI_009,
round(avg(KPI_010),2) KPI_010
from <included id="tableChooseSE"/> where 1=1 and user_label <> 'ALL'
<if test=" '@isContinue'=='t' ">
    and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and TIME_ID in (#discteteTime#)
</if>    
       
<isNotEmpty property="qry_0">
    and USER_LABEL like '%$qry_0$%'
</isNotEmpty>

//设备端口流量统计报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --interface_ip_addr=SRVCC切入完成次数 --daikuan=SRVCC切入完成率(%) --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=最大接口流入速率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_UTILITY=最大接口流出速率 --liuruzij=待定 --liucuzij=待定
</select>

select 
       <if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>


B.CITY as city,
B.SYS_NAME as sys_name,
B.IP_ADDR as ip_addr,
B.IF_NAME as if_name,
B.IF_ALIAS as if_alias,
B.INTERFACE_IP_ADDR as interface_ip_addr,
to_char(round(c.if_speed/1024/1024,2)) daikuan,
round(sum(A.IF_IN_TRAFFIC)/1024/1024,2) as IF_IN_TRAFFIC,
null as MAX_IF_IN_TRAFFIC,
round(avg(A.IF_IN_UTILITY),2) as IF_IN_UTILITY,
null as MAX_IF_IN_UTILITY,
round(sum(A.IF_OUT_TRAFFIC)/1024/1024,2) as IF_OUT_TRAFFIC,
null as MAX_IF_OUT_TRAFFIC,
round(avg(A.IF_OUT_UTILITY),2) as IF_OUT_UTILITY,
null  as MAX_IF_OUT_UTILITY,
round(60*5*sum(A.IF_IN_TRAFFIC)/1024/1024/8,2) liuruzij,
round(60*5*sum(A.IF_OUT_TRAFFIC)/1024/1024/8,2) liucuzij
from <included id="tableChooseSE"/> A,
ipmsdw.O_RM_INTERFACE c,
(SELECT t1.CITY,
  t1.SYS_NAME,
  t1.IP_ADDR,
  t2.IF_NAME,
  t2.IF_ALIAS,
  t2.ID,
  t2.IP_ADDR  AS INTERFACE_IP_ADDR
FROM ipmsdw.O_RM_DEVICE t1,ipmsdw.O_RM_INTERFACE t2
WHERE t1.DEVICE_ID = t2.DEVICE_ID
) B WHERE 1=1
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 

<isNotEmpty property="qry_0">
  and c.id like '%$qry_0$%'
</isNotEmpty>
<isNotEmpty property="qry_1">
  and B.SYS_NAME like '%$qry_1$%'
</isNotEmpty>
and  1= 1 AND A.UUID = B.ID 
and c.id=a.uuid 
AND B.ID IN ('f4f04ce4a81269b72c8312f969bc4ead','5a5896aecbab3147d4c0f94ac4d418bb','3cbfb4569952cc0ba7a7658a0a92b9fd','4483ef209a93ba003640f5cd72b4ac19','53ae534dfad7d3f12cec935dd53ae794','63ddcf0b5a132ec696f77cae4565192f','668b82ffde830afc86b3eef73ae19694','68d4ac287b2a8848f8127373d005622b','73dec5554c1b5d4c9e8311da65e6b155','839a9a90d3bbd584d412ed680b1974a4','89d837a786ef398c162c890da2d4c2bc','988930b03ae5a29200b87265fd319000','a242685ed31917def680ba6385968a8a','a3f0dd2e112393b081f7404f26d49ed2','ace9a32b69f3e0181265a4b202aad82c','b0af8f70a0742c6c10c8250732c9e185','b289a5242949ec7c01ab8d196db70e75','c78ef1e3dea187f8e3e156b25e98ff25','ca424202d5deca6562747cf30f6bfde6','cf158945005b672171051375f03e71f6','d80d2556ce0f98b3d7eb2a15552f9e2d')
group by 
A.TIME_STAMP, 
B.CITY,B.SYS_NAME,
B.IP_ADDR,
B.IF_NAME,
B.IF_ALIAS,
B.INTERFACE_IP_ADDR,
c.if_speed 
union all 
select '合计' as TIME_STAMP,
  '--' as city,
  '--' as sys_name,
  '--' as ip_addr,
  '--' as if_name,
  '--' as if_alias,
  '--' as interface_ip_addr,
  '--' as daikuan,
  sum(round(sum(A.IF_IN_TRAFFIC)/1024/1024,2)) as IF_IN_TRAFFIC,
  null as MAX_IF_IN_TRAFFIC,
  avg(round(avg(A.IF_IN_UTILITY),2)) as IF_IN_UTILITY,
  null as  MAX_IF_IN_UTILITY,
  sum(round(sum(A.IF_OUT_TRAFFIC)/1024/1024,2)) as IF_OUT_TRAFFIC,
  null as  MAX_IF_OUT_TRAFFIC,
  avg(round(avg(A.IF_OUT_UTILITY),2)) as IF_OUT_UTILITY,
  null as  MAX_IF_OUT_UTILITY,
  sum(round(60*5*sum(A.IF_IN_TRAFFIC)/1024/1024/8,2)) liuruzij,
  sum(round(60*5*sum(A.IF_OUT_TRAFFIC)/1024/1024/8,2)) liucuzij
from <included id="tableChooseSE"/> A,
  ipmsdw.O_RM_INTERFACE c,
  (SELECT t1.CITY,
    t1.SYS_NAME,
    t1.IP_ADDR,
    t2.IF_NAME,
    t2.IF_ALIAS,
    t2.ID,
    t2.IP_ADDR  AS INTERFACE_IP_ADDR
  FROM ipmsdw.O_RM_DEVICE t1,
    ipmsdw.O_RM_INTERFACE t2
  WHERE t1.DEVICE_ID = t2.DEVICE_ID
  ) B 
WHERE 1=1 
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
and   1= 1 
AND A.UUID = B.ID 
and c.id=a.uuid 
AND B.ID IN ('1c5d6522bbf120055eb60a7d10fe42d3','29caa72736419bc85fed2e69ad6b1a62','3cbfb4569952cc0ba7a7658a0a92b9fd','4483ef209a93ba003640f5cd72b4ac19','53ae534dfad7d3f12cec935dd53ae794','63ddcf0b5a132ec696f77cae4565192f','668b82ffde830afc86b3eef73ae19694','68d4ac287b2a8848f8127373d005622b','73dec5554c1b5d4c9e8311da65e6b155','839a9a90d3bbd584d412ed680b1974a4','89d837a786ef398c162c890da2d4c2bc','988930b03ae5a29200b87265fd319000','a242685ed31917def680ba6385968a8a','a3f0dd2e112393b081f7404f26d49ed2','ace9a32b69f3e0181265a4b202aad82c','b0af8f70a0742c6c10c8250732c9e185','b289a5242949ec7c01ab8d196db70e75','c78ef1e3dea187f8e3e156b25e98ff25','ca424202d5deca6562747cf30f6bfde6','cf158945005b672171051375f03e71f6','d80d2556ce0f98b3d7eb2a15552f9e2d')
group by A.TIME_STAMP, 
B.CITY,
B.SYS_NAME,
B.IP_ADDR,
B.IF_NAME,
B.IF_ALIAS,
B.INTERFACE_IP_ADDR,
c.if_speed
order by TIME_STAMP,
city,
sys_name,
ip_addr,
if_name,
if_alias,
interface_ip_addr

//MX960端口利用率统计报表
select to_char(time_stamp, 'yyyy-MM-dd HH24') || '点' AS TIMESTAMP,
       a.SYS_NAME,
       a.IP_ADDR,
       b.IF_DESCR,
       b.IF_ALIAS,
       round(100 * IF_IN_TRAFFIC / IF_SPEED,3) IF_IN_UTILITY,
       round(100 * MAX_IF_IN_TRAFFIC / IF_SPEED,3) MAX_IF_IN_UTILITY,
       round(100 * IF_OUT_TRAFFIC / IF_SPEED,3) IF_OUT_UTILITY,
       round(100 * MAX_IF_OUT_TRAFFIC / IF_SPEED,3) MAX_IF_OUT_UTILITY,
      round (IF_IN_DISCARDS,3) IF_IN_DISCARDS,
       round(MAX_IF_IN_DISCARDS,3) MAX_IF_IN_DISCARDS,
       round(IF_IN_ERROR,3) IF_IN_ERROR,
      round (MAX_IF_IN_ERROR,3) MAX_IF_IN_ERROR,
       round(IF_OUT_DISCARDS,3) IF_OUT_DISCARDS,
       round(MAX_IF_OUT_DISCARDS,3) MAX_IF_OUT_DISCARDS,
      round (IF_OUT_ERROR,3) IF_OUT_ERROR,
      round (MAX_IF_OUT_ERROR,3) MAX_IF_OUT_ERROR
  from ipmsdw.O_RM_DEVICE a, ipmsdw.O_RM_INTERFACE b, ipmsdw.DW_FT_RE_ST_INTERFACE_H c
 WHERE a.ip_addr in
       ('117.135.110.1', '117.135.110.2', '117.135.110.3', '117.135.110.4')
   and a.device_id = b.device_id
   and b.if_alias is not null
   and a.device_id = c.device_uuid
   and b.id = c.uuid
   and time_stamp >=trunc(sysdate-1)
   and time_stamp < trunc(sysdate)
   order by  MAX_IF_IN_UTILITY desc,time_stamp  


//寰宇鸿通端口流量统计报表
SELECT *
  FROM (SELECT A.*, ROWNUM RN
          FROM (select to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24') || '点' as TIME_STAMP,
                       B.CITY,
                       B.SYS_NAME,
                       B.IP_ADDR,
                       B.IF_NAME,
                       B.IF_ALIAS,
                       B.INTERFACE_IP_ADDR,
                       to_char(round(c.if_speed / 1024 / 1024, 2)) daikuan,
                       round(sum(A.IF_IN_TRAFFIC) / 1024 / 1024, 2) as IF_IN_TRAFFIC,
                       round(sum(A.MAX_IF_IN_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_IN_TRAFFIC,
                       round(avg(A.IF_IN_UTILITY), 2) as IF_IN_UTILITY,
                       round(max(A.MAX_IF_IN_UTILITY), 2) as MAX_IF_IN_UTILITY,
                       round(sum(A.IF_OUT_TRAFFIC) / 1024 / 1024, 2) as IF_OUT_TRAFFIC,
                       round(sum(A.MAX_IF_OUT_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_OUT_TRAFFIC,
                       round(avg(A.IF_OUT_UTILITY), 2) as IF_OUT_UTILITY,
                       round(max(A.MAX_IF_OUT_UTILITY), 2) as MAX_IF_OUT_UTILITY,
                       round(60 * 60 * sum(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                             2) liuruzij,
                       round(60 * 60 * sum(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                             2) liucuzij
                  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
                       ipmsdw.O_RM_INTERFACE c,
                       (SELECT t1.CITY,
                               t1.SYS_NAME,
                               t1.IP_ADDR,
                               t2.IF_NAME,
                               t2.IF_ALIAS,
                               t2.ID,
                               t2.IP_ADDR AS INTERFACE_IP_ADDR
                          FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                         WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                 WHERE A.TIME_STAMP >=trunc(sysdate-1)
                   and A.TIME_STAMP < trunc(sysdate)
                   and 1 = 1
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN (select b.port_id from ipmsdw.o_sh_report_devicemodule a,ipmsdw.o_sh_report_user_port b
where a.module_id=b.module_id
and a.module_name='寰宇鸿通'  and a.creator='weihu1')
                 group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24') || '点',
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          B.IF_NAME,
                          B.IF_ALIAS,
                          B.INTERFACE_IP_ADDR,
                          c.if_speed
                union all
                select '合计' as TIME_STAMP,
                       '--' as CITY,
                       '--' as SYS_NAME,
                       '--' as IP_ADDR,
                       '--' as IF_NAME,
                       '--' as IF_ALIAS,
                       '--' as INTERFACE_IP_ADDR,
                       '--' as daikuan,
                       sum(round(sum(A.IF_IN_TRAFFIC) / 1024 / 1024, 2)) as IF_IN_TRAFFIC,
                       sum(round(sum(A.MAX_IF_IN_TRAFFIC) / 1024 / 1024, 2)) as MAX_IF_IN_TRAFFIC,
                       avg(round(avg(A.IF_IN_UTILITY), 2)) as IF_IN_UTILITY,
                       avg(round(max(A.MAX_IF_IN_UTILITY), 2)) as MAX_IF_IN_UTILITY,
                       sum(round(sum(A.IF_OUT_TRAFFIC) / 1024 / 1024, 2)) as IF_OUT_TRAFFIC,
                       sum(round(sum(A.MAX_IF_OUT_TRAFFIC) / 1024 / 1024, 2)) as MAX_IF_OUT_TRAFFIC,
                       avg(round(avg(A.IF_OUT_UTILITY), 2)) as IF_OUT_UTILITY,
                       avg(round(max(A.MAX_IF_OUT_UTILITY), 2)) as MAX_IF_OUT_UTILITY,
                       sum(round(60 * 60 * sum(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                                 2)) liuruzij,
                       sum(round(60 * 60 * sum(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                                 2)) liucuzij
                  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
                       ipmsdw.O_RM_INTERFACE c,
                       (SELECT t1.CITY,
                               t1.SYS_NAME,
                               t1.IP_ADDR,
                               t2.IF_NAME,
                               t2.IF_ALIAS,
                               t2.ID,
                               t2.IP_ADDR AS INTERFACE_IP_ADDR
                          FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                         WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                 WHERE  A.TIME_STAMP >=trunc(sysdate-1)
                   and A.TIME_STAMP < trunc(sysdate)
                   and 1 = 1
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN (select b.port_id from ipmsdw.o_sh_report_devicemodule a,ipmsdw.o_sh_report_user_port b
where a.module_id=b.module_id
and a.module_name='寰宇鸿通'  and a.creator='weihu1')
                 group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24') || '点',
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          B.IF_NAME,
                          B.IF_ALIAS,
                          B.INTERFACE_IP_ADDR,
                          c.if_speed
                 order by TIME_STAMP,
                          CITY,
                          SYS_NAME,
                          IP_ADDR,
                          IF_NAME,
                          IF_ALIAS,
                          INTERFACE_IP_ADDR) A
         WHERE ROWNUM <= 800000)
 WHERE RN >= 0                                              


 //骨干网互联链路带宽利用率超阈值报表
 select TIME_STAMP, B.CITY, B.IP_ADDR,B.SYS_NAME, c.IF_ALIAS, IF_IN_UTILITY, IF_OUT_UTILITY, to_char( max_if_in_time,'YYYY-MM-DD hh24:mi:ss') max_if_in_time,to_char( max_if_out_time,'YYYY-MM-DD hh24:mi:ss') max_if_out_time,IF_IN_TRAFFIC, IF_OUT_TRAFFIC, C.IF_NAME, 
        case when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then ROUND(c.if_speed / 1024 / 1024 / 1000) else ROUND(c.if_speed / 1024 / 1024 / 1000) end if_speed 
        from (select /*+ no_merge(B) */TO_CHAR(TIME_STAMP,'yyyy-IW')||'周' as TIME_STAMP, A.UUID, 
            ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time, 
              max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time, 
              ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC 
              from ipmsdw.DW_FT_RE_ST_INTERFACE_5M A,(select uuid 
              from ipmsdw.DW_FT_RE_ST_INTERFACE_5M A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_DEVICE c 
              where      c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL and b.SERVICE_SYSTEM_NAME='CMNET骨干网业务系统' and c.IF_ALIAS like '%CMNET%' and  c.if_name  like '%/%' and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001
              group by TO_CHAR(TIME_STAMP,'yyyy-IW')||'周',uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,c.IF_ALIAS,c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50)B  where A.UUID = B.UUID  and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001
              group by TO_CHAR(TIME_STAMP,'yyyy-IW')||'周', A.UUID) A,   ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_DEVICE c where  c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL and b.SERVICE_SYSTEM_NAME='CMNET骨干网业务系统' and c.IF_ALIAS like '%CMNET%'and c.if_name like '%/%'  union all
   select /*+ no_merge(B) */ '合计' as TIME_STAMP,'--' CITY, '--'  IP_ADDR,'--'  SYS_NAME,'--' IF_ALIAS, 
              ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_in_time, 
              to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_out_time, 
              ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,'--' IF_NAME,null if_seed 
              from ipmsdw.DW_FT_RE_ST_INTERFACE_5M A,(select uuid 
              from ipmsdw.DW_FT_RE_ST_INTERFACE_5M A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_DEVICE c 
              where    c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL and b.SERVICE_SYSTEM_NAME='CMNET骨干网业务系统' and c.IF_ALIAS like '%CMNET%' and  c.if_name  like '%/%'  and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001 
              group by uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,c.IF_ALIAS,c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50)B  where A.UUID = B.UUID  and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001
              order by TIME_STAMP, IF_IN_UTILITY desc,IF_OUT_UTILITY desc ,CITY, SYS_NAME   



//城域网互联链路带宽利用率超阈值报表
select TIME_STAMP, B.CITY, B.IP_ADDR,B.SYS_NAME, c.IF_ALIAS, IF_IN_UTILITY, IF_OUT_UTILITY, to_char( max_if_in_time,'YYYY-MM-DD hh24:mi:ss') max_if_in_time,to_char( max_if_out_time,'YYYY-MM-DD hh24:mi:ss') max_if_out_time,IF_IN_TRAFFIC, IF_OUT_TRAFFIC, C.IF_NAME, 
    case when instr(10 * c.if_speed / 1024 / 1024 / 1000, 9) = 1 then ROUND(c.if_speed / 1024 / 1024 / 1000) else ROUND(c.if_speed / 1024 / 1024 / 1000) end if_speed 
    from (select TO_CHAR(TIME_STAMP,'yyyy-IW')||'周' as TIME_STAMP, A.UUID, 
          ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc) max_if_in_time, 
          max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc) max_if_out_time, 
          ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,(select uuid 
          from ipmsdw.DW_FT_RE_ST_INTERFACE_H A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c  where     c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL  and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' or SYS_NAME like '%MB-CMNET%' or SYS_NAME like'%MC-CMNET%' or SYS_NAME like '%MA-CMNET%') and c.IF_ALIAS like '%CMNET%' and  c.if_name  like '%/%' and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001 
           group by TO_CHAR(TIME_STAMP,'yyyy-IW')||'周',uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,c.IF_ALIAS,c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50)B  where A.UUID = B.UUID   and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001  group by TO_CHAR(TIME_STAMP,'yyyy-IW')||'周', A.UUID) A,   ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c where  c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' or SYS_NAME like '%MB-CMNET%' or SYS_NAME like'%MC-CMNET%' or SYS_NAME like '%MA-CMNET%') and c.IF_ALIAS like '%CMNET%' and c.IF_ALIAS like '%CMNET%'and c.if_name like '%/%'  union all
 select  '合计' as TIME_STAMP,'--' CITY, '--'  IP_ADDR,'--'  SYS_NAME,'--' IF_ALIAS, 
             ROUND(max(A.IF_IN_UTILITY), 2) IF_IN_UTILITY, ROUND(max(A.IF_OUT_UTILITY), 2) IF_OUT_UTILITY,to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_IN_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_in_time, 
             to_char(max(TIME_STAMP) KEEP(DENSE_RANK first order by A.IF_OUT_UTILITY desc), 'yyyy-MM-dd HH24:mi:ss') max_if_out_time, 
             ROUND(max(A.IF_IN_TRAFFIC / 1024 / 1024 / 1000), 2) IF_IN_TRAFFIC,ROUND(max(A.IF_OUT_TRAFFIC / 1024 / 1024 / 1000), 2) IF_OUT_TRAFFIC,'--' IF_NAME,null if_seed 
             from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,(select uuid 
             from ipmsdw.DW_FT_RE_ST_INTERFACE_H A, ipmsdw.O_RM_DEVICE B, ipmsdw.O_RM_INTERFACE c 
             where   c.DEVICE_ID = B.DEVICE_ID and c.ID = A.UUID AND CITY IS NOT NULL and b.SERVICE_SYSTEM_NAME='CMNET城域网业务系统'  and (SYS_NAME like '%PB-CMNET%' or SYS_NAME like '%PC-CMNET%' or SYS_NAME like '%PA-CMNET%' or  SYS_NAME like '%PI-CMNET%' or SYS_NAME like '%MB-CMNET%' or SYS_NAME like'%MC-CMNET%' or SYS_NAME like '%MA-CMNET%') and c.IF_ALIAS like '%CMNET%' and c.IF_ALIAS like '%CMNET%' and  c.if_name  like '%/%' and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001 
             group by uuid ,B.CITY,B.SYS_NAME, B.IP_ADDR,C.IF_NAME,c.IF_ALIAS,c.if_speed having max(A.MAX_IF_IN_UTILITY) > 50 or max(A.MAX_IF_OUT_UTILITY) > 50)B  where A.UUID = B.UUID and a.time_stamp >= trunc(sysdate-7,'iw') and time_stamp< trunc(sysdate,'iw')-0.0001 
             order by TIME_STAMP, IF_IN_UTILITY desc,IF_OUT_UTILITY desc ,CITY, SYS_NAME 

//城域网大颗粒带宽利用率超阈值报表
SELECT T1.*,MOD(NUMS,5) AS NUMS FROM
(select DATA_TYPE,
  TO_CHAR(TIME_STAMP,'YYYY-MM-DD') TIME_STAMP,
  replace(SYS_NAME,'.sh.cnmobile.net','') sys_name,
  C_NAME,IF_NAME,IF_ALIAS,IF_DISPLAY_SPEED,
  round(MAX_IF_IN_UTILITY,3) MAX_IF_IN_UTILITY,
  round(MAX_IF_OUT_UTILITY,3) MAX_IF_OUT_UTILITY,
  to_char(MAX_INTRAFFIC_TIME_STAMP,'yyyy-mm-dd hh24:mi:ss') MAX_INTRAFFIC_TIME_STAMP,
  to_char(MAX_OUTTRAFFIC_TIME_STAMP,'yyyy-mm-dd hh24:mi:ss') MAX_OUTTRAFFIC_TIME_STAMP,
  round(MAX_IF_IN_TRAFFIC/1000/1000,3) MAX_IF_IN_TRAFFIC,
  round(MAX_IF_OUT_TRAFFIC/1000/1000,3) MAX_IF_OUT_TRAFFIC,
  case when MAX_IF_IN_UTILITY>=50 then 1 else 0 end as a, 
  case when MAX_IF_out_UTILITY>=50 then 1 else 0 end as b
 from ipmsdw.v_o_cmnet_ptn_mstp_kpi_day 
 where time_stamp=trunc(sysdate-1) 
 and data_type='PTN' ORDER BY SYS_NAME desc
 ) T1,
(SELECT SYS_NAME,
  ROWNUM NUMS 
 FROM 
 (SELECT DISTINCT replace(SYS_NAME,'.sh.cnmobile.net','') sys_name 
  FROM ipmsdw.v_o_cmnet_ptn_mstp_kpi_day 
  where time_stamp=trunc(sysdate-1) 
  and data_type='PTN' ORDER BY SYS_NAME)  )T2
 WHERE T1.SYS_NAME=T2.SYS_NAME
UNION ALL
SELECT T1.*,MOD(NUMS,5) AS NUMS FROM
(select DATA_TYPE,TO_CHAR(TIME_STAMP,'YYYY-MM-DD') TIME_STAMP,
  replace(SYS_NAME,'.sh.cnmobile.net','') sys_name,
  C_NAME,IF_NAME,IF_ALIAS,IF_DISPLAY_SPEED,
  round(MAX_IF_IN_UTILITY,3) MAX_IF_IN_UTILITY,
  round(MAX_IF_OUT_UTILITY,3) MAX_IF_OUT_UTILITY,
  to_char(MAX_INTRAFFIC_TIME_STAMP,'yyyy-mm-dd hh24:mi:ss') MAX_INTRAFFIC_TIME_STAMP,
  to_char(MAX_OUTTRAFFIC_TIME_STAMP,'yyyy-mm-dd hh24:mi:ss') MAX_OUTTRAFFIC_TIME_STAMP,
  round(MAX_IF_IN_TRAFFIC/1000/1000,3) MAX_IF_IN_TRAFFIC,
  round(MAX_IF_OUT_TRAFFIC/1000/1000,3) MAX_IF_OUT_TRAFFIC,
 case when MAX_IF_IN_UTILITY>=50 then 1 else 0 end as a, 
 case when MAX_IF_out_UTILITY>=50 then 1 else 0 end as b
 from ipmsdw.v_o_cmnet_ptn_mstp_kpi_day 
 where time_stamp=trunc(sysdate-1) 
 and data_type='MSTP' ORDER BY SYS_NAME desc
 ) T1,
(SELECT SYS_NAME,ROWNUM NUMS 
  FROM 
  (SELECT DISTINCT replace(SYS_NAME,'.sh.cnmobile.net','') sys_name 
    FROM ipmsdw.v_o_cmnet_ptn_mstp_kpi_day  
    where time_stamp=trunc(sysdate-1) 
    and data_type='MSTP'ORDER BY SYS_NAME)) T2
 WHERE T1.SYS_NAME=T2.SYS_NAME


//9306电路流量表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --DAIKUAN=SRVCC切入完成率(%) --MAX_IF_IN_TRAFFIC=最大接口流入速率 --MAX_IF_IN_UTILITY=最大接口流入速率 --MAX_IF_OUT_UTILITY=接口流出速率 --MAX_IF_OUT_UTILITY=最大接口流出速率 --liuruzij=待定 --liucuzij=待定
</select>

with tt as (select *
  from (select 
               to_char(A.TIME_STAMP, 'yyyy- IW') || '周' as TIME_STAMP,
               B.SYS_NAME,
               B.IP_ADDR,
               B.IF_NAME,
               B.IF_ALIAS,
               to_char(round(b.if_speed / 1024 / 1024, 2)) daikuan,
               round(max(A.MAX_IF_IN_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_IN_TRAFFIC,
               round(max(A.MAX_IF_IN_UTILITY), 2) as MAX_IF_IN_UTILITY,
               round(max(A.MAX_IF_OUT_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_OUT_TRAFFIC,
               round(max(A.MAX_IF_OUT_UTILITY), 2) as MAX_IF_OUT_UTILITY
          from <included id="tableChooseSE"/> A,
               (SELECT t1.SYS_NAME,
                       t1.IP_ADDR,
                       t2.IF_NAME,
                       t2.IF_ALIAS,
                       t2.ID,
                       if_speed
                  FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                 WHERE t1.DEVICE_ID = t2.DEVICE_ID
                   and sys_name like '%9306'
                   and (IF_ALIAS like '%OLT%' or IF_ALIAS like '%ME60%' or
                       IF_ALIAS like '%MX960%' or IF_ALIAS like '%7609%')  and if_name not like '%Vlanif%') B
         WHERE 1=1
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
           and 1 = 1
           AND A.UUID = B.ID
         group by to_char(A.TIME_STAMP, 'yyyy- IW') || '周',
                  B.SYS_NAME,
                  B.IP_ADDR,
                  B.IF_NAME,
                  B.IF_ALIAS,
                  b.if_speed
    union all
        select             
              '合计' as TIME_STAMP,
               '合计' as SYS_NAME,
               '--' as IP_ADDR,
               '--' as IF_NAME,
               '--' as IF_ALIAS,
               '--' as daikuan,
               sum(round(max(A.MAX_IF_IN_TRAFFIC) / 1024 / 1024, 2)) as MAX_IF_IN_TRAFFIC,
               avg(round(max(A.MAX_IF_IN_UTILITY), 2)) as MAX_IF_IN_UTILITY,
               sum(round(max(A.MAX_IF_OUT_TRAFFIC) / 1024 / 1024, 2)) as MAX_IF_OUT_TRAFFIC,
               avg(round(max(A.MAX_IF_OUT_UTILITY), 2)) as MAX_IF_OUT_UTILITY
          from <included id="tableChooseSE"/> A,
               (SELECT t1.SYS_NAME,
                       t1.IP_ADDR,
                       t2.IF_NAME,
                       t2.IF_ALIAS,
                       t2.ID,
                       if_speed
                  FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                 WHERE t1.DEVICE_ID = t2.DEVICE_ID
                   and sys_name like '%9306'
                   and (IF_ALIAS like '%OLT%' or IF_ALIAS like '%ME60%' or
                       IF_ALIAS like '%MX960%' or IF_ALIAS like '%7609%')  and if_name not like '%Vlanif%') B
         WHERE 1=1
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
           and 1 = 1
           AND A.UUID = B.ID
         group by to_char(A.TIME_STAMP, 'yyyy- IW') || '周',
                  B.SYS_NAME,
                  B.IP_ADDR,
                  B.IF_NAME,
                  B.IF_ALIAS,
                  B.if_speed)
 order by TIME_STAMP,
          sys_name,
          case
            when IF_ALIAS like '%ME60%' then '1' || IF_NAME
            when if_alias like '%MX960%' then '2'||if_name
            when if_alias like '%7609%' then '3'||if_name
            when if_alias like '%OLT%' then '4'||if_name
            else
             IF_NAME
          end,
          IF_ALIAS)
 select '带宽过阀值' as hw,tt.* from tt where max_if_in_utility>=50 or max_if_out_utility>=50
 union all
 select sys_name as hw,tt.*  from tt

//阿里巴巴BGP流量报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --DAIKUAN=SRVCC切入完成率(%) --MAX_IF_IN_TRAFFIC=最大接口流入速率 --MAX_IF_IN_UTILITY=最大接口流入速率 --MAX_IF_OUT_UTILITY=接口流出速率 --MAX_IF_OUT_UTILITY=最大接口流出速率 --liuruzij=待定 --liucuzij=待定
</select>

select            B.SYS_NAME,
                    to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24:mi:ss')  as TIME_STAMP,
                       B.CITY,
                       B.IP_ADDR,
                       B.IF_NAME,
                       B.IF_ALIAS,
                       B.INTERFACE_IP_ADDR,
                       to_char(round(c.if_speed / 1024 / 1024, 2)) daikuan,
                       round(sum(A.IF_IN_TRAFFIC) / 1024 / 1024, 2) as IF_IN_TRAFFIC,
                       round(avg(A.IF_IN_UTILITY), 2) as IF_IN_UTILITY,
                       round(sum(A.IF_OUT_TRAFFIC) / 1024 / 1024, 2) as IF_OUT_TRAFFIC,
                       round(avg(A.IF_OUT_UTILITY), 2) as IF_OUT_UTILITY,
                       round(60 * 60 * sum(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                             2) liuruzij,
                       round(60 * 60 * sum(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                             2) liucuzij
                  from <included id="tableChooseSE"/> A,
                       ipmsdw.O_RM_INTERFACE c,
                       (SELECT t1.CITY,
                               t1.SYS_NAME,
                               t1.IP_ADDR,
                               t2.IF_NAME,
                               t2.IF_ALIAS,
                               t2.ID,
                               t2.IP_ADDR AS INTERFACE_IP_ADDR
                          FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                         WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                 WHERE 1=1
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
                   and 1 = 1
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN ('9d09e2a3faee9209ad1d343f9f0b00e3','56f2febb4a30b64fcf775967ec6d8f07')
                 group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24:mi:ss'),
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          B.IF_NAME,
                          B.IF_ALIAS,
                          B.INTERFACE_IP_ADDR,
                          c.if_speed
                 order by TIME_STAMP,
                          CITY,
                          SYS_NAME,
                          IP_ADDR,
                          IF_NAME,
                          IF_ALIAS,
                          INTERFACE_IP_ADDR


//每周质量跟踪报表

//CAP平台腾讯、奇虎流量报表
WITH TT AS (select case when instr(B.IF_ALIAS,'QiHu')>0 then '奇虎' else '腾讯' end as SHEET,to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24') || '点' as TIME_STAMP,
                       B.CITY,
                       B.SYS_NAME,
                       B.IP_ADDR,
                       B.IF_NAME,
                       B.IF_ALIAS,
                       B.INTERFACE_IP_ADDR,
                       to_char(round(c.if_speed / 1024 / 1024, 2)) daikuan,
                       round(sum(A.IF_IN_TRAFFIC) / 1024 / 1024, 2) as IF_IN_TRAFFIC,
                       round(sum(A.MAX_IF_IN_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_IN_TRAFFIC,
                       round(avg(A.IF_IN_UTILITY), 2) as IF_IN_UTILITY,
                       round(max(A.MAX_IF_IN_UTILITY), 2) as MAX_IF_IN_UTILITY,
                       round(sum(A.IF_OUT_TRAFFIC) / 1024 / 1024, 2) as IF_OUT_TRAFFIC,
                       round(sum(A.MAX_IF_OUT_TRAFFIC) / 1024 / 1024, 2) as MAX_IF_OUT_TRAFFIC,
                       round(avg(A.IF_OUT_UTILITY), 2) as IF_OUT_UTILITY,
                       round(max(A.MAX_IF_OUT_UTILITY), 2) as MAX_IF_OUT_UTILITY,
                       round(60 * 60 * sum(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                             2) liuruzij,
                       round(60 * 60 * sum(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                             2) liucuzij
                  from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
                       ipmsdw.O_RM_INTERFACE c,
                       (SELECT t1.CITY,
                               t1.SYS_NAME,
                               t1.IP_ADDR,
                               t2.IF_NAME,
                               t2.IF_ALIAS,
                               t2.ID,
                               t2.IP_ADDR AS INTERFACE_IP_ADDR
                          FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                         WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                 WHERE A.TIME_STAMP >=
                       trunc(sysdate-1)
                   and A.TIME_STAMP <
                       trunc(sysdate)
                   and 1 = 1
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN ('33d18fcf6fb87066e86a5aafe520a917',
                          '32e9aec6a44174b39ed4ee04d298c317',
                          '686216c1a2684025ba5fb36dffcafc54',
                          '32076aad8c17645db547da01762f168e',
                          '205e1a83b1116ace030e4f74b1109b4c',
                          'f09b5284b8714eea0273aea861463de0')
                 group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24') || '点',
                          B.CITY,
                          B.SYS_NAME,
                          B.IP_ADDR,
                          B.IF_NAME,
                          B.IF_ALIAS,
                          B.INTERFACE_IP_ADDR,
                          c.if_speed)
    select * from ( SELECT * FROM TT
      union all
      select sheet, '合计','--' as CITY,'--' as SYS_NAME,
                       '--' as IP_ADDR,
                       '--' as IF_NAME,
                       '--' as IF_ALIAS,
                       '--' as INTERFACE_IP_ADDR,
                       '' as daikuan,sum(IF_IN_TRAFFIC),sum(MAX_IF_IN_TRAFFIC),round(avg(IF_IN_UTILITY),2),round(avg(MAX_IF_IN_UTILITY),2),
                       sum(IF_IN_TRAFFIC),sum(MAX_IF_IN_TRAFFIC),round(avg(IF_IN_UTILITY),2),round(avg(MAX_IF_IN_UTILITY),2),
                       sum(liuruzij),sum(liucuzij) from tt group by sheet)  order by sheet desc,time_Stamp                        



    //金山云BGP线路的流量及带宽利报表
    select            B.SYS_NAME,
                        to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24:mi:ss')  as TIME_STAMP,
                           B.CITY,
                           B.IP_ADDR,
                           B.IF_NAME,
                           B.IF_ALIAS,
                           B.INTERFACE_IP_ADDR,
                           to_char(round(c.if_speed / 1024 / 1024, 2)) daikuan,
                           round(sum(A.IF_IN_TRAFFIC) / 1024 / 1024, 2) as IF_IN_TRAFFIC,
                            round(sum(A.max_IF_IN_TRAFFIC) / 1024 / 1024, 2) as max_IF_IN_TRAFFIC,
                        
                           round(avg(A.IF_IN_UTILITY), 2) as IF_IN_UTILITY,
                         
                           round(sum(A.IF_OUT_TRAFFIC) / 1024 / 1024, 2) as IF_OUT_TRAFFIC,
                           round(sum(A.max_IF_OUT_TRAFFIC) / 1024 / 1024, 2) as max_IF_OUT_TRAFFIC,
                         
                           round(avg(A.IF_OUT_UTILITY), 2) as IF_OUT_UTILITY,
                          
                           round(60 * 60 * sum(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                                 2) liuruzij,
                           round(60 * 60 * sum(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                                 2) liucuzij
                      from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
                           ipmsdw.O_RM_INTERFACE c,
                           (SELECT t1.CITY,
                                   t1.SYS_NAME,
                                   t1.IP_ADDR,
                                   t2.IF_NAME,
                                   t2.IF_ALIAS,
                                   t2.ID,
                                   t2.IP_ADDR AS INTERFACE_IP_ADDR
                              FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                             WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                     WHERE A.TIME_STAMP >=trunc(sysdate-1)
                       and A.TIME_STAMP < trunc(sysdate)
                       and 1 = 1
                       AND A.UUID = B.ID
                       and c.id = a.uuid
                       AND B.ID IN ('6ba3b9abc7dd1542cb2b387765805e27','b83223255d50eb19dd37942c32daf2b9')
                     group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24:mi:ss'),
                              B.CITY,
                              B.SYS_NAME,
                              B.IP_ADDR,
                              B.IF_NAME,
                              B.IF_ALIAS,
                              B.INTERFACE_IP_ADDR,
                              c.if_speed
                    union all
                    select 'SHNJ-PI-CMNET-RT01-MX480-RE0'  SYS_NAME,
                           '合计' as TIME_STAMP,
                           '--' as CITY,
                           '--' as IP_ADDR,
                           '--' as IF_NAME,
                           '--' as IF_ALIAS,
                           '--' as INTERFACE_IP_ADDR,
                           '--' as daikuan,
                           avg(round(avg(A.IF_IN_TRAFFIC) / 1024 / 1024, 2)) as IF_IN_TRAFFIC,
                            max(round(avg(A.max_IF_IN_TRAFFIC) / 1024 / 1024, 2)) as max_IF_IN_TRAFFIC,
                          
                           round(avg(avg(A.IF_IN_UTILITY)), 2) as IF_IN_UTILITY,
                          
                           round(avg(avg(A.IF_OUT_TRAFFIC) / 1024 / 1024), 2) as IF_OUT_TRAFFIC,
                           round(max(avg(A.max_IF_OUT_TRAFFIC) / 1024 / 1024), 2) as max_IF_OUT_TRAFFIC,
                          
                           round(avg(avg(A.IF_OUT_UTILITY)), 2) as IF_OUT_UTILITY,
                         
                           avg(round(60 * 60 * avg(A.IF_IN_TRAFFIC) / 1024 / 1024 / 8,
                                     2)) liuruzij,
                           avg(round(60 * 60 * avg(A.IF_OUT_TRAFFIC) / 1024 / 1024 / 8,
                                     2)) liucuzij
                      from ipmsdw.DW_FT_RE_ST_INTERFACE_H A,
                           ipmsdw.O_RM_INTERFACE c,
                           (SELECT t1.CITY,
                                   t1.SYS_NAME,
                                   t1.IP_ADDR,
                                   t2.IF_NAME,
                                   t2.IF_ALIAS,
                                   t2.ID,
                                   t2.IP_ADDR AS INTERFACE_IP_ADDR
                              FROM ipmsdw.O_RM_DEVICE t1, ipmsdw.O_RM_INTERFACE t2
                             WHERE t1.DEVICE_ID = t2.DEVICE_ID) B
                     WHERE  A.TIME_STAMP >=trunc(sysdate-1)
                       and A.TIME_STAMP < trunc(sysdate)
                       and 1 = 1
                       AND A.UUID = B.ID
                       and c.id = a.uuid
                       AND B.ID IN ('6ba3b9abc7dd1542cb2b387765805e27','b83223255d50eb19dd37942c32daf2b9')
                     group by to_char(A.TIME_STAMP, 'yyyy-MM-dd HH24:mi:ss') ,
                              B.CITY,
                              B.SYS_NAME,
                              B.IP_ADDR,
                              B.IF_NAME,
                              B.IF_ALIAS,
                              B.INTERFACE_IP_ADDR,
                              c.if_speed
                       order by time_stamp,if_name      


    //网关收发消息性能指标组(N31)
    


//上海CMNET出口分析报表
select to_char(TIME_STAMP, 'yyyy-MM')||'月' time_stamp,MODULE_NAME,DAIKUAN,IF_IN_TRAFFIC,SIF_IN_TRAFFIC,CHAIN_GROWTH_IN,IF_OUT_TRAFFIC,  SIF_OUT_TRAFFIC,CHAIN_GROWTH_OUT,MAX_IF_IN_TRAFFIC,SMAX_IF_IN_TRAFFIC,CHAIN_GROWTH_MIN, MAX_IF_OUT_TRAFFIC,SMAX_IF_OUT_TRAFFIC,CHAIN_GROWTH_MOUT,utility from ipmsdm.DM_CMNET_EXPORTS_ANALYSIS_M  where time_stamp>= to_date('2016-05-01 00:00:00','yyyy-MM-dd HH24:mi:ss') and time_stamp< to_date('2016-05-31 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1 order by time_stamp,MODULE_NAME




//视频业务分析报表
<select id="resultMapping">
  --STARTTIME_HOUR=时间 --PROVINCE_ID=省 --CITY_ID=地市 --TAC=终端TAC号 --APP_SERVER_IP=应用服务器IP --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --VIDEOTOTALQUERYNBR=视频播放成功次数 --VIDEOBUFFERDLNBR=视频播放请求次数 --VEDIOSUCCPLAYINGRATE=视频播放成功率(%) --VIDEODLTRAFFIC=视频下载数据量(KB) --VIDEODLTIME=视频传输时间(ms) --VIDEODLRATE=视频下载平均速率(KB) --VIDEOPLAYINGBUFFERTIME=视频播放等待时长(ms) --VIDEOAVGBUFFERNBR=视频播放平均停顿次数 --ACTIVEUSERNBR=在线用户数(个)
</select>

select 
starttime_hour,
province_id,
city_id ,
tac ,
app_server_ip ,
service_id ,
subservice_id ,
VideoTotalQueryNbr ,
VideoBufferDlNbr ,
round(VedioSuccPlayingRate,2) VedioSuccPlayingRate,
VideoDlTraffic ,
VideoDlTime ,
VideoDlRate ,
VideoPlayingBufferTime ,
VideoAvgBufferNbr ,
ActiveUserNbr 
from IPMSDW.DW_FT_SE_AR_APP_L3_VIDEO_H
where 1=1 
<if test=" '@isContinue'=='t' ">
    and starttime_hour between to_char(#startTime#) and            to_char(#endTime#)
</if>
<if test=" '@isContinue'=='f' ">
    and starttime_hour in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>



//家庭宽带业务
<select id="resultMapping">
  --DATETIME=时间 --PROVINCE_ID=省 --CITY_ID=地市 --COUNTRYNAME=区县 --BRASNAME=BRAS --OLTNAME=OLT --ONUNAME=ONU --DLTRAFFIC=下行流量(MB) --FIRSTHTTPRESPDELAY=第一个HTTP响应包总时延(ms) --LASTHTTPCONTENTDELAY=最后一个HTTP内容包的时延(ms) --HTTPREQNUM=HTTP请求次数
</select>
select 
DateTime,
Province_id,
City_id,
CountryName,
BRASName,
OLTName,
ONUName,
DlTraffic,
FirstHttpRespDelay,
LastHttpContentDelay,
HttpReqNum
from 
IPMSDW.DW_FT_SE_4G_AR_CELL_NE_HBB_D
where 1=1
<if test=" '@isContinue'=='f' ">
    and DateTime in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>


//4G上网业务
<select id="resultMapping">
  --DATETIME=时间 --PROVINCE_ID=省 --CITY_ID=地市 --COUNTRYNAME=区县 --TAC=跟踪区编码 --ECI=小区编号 --CELLNAME=小区名称 --SGWID=业务网关标识 --SGWNAME=业务网关名称 --DLTRAFFIC=下行流量(MB) --FIRSTHTTPRESPDELAY=第一个HTTP响应包总时延(ms) --LASTHTTPCONTENTDELAY=最后一个HTTP内容包的时延(ms) HTTPREQNUM=HTTP请求次数
</select>

select 
DATETIME,PROVINCE_ID,CITY_ID,COUNTRYNAME,
TAC,ECI,CELLNAME,SGWID,SGWNAME,DLTRAFFIC,
FIRSTHTTPRESPDELAY,LASTHTTPCONTENTDELAY,
HTTPREQNUM
from IPMSDW.DW_FT_SE_4G_AR_CELL_NE_GEN_D
where 1=1 
<if test=" '@isContinue'=='f' ">
    and DateTime in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,8)
</jdbcType>

//4G小区资源配置表
<select id="resultMapping">
  --STARTTIME_DAY=时间 --PROVINCE_ID=省 --CITY_ID=地市 --COUNTY=所属区县 --TAC=跟踪区编码 --ECI=小区编号 --CELL_ID=小区标识 --CELL_NAME=小区名称 --ENODEB_ID=所属E-NODEB
 --ENODEB_NAME=所属E-NODEB网元名称 --CELL_VENDOR_ID=小区厂家编码 --COVERAGE_TYPE=覆盖类型 --COVERAGE_AREA=覆盖场景 --LONGITUDE=经度 --LATITUDE=纬度
</select>

select 
substr(STARTTIME_DAY,0,6) STARTTIME_DAY,
PROVINCE_ID,CITY_ID,COUNTY,
TAC,ECI,CELL_ID,CELL_NAME,ENODEB_ID,ENODEB_NAME,
CELL_VENDOR_ID,COVERAGE_TYPE,COVERAGE_AREA,
LONGITUDE,LATITUDE
from IPMSDW.DW_DM_RE_BA_EUTRANCELL_RPT_M
where 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIME_DAY,0,6) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,6)
</jdbcType>


//地市[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --PROVINCE_ID=省 --CITY_ID=地市 --HTTPATTNBR=HTTP业务请求总次数(次) --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(KB)
 --DLTRAFFIC=下行流量(KB) --DLTRAFFIC500=下行流量（>500KB）(KB) --HTTPDLRATE010=下行速率（0~10KB,包含10KB）(KB) --HTTPDLRATE1050=下行速率（10~50KB,包含50KB）(KB) --HTTPDLRATE50100=下行速率（50~100KB,包含100KB）(KB) --HTTPDLRATE100500=下行速率（100~500KB,包含500KB）(KB) --HTTPDLRATE500=下行速率（>500KB）(KB) --TCPSUCCNBR=TCP建立成功次数 --TCPATTNBR=TCP建立请求次数 --TCPSUCCRATE=TCP建立成功率(%) --TCPTOTALTIME=TCP建立总时延(ms) --TCPAVGTIME=TCP建立平均时延(ms) --ATTACHATTNBR=ATTACH请求次数 --ATTACHSUCCNBR=ATTACH成功次数 --ATTACHSUCCRATE=ATTACH成功率(%) --ATTACHTOTALTIME=ATTACH总时延(ms) --ATTACHAVGTIME=ATTACH平均时延(ms) --EPSBEARERATTNBR=承载建立总次数 --EPSBEARERSUCCNBR=承载建立成功次数 --EPSBEARERSUCCRATE=承载建立成功率(%) --EPSBEARERTOTALTIME=承载建立总时延(ms) --EPSBEARERAVGTIME=承载建立平均时延(ms) --ACTIVEUSERNBR=在线用户数(个)

</select>

select * from IPMSDW.DW_FT_SE_4G_AR_GEN_H 
where 1=1 
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,12) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char"/>


//业务大类[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --PROVINCE_ID=省 --CITY_ID=地市 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --HTTPATTNBR=HTTP业务请求总次数(次) --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(B) --DLTRAFFIC=下行流量(B) --DLTRAFFIC500=下行流量（>500KB）(B) --HTTPDLRATE500=下行速率（>500KB）(KB) --HTTPAVGDLRATE=下行速率(KB) --ACTIVEUSERNBR=在线用户数(个)
</select>

select 
substr(STARTTIMEHH,0,10) STARTTIMEHH,
PROVINCE_ID,CITY_ID,SERVICE_ID,
HTTPATTNBR,HTTPSUCCNBR,HTTPSUCCRATE,HTTPTOTALRESPTIME,HTTPAVGRESPTIME,ULTRAFFIC,DLTRAFFIC,HTTPAVGDLRATE,ACTIVEUSERNBR
from IPMSDW.DW_FT_SE_4G_AR_APP_L1_GEN_H
where 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,10) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>

//业务小类[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --PROVINCE_ID=省 --CITY_ID=地市 --SERVICE_ID=业务大类 --SUBSERVICE_ID=业务小类 --HTTPATTNBR=HTTP业务请求总次数(次) --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(B) --DLTRAFFIC=下行流量(B) --DLTRAFFIC500=下行流量（>500KB）(B) --HTTPDLRATE500=下行速率（>500KB）(KB) --HTTPDLRATE=下行速率(KB) --ACTIVEUSERNBR=在线用户数(个)
</select>

select 
substr(STARTTIMEHH,0,10) STARTTIMEHH,
PROVINCE_ID,CITY_ID,SERVICE_ID,SUBSERVICE_ID,
HTTPATTNBR,HTTPSUCCNBR,HTTPSUCCRATE,HTTPTOTALRESPTIME,HTTPAVGRESPTIME,ULTRAFFIC,DLTRAFFIC,DLTRAFFIC500,HTTPDLRATE500,HTTPDLRATE,ACTIVEUSERNBR
from IPMSDW.DW_FT_SE_4G_AR_APP_L3_GEN_H
where 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,10) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>

//SGW网元[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --PROVINCE_ID=省 --CITY_ID=地市 --HTTPATTNBR=HTTP业务请求总次数(次) --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(KB)
 --DLTRAFFIC=下行流量(KB) --DLTRAFFIC500=下行流量（>500KB）(KB) --HTTPDLRATE010=下行速率（0~10KB,包含10KB）(KB) --HTTPDLRATE1050=下行速率（10~50KB,包含50KB）(KB) --HTTPDLRATE50100=下行速率（50~100KB,包含100KB）(KB) --HTTPDLRATE100500=下行速率（100~500KB,包含500KB）(KB) --HTTPDLRATE500=下行速率（>500KB）(KB) --TCPSUCCNBR=TCP建立成功次数 --TCPATTNBR=TCP建立请求次数 --TCPSUCCRATE=TCP建立成功率(%) --TCPTOTALTIME=TCP建立总时延(ms) --TCPAVGTIME=TCP建立平均时延(ms) --ATTACHATTNBR=ATTACH请求次数 --ATTACHSUCCNBR=ATTACH成功次数 --ATTACHSUCCRATE=ATTACH成功率(%) --ATTACHTOTALTIME=ATTACH总时延(ms) --ATTACHAVGTIME=ATTACH平均时延(ms) --EPSBEARERATTNBR=承载建立总次数 --EPSBEARERSUCCNBR=承载建立成功次数 --EPSBEARERSUCCRATE=承载建立成功率(%) --EPSBEARERTOTALTIME=承载建立总时延(ms) --EPSBEARERAVGTIME=承载建立平均时延(ms) --ACTIVEUSERNBR=在线用户数(个)

</select>

select 
substr(STARTTIMEHH,0,10) STARTTIMEHH,
PROVINCE_ID,CITY_ID,SGW_NAME,
HTTPATTNBR,HTTPSUCCNBR,HTTPSUCCRATE,HTTPTOTALRESPTIME,HTTPAVGRESPTIME,ULTRAFFIC,DLTRAFFIC,HTTPDLRATE,HTTPDLRATE500,TCPSUCCNBR,TCPATTNBR,TCPSUCCRATE,TCPTOTALTIME,TCPAVGTIME
from IPMSDW.DW_FT_SE_4G_PR_SGW_GEN_H
where 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,10) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>


//小区[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --CELL_ID=小区标识 --AREA_NAME=区域名称 --HTTPDLRATE=HTTP业务成功率(%) --PROVINCE_ID=省 --CITY_ID=地市 --HTTPATTNBR=HTTP业务请求总次数(次) --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(KB)
 --DLTRAFFIC=下行流量(KB) --DLTRAFFIC500=下行流量（>500KB）(KB) --HTTPDLRATE010=下行速率（0~10KB,包含10KB）(KB) --HTTPDLRATE1050=下行速率（10~50KB,包含50KB）(KB) --HTTPDLRATE50100=下行速率（50~100KB,包含100KB）(KB) --HTTPDLRATE100500=下行速率（100~500KB,包含500KB）(KB) --HTTPDLRATE500=下行速率（>500KB）(KB) --TCPSUCCNBR=TCP建立成功次数 --TCPATTNBR=TCP建立请求次数 --TCPSUCCRATE=TCP建立成功率(%) --TCPTOTALTIME=TCP建立总时延(ms) --TCPAVGTIME=TCP建立平均时延(ms) --ATTACHATTNBR=ATTACH请求次数 --ATTACHSUCCNBR=ATTACH成功次数 --ATTACHSUCCRATE=ATTACH成功率(%) --ATTACHTOTALTIME=ATTACH总时延(ms) --ATTACHAVGTIME=ATTACH平均时延(ms) --EPSBEARERATTNBR=承载建立总次数 --EPSBEARERSUCCNBR=承载建立成功次数 --EPSBEARERSUCCRATE=承载建立成功率(%) --EPSBEARERTOTALTIME=承载建立总时延(ms) --EPSBEARERAVGTIME=承载建立平均时延(ms) --ACTIVEUSERNBR=在线用户数(个)

</select>
select 
substr(STARTTIMEHH,0,10) STARTTIMEHH,
PROVINCE_ID,CITY_ID,CELL_ID,AREA_NAME,HTTPATTNBR,HTTPSUCCNBR,HTTPSUCCRATE,HTTPTOTALRESPTIME,HTTPAVGRESPTIME,ULTRAFFIC,DLTRAFFIC,HTTPDLRATE,HTTPDLRATE500,TCPSUCCNBR,TCPATTNBR,TCPSUCCRATE,TCPTOTALTIME,TCPAVGTIME,ATTACHATTNBR,ATTACHSUCCNBR,ATTACHSUCCRATE,ATTACHTOTALTIME,ATTACHAVGTIME,EPSBEARERATTNBR,EPSBEARERSUCCNBR,EPSBEARERSUCCRATE,EPSBEARERTOTALTIME,EPSBEARERAVGTIME
from IPMSDW.DW_FT_SE_4G_AR_CL_GEN_H
where 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,10) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>


//终端[NRT]
<select id="resultMapping">
  --STARTTIMEHH=时间 --CELL_ID=小区标识 --AREA_NAME=区域名称 --HTTPDLRATE=HTTP业务成功率(%) --PROVINCE_ID=省 --CITY_ID=地市 --HTTPATTNBR=HTTP业务请求总次数(次) --TERMINALNBR=终端数量 --HTTPSUCCNBR=HTTP业务成功次数(次) --HTTPSUCCRATE=HTTP业务成功率(%) --HTTPTOTALRESPTIME=HTTP响应总时延(ms) --HTTPAVGRESPTIME=HTTP平均响应时延(ms) --ULTRAFFIC=上行流量(KB)
 --DLTRAFFIC=下行流量(KB) --DLTRAFFIC500=下行流量（>500KB）(KB) --HTTPDLRATE010=下行速率（0~10KB,包含10KB）(KB) --HTTPDLRATE1050=下行速率（10~50KB,包含50KB）(KB) --HTTPDLRATE50100=下行速率（50~100KB,包含100KB）(KB) --HTTPDLRATE100500=下行速率（100~500KB,包含500KB）(KB) --HTTPDLRATE500=下行速率（>500KB）(KB) --TCPSUCCNBR=TCP建立成功次数 --TCPATTNBR=TCP建立请求次数 --TCPSUCCRATE=TCP建立成功率(%) --TCPTOTALTIME=TCP建立总时延(ms) --TCPAVGTIME=TCP建立平均时延(ms) --ATTACHATTNBR=ATTACH请求次数 --ATTACHSUCCNBR=ATTACH成功次数 --ATTACHSUCCRATE=ATTACH成功率(%) --ATTACHTOTALTIME=ATTACH总时延(ms) --ATTACHAVGTIME=ATTACH平均时延(ms) --EPSBEARERATTNBR=承载建立总次数 --EPSBEARERSUCCNBR=承载建立成功次数 --EPSBEARERSUCCRATE=承载建立成功率(%) --EPSBEARERTOTALTIME=承载建立总时延(ms) --EPSBEARERAVGTIME=承载建立平均时延(ms) --ACTIVEUSERNBR=在线用户数(个)
</select>

SELECT 
substr(STARTTIMEHH,0,10) STARTTIMEHH,
PROVINCE_ID,CITY_ID,IMEI_TAC,HTTPATTNBR,HTTPSUCCNBR,HTTPSUCCRATE,HTTPTOTALRESPTIME,HTTPAVGRESPTIME,ULTRAFFIC,DLTRAFFIC,HTTPDLRATE,HTTPDLRATE500,TCPSUCCRATE,TCPTOTALTIME,TCPAVGTIME,ATTACHATTNBR,ATTACHSUCCNBR,ATTACHSUCCRATE,ATTACHTOTALTIME,ATTACHAVGTIME,EPSBEARERATTNBR,EPSBEARERSUCCNBR,EPSBEARERSUCCRATE,EPSBEARERTOTALTIME,EPSBEARERAVGTIME,TERMINALNBR
FROM IPMSDW.DW_FT_SE_4G_AR_TM_GEN_H
WHERE 1=1
<if test=" '@isContinue'=='f' ">
    and substr(STARTTIMEHH,0,10) in (#discteteTime#)
</if>         
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,10)
</jdbcType>


//SAEGW统计报表
<select id="resultMapping">
  --STAT_TIME=时间 --NE_NAME=网元名称 --BILLED_NUM=话单量 --FLOW=流量(MB)
</select>
select * 
from ipmsdw.DW_FT_RE_ST_SAEGW_GPRS_D 
where 1=1 
<if test=" '@isContinue'=='f' ">
    and to_date(STAT_TIME) in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-date"/>


//EPC核心网DNS统计报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_DNS_TRAFFIC_15M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_DNS_TRAFFIC_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_DNS_TRAFFIC_D</if>   
</select>

<select id="resultMapping">
  --ORG_TIME=时间 --SERVICE_IP=DNS服务器IP --USER_CHECK_SUC_NUM=用户解析成功数 --SYS_CHECK_SUC_NUM=系统解析成功数 --FAIL_NUM=失败数 --RECURS_REQ_CHECK_NUM=递归请求查询数 --NORECURS_REQ_CHECK_NUM=非递归查询数 --ALL_REQ_NUM=总请求数 --SYS_CHECK_SUC_RATE=系统解析成功率(%) --USER_CHECK_SUC_RATE=用户解析成功率(%) --DNSPA13=平均时延
</select>
select  
     <if1 test=" '@timeType'=='min' ">to_char(ORG_TIME,'yyyy-MM-dd hh24:mi:ss') ORG_TIME,</if1>
     <if2 test=" '@timeType'=='hour' ">to_char(ORG_TIME,'yyyy-MM-dd hh24') ORG_TIME,</if2>
     <if3 test=" '@timeType'=='day' ">to_char(ORG_TIME,'yyyy-MM-dd') ORG_TIME,</if3>   

SERVICE_IP, 
USER_CHECK_SUC_NUM, 
SYS_CHECK_SUC_NUM,
FAIL_NUM, 
RECURS_REQ_CHECK_NUM,
NORECURS_REQ_CHECK_NUM,
ALL_REQ_NUM,
round(SYS_CHECK_SUC_RATE,2) SYS_CHECK_SUC_RATE,
round(USER_CHECK_SUC_RATE,2) USER_CHECK_SUC_RATE
from <included id="tableChooseSE"/>  where 1=1
<if test=" '@isContinue'=='t' ">
    and DNSPA01 between to_date(#startTime#,'yyyymmddhh24miss') and to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and ORG_TIME in (#discteteTime#)
</if> 
<jdbcType name="discteteTime" type="array-date"/>


//新增互联网专线流量统计报表
<select id="tableChooseSE">    
     <if test=" '@timeType'=='week' ">ipmsdm.DM_DIA_MAN_IF_BANDWIDTH_W</if>
     <if test=" '@timeType'=='month' ">ipmsdm.DM_DIA_MAN_IF_BANDWIDTH_M</if>
</select>

<select id="resultMapping">
  --TIME_ID=时间 --TYPE=类型 --SYS_NAME=设备名称 --SYS_ALIAS_NAME=设备别名 --PORT_NAME=物理口名称 --PORT_ALIAS_NAME=物理口别名 --BANDWIDTH=带宽 --PEAK_IN_BANDWIDTH_UTILIZATION=流入峰值带宽利用率(%) --PEAK_OUT_BANDWIDTH_UTILIZATION=流出峰值带宽利用率(%) --PEAK_IN_OCCURRENCE_TIME=流入峰值发生时间 --PEAK_OUT_OCCURRENCE_TIME=流出峰值发生时间 --PEAK_IN_FLOW_RATE=流入峰值速率(Mbps) --PEAK_OUT_FLOW_RATE=流出峰值速率(Mbps) --MEAN_IN_FLOW_RATE=流入均值速率(Mbps) --MEAN_OUT_FLOW_RATE=流出均值速率(Mbps)
</select>
select 
      <if3 test=" '@timeType'=='week' "> to_char(to_date(substr(to_char(time_id),0,8),'yyyy-mm-dd'),'yyyy-iw') || '周' as TIME_ID,</if3>
       <if1 test=" '@timeType'=='month' "> to_char(to_date(substr(to_char(time_id),0,8),'yyyy-mm-dd'),'yyyy-MM') || '月' as TIME_ID,</if1>
       
  TYPE,
  SYS_NAME,
  SYS_ALIAS_NAME,
  PORT_NAME,
  PORT_ALIAS_NAME,
  BANDWIDTH,
  round(PEAK_IN_BANDWIDTH_UTILIZATION,2) PEAK_IN_BANDWIDTH_UTILIZATION,
  round(PEAK_OUT_BANDWIDTH_UTILIZATION,2) PEAK_OUT_BANDWIDTH_UTILIZATION,
  to_char(PEAK_IN_OCCURRENCE_TIME, 'yyyy-mm-dd HH:MM:SS') PEAK_IN_OCCURRENCE_TIME,
  to_char(PEAK_OUT_OCCURRENCE_TIME, 'yyyy-mm-dd HH:MM:SS') PEAK_OUT_OCCURRENCE_TIME,
  round(PEAK_IN_FLOW_RATE,2) PEAK_IN_FLOW_RATE,
  round(PEAK_OUT_FLOW_RATE,2) PEAK_OUT_FLOW_RATE,
  round(MEAN_IN_FLOW_RATE,2) MEAN_IN_FLOW_RATE,
  round(MEAN_OUT_FLOW_RATE ,2) MEAN_OUT_FLOW_RATE
from <included id="tableChooseSE"/>  where 1=1
and TYPE='PTN'
<if test=" '@isContinue'=='f' ">
  <if5 test=" '@timeType'=='week' "> and to_char(to_date(substr(to_char(time_id),0,8),'yyyy-mm-dd'),'yyyyiw') in (#discteteTime#)</if5>
  <if6 test=" '@timeType'=='month' "> and  substr(to_char(TIME_ID),0,6) in (#discteteTime#)</if6>
</if>        
<jdbcType name="discteteTime" type="array-char">
    '@value'.substr(0,6)
</jdbcType>

