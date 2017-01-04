<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.O_RE_ST_DNS_BUSINESS_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_DNS_BUSINESS_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_DNS_BUSINESS_D</if>   
 </select>

<select id="resultMapping">
  --DNSPA01=时间 --DNSPA03=DNS服务器IP --DNSPA04=用户解析成功数 --DNSPA05=系统解析成功数 --DNSPA06=失败数 --DNSPA07=递归请求查询数 --DNSPA08=非递归查询数 --DNSPA09=总请求数 --DNSPA10=查询频率 --DNSPA11=系统解析成功率 --DNSPA12=用户解析成功率 --DNSPA13=平均时延

  </select>
select * from (
     select  
     <if1 test=" '@timeType'=='min' ">to_char(DNSPA01,'yyyy-MM-dd hh24:mi:ss') DNSPA01,</if1>
     <if2 test=" '@timeType'=='hour' ">to_char(DNSPA01,'yyyy-MM-dd hh24') DNSPA01,</if2>
     <if3 test=" '@timeType'=='day' ">to_char(DNSPA01,'yyyy-MM-dd') DNSPA01,</if3>   

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

)


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


//EPC防火墙
<select id="tableChooseSE">    
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_EPC_FIREWALL_15M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_EPC_FIREWALL_H</if> 
</select>

<select id="resultMapping">
  --STAT_TIME=时间 --NODE_DESC=防火墙名称 --FPC_SLOT=FPC槽位 --SPU_INDEX=SPU位置 --CPU_UTIL=CPU利用率(%) --MEMORYUSAGE=内存利用率(%)
</select>
select 
<if2 test=" '@timeType'=='min' "> to_char(STAT_TIME,'yyyy-MM-dd HH24:mi:ss') as STAT_TIME,</if2>
<if1 test=" '@timeType'=='hour' "> to_char(STAT_TIME,'yyyy-mm-dd hh24') as STAT_TIME,</if1>

  NODE_DESC NODE_DESC,
  FPC_SLOT FPC_SLOT,
  SPU_INDEX SPU_INDEX,
  round(CPU_UTIL,2) CPU_UTIL,
  round(MEMORYUSAGE,2) MEMORYUSAGE
from <included id="tableChooseSE"/> where 1=1 
<if test=" '@isContinue'=='f' ">
  and to_char(STAT_TIME,'yyyyMMddHH24mi') in (#discteteTime#)
</if>
<jdbcType name="discteteTime" type="array-char">
  '@value'.substr(0,12)
</jdbcType>