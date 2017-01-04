//设备端口流量统计报表
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


//9306电路流量表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大）
</select>

with tt as (select *
  from (select 
               <if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>
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
    and A.TIME_STAMP in to_date(#discteteTime#,'yyyymmddhh24miss')
</if> 
           and 1 = 1
           AND A.UUID = B.ID
         group by A.TIME_STAMP,
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
    and A.TIME_STAMP in to_date(#discteteTime#,'yyyymmddhh24miss')
</if> 
           and 1 = 1
           AND A.UUID = B.ID
         group by A.TIME_STAMP,
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
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计
</select>

select            <if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>
  B.SYS_NAME,                    
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
                 group by A.TIME_STAMP,
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


//MX960端口利用率统计报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大）
</select>





select 
 <if3 test=" '@timeType'=='min' "> to_char(TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>

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
  from ipmsdw.O_RM_DEVICE a, ipmsdw.O_RM_INTERFACE b, <included id="tableChooseSE"/> c
 WHERE a.ip_addr in
       ('117.135.110.1', '117.135.110.2', '117.135.110.3', '117.135.110.4')
   and a.device_id = b.device_id
   and b.if_alias is not null
   and a.device_id = c.device_uuid
   and b.id = c.uuid
   <if test=" '@isContinue'=='t' ">
    and TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
   order by  MAX_IF_IN_UTILITY desc,time_stamp 


//寰宇鸿通端口流量统计报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大）
</select>



SELECT *
  FROM (SELECT A.*, ROWNUM RN
          FROM (select 
                       <if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>

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
 
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN (select b.port_id from ipmsdw.o_sh_report_devicemodule a,ipmsdw.o_sh_report_user_port b
where a.module_id=b.module_id
and a.module_name='寰宇鸿通'  and a.creator='weihu1')
                 group by A.TIME_STAMP,
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
                 WHERE  1=1
<if test=" '@isContinue'=='t' ">
    and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
</if>
<if test=" '@isContinue'=='f' ">
    and timeid in to_date(#discteteTime#)
</if> 
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN (select b.port_id from ipmsdw.o_sh_report_devicemodule a,ipmsdw.o_sh_report_user_port b
where a.module_id=b.module_id
and a.module_name='寰宇鸿通'  and a.creator='weihu1')
                 group by A.TIME_STAMP,
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


 //城域网互联链路带宽利用率超阈值报表
 <select id="tableChooseSE">
     <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
     <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
     <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
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
                   and timeid in to_date(#discteteTime#)
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
               and timeid in to_date(#discteteTime#)
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
                  and timeid in to_date(#discteteTime#)
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
                   and timeid in to_date(#discteteTime#)
               </if>  
              order by TIME_STAMP, IF_IN_UTILITY desc,IF_OUT_UTILITY desc ,CITY, SYS_NAME 



//CAP平台腾讯、奇虎流量报表
<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
    <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
    <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
</select>

<select id="resultMapping">
    --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大） --IF_SPEED=采集的接口速率 --IF_DESCR=接口描述 --
</select>



WITH TT AS (
select 
case when instr(B.IF_ALIAS,'QiHu')>0 then '奇虎' else '腾讯' end as SHEET,
<if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
       <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
       <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>


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
                   AND A.UUID = B.ID
                   and c.id = a.uuid
                   AND B.ID IN ('33d18fcf6fb87066e86a5aafe520a917',
                          '32e9aec6a44174b39ed4ee04d298c317',
                          '686216c1a2684025ba5fb36dffcafc54',
                          '32076aad8c17645db547da01762f168e',
                          '205e1a83b1116ace030e4f74b1109b4c',
                          'f09b5284b8714eea0273aea861463de0')
                 group by A.TIME_STAMP,
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
    <select id="tableChooseSE">
        <if test=" '@timeType'=='min' ">ipmsdw.DW_FT_RE_ST_INTERFACE_5M</if>
        <if test=" '@timeType'=='hour' ">ipmsdw.DW_FT_RE_ST_INTERFACE_H</if>
        <if test=" '@timeType'=='day' ">ipmsdw.DW_FT_RE_ST_INTERFACE_D</if>
    </select>

    <select id="resultMapping">
        --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大） --IF_SPEED=采集的接口速率 --IF_DESCR=接口描述 --
    </select>




    select            
    <if3 test=" '@timeType'=='min' "> to_char(A.TIME_STAMP,'yyyy-MM-dd HH24:mi:ss') as TIME_STAMP,</if3>
           <if1 test=" '@timeType'=='hour' "> to_char(a.time_stamp,'yyyy-mm-dd hh24') as TIME_STAMP,</if1>
           <if4 test=" '@timeType'=='day' ">to_char(a.time_stamp,'yyyy-mm-dd') as TIME_STAMP,</if4>

    B.SYS_NAME,
                     
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
                         WHERE  1=1
    <if test=" '@isContinue'=='t' ">
        and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
    <if test=" '@isContinue'=='f' ">
        and timeid in to_date(#discteteTime#)
    </if>

                           AND A.UUID = B.ID
                           and c.id = a.uuid
                           AND B.ID IN ('6ba3b9abc7dd1542cb2b387765805e27','b83223255d50eb19dd37942c32daf2b9')
                         group by A.TIME_STAMP,
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
                         WHERE  1=1
    <if test=" '@isContinue'=='t' ">
        and A.TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
    <if test=" '@isContinue'=='f' ">
        and timeid in to_date(#discteteTime#)
    </if>

                           AND A.UUID = B.ID
                           and c.id = a.uuid
                           AND B.ID IN ('6ba3b9abc7dd1542cb2b387765805e27','b83223255d50eb19dd37942c32daf2b9')
                         group by A.TIME_STAMP ,
                                  B.CITY,
                                  B.SYS_NAME,
                                  B.IP_ADDR,
                                  B.IF_NAME,
                                  B.IF_ALIAS,
                                  B.INTERFACE_IP_ADDR,
                                  c.if_speed
                           order by time_stamp,if_name 



//城域网大颗粒带宽利用率超阈值报表
<select id="resultMapping">
        --TIME_STAMP=时间 --CITY=地市 --SYS_NAME=系统名称 --IP_ADDR=IP地址 --IF_NAME=SRVCC切入接受次数 --IF_ALIAS=SRVCC切入接受率(%) --INTERFACE_IP_ADDR=SRVCC切入完成次数 --DAIKUAN=SRVCC切入完成率(%) --IF_OUT_UTILITY=接口流出利用率 --MAX_IF_OUT_UTILITY=接口流出利用率（最大） --IF_IN_DISCARDS=接口流入丢包率 --IF_IN_UNKOWN_PT=接口流入未知协议率 --IF_OUT_TRAFFIC=接口流出速率 --MAX_IF_OUT_TRAFFIC=接口流出速率（最大） --IF_OUT_NUCAST=接口流出非单波比率 --IF_OUT_UCAST=接口流出单波比率 --IF_IN_TRAFFIC=接口流入速率 --MAX_IF_IN_TRAFFIC=接口流入速率（最大） --IF_IN_UTILITY=接口流入利用率 --MAX_IF_IN_UTILITY=接口流入利用率（最大） --LIURUZIJ=流入总计 --LIUCUZIJ=流出总计 --MAX_IF_IN_DISCARDS=接口流入丢包率（最大） --IF_IN_ERROR=接口流入错包率 --MAX_IF_IN_ERROR=接口流入错包率（最大） --IF_OUT_DISCARDS=接口流出丢包率 --MAX_IF_OUT_DISCARDS=接口流出丢包率（最大） --IF_OUT_ERROR=接口流出错包率 --MAX_IF_OUT_ERROR=接口流出错包率（最大） --IF_SPEED=采集的接口速率 --IF_DESCR=接口描述 --
    </select>


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
 where 1=1
<if test=" '@isContinue'=='t' ">
        and TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
<if test=" '@isContinue'=='f' ">
        and time_stamp in  to_date(#discteteTime#,'yyyymmddhh24miss')
    </if>
 and data_type='PTN' ORDER BY SYS_NAME desc
 ) T1,
(SELECT SYS_NAME,
  ROWNUM NUMS 
 FROM 
 (SELECT DISTINCT replace(SYS_NAME,'.sh.cnmobile.net','') sys_name 
  FROM ipmsdw.v_o_cmnet_ptn_mstp_kpi_day 
  where 1=1
<if test=" '@isContinue'=='t' ">
        and TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
<if test=" '@isContinue'=='f' ">
        and time_stamp in to_date(#discteteTime#,'yyyymmddhh24miss')
    </if>
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
 where 1=1
<if test=" '@isContinue'=='t' ">
        and TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
<if test=" '@isContinue'=='f' ">
        and time_stamp in to_date(#discteteTime#,'yyyymmddhh24miss')
    </if>

 and data_type='MSTP' ORDER BY SYS_NAME desc
 ) T1,
(SELECT SYS_NAME,ROWNUM NUMS 
  FROM 
  (SELECT DISTINCT replace(SYS_NAME,'.sh.cnmobile.net','') sys_name 
    FROM ipmsdw.v_o_cmnet_ptn_mstp_kpi_day  
     where 1=1
<if test=" '@isContinue'=='t' ">
        and TIME_STAMP between to_date(#startTime#,'yyyymmddhh24miss') and  to_date(#endTime#,'yyyymmddhh24miss')
    </if>
<if test=" '@isContinue'=='f' ">
        and time_stamp in to_date(#discteteTime#,'yyyymmddhh24miss')
    </if>
    and data_type='MSTP' ORDER BY SYS_NAME)) T2
 WHERE T1.SYS_NAME=T2.SYS_NAME
