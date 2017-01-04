<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入字节(MB) --LIUCUZIJ=流出字节(MB) --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大） --IF_SPEED=采集的接口速率 --IF_DESCR=接口描述 --
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