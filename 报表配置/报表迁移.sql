--资源-分业务分设备类型统计表
execute P_GetDataByPage @isneedPaging = 0, @TableName = 'nhm.dbo.V_Simplified_Device', @Columns = 'CITY,SERVICE,count(TYPENAME) countTYPENAME',@WhereClause = 'WHERE 1=1 ', @OrderByClause = 'group by CITY,SERVICE, TYPENAME order by CITY ,SERVICE ,TYPENAME ASC',  @PageSize = 800000,  @CurrentPage = 1


select t.CITY,t.SERVICE,t.TYPENAME,count(*) from ipmsdw.V_O_Simplified_Device  t group by  t.CITY,t.SERVICE,t.TYPENAME

--资源-分业务分地市设备统计表
execute P_GetDataByPage @isneedPaging = 0, @TableName = 'nhm.dbo.V_Simplified_Device', @Columns = 'CITY,SERVICE,count(TYPENAME) countTYPENAME',@WhereClause = 'WHERE 1=1 ', @OrderByClause = 'group by CITY,SERVICE, TYPENAME order by CITY ,SERVICE ,TYPENAME ASC',  @PageSize = 800000,  @CurrentPage = 1 


select t.CITY,t.SERVICE,t.TYPENAME,count(*) from ipmsdw.V_O_Simplified_Device  t group by  t.CITY,t.SERVICE,t.TYPENAME
--资源-分地市分业务设备统计表
execute P_GetDataByPage @isneedPaging = 0, @TableName = 'nhm.dbo.V_Simplified_Device ', @Columns = 'CITY,SERVICE, TYPENAME, count(TYPENAME) countTYPENAME ', @WhereClause = 'WHERE  1=1    ', @OrderByClause = 'group by CITY,SERVICE,TYPENAME order by CITY ASC,SERVICE ASC,TYPENAME ASC ', @PageSize = 800000,  @CurrentPage = 1 

select t.CITY,t.SERVICE,t.TYPENAME,count(*) from ipmsdw.V_O_Simplified_Device  t group by  t.CITY,t.SERVICE,t.TYPENAME
--CMNET设备资源占用情况报表
select decode(city, null, '合计', city) city,sys_name,ip_addr,if_nums,used_if_nums,rate from ( select a.city ,a.sys_name,a.ip_addr,count(*) if_nums,     sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end) used_if_nums, case when count(*)=0 then 0 else ROUND(sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end)/count(*)*100,2) end rate from IPMSDW.O_RM_DEVICE a,IPMSDW.O_RM_INTERFACE b  where a.device_id = b.device_id  and  b.device_id IN ('8a5d92aa53e5057b0153e941b2870005')   and not regexp_like(b.if_name, '[(\.)|(Vl)]')  and city is not null  group by rollup((a.city,b.device_id,a.sys_name,a.ip_addr))  order by city nulls last, a.sys_name )


select decode(city, null, '合计', city) city,sys_name,ip_addr,if_nums,used_if_nums,rate from ( select a.city ,a.sys_name,a.ip_addr,count(*) if_nums,     sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end) used_if_nums, case when count(*)=0 then 0 else ROUND(sum(case when if_admin_status=1 and if_oper_status=1 then 1 else 0 end)/count(*)*100,2) end rate 
from IPMSDW.O_RM_DEVICE a,IPMSDW.O_RM_INTERFACE b  
where a.device_id = b.device_id  and  b.device_id IN ('8a5d92aa53e5057b0153e941b2870005')   and not regexp_like(b.if_name, '[(\.)|(Vl)]')  and city is not null  group by rollup((a.city,b.device_id,a.sys_name,a.ip_addr))  order by city nulls last, a.sys_name )


--资源的几个统计报表，用这个表

select * from ipmsdw.V_O_Simplified_Device  t group by  t.CITY,t.SERVICE,t.TYPENAME


select  trunc(sysdate,'mi')  from dual;



--用户群-运营商解析次数统计
select TIMEID,UG,TOTAL,SN,REQ,CLICK_RATE from ( select a.*,row_number() over (order by timeid,ug) as rn  from
 (select t1.timeid/10000 timeid,t1.USER_GROUP ug,t2.total,t1.SUPPLIER_NAME sn,t1.req,t1.req*1.0 / t2.total*100  click_rate 
from (select timeid,user_group,SUPPLIER_NAME,sum(request_cnt) as req from DM_DNSLOG_UG_D where timeid=to_char(trunc(sysdate-2),'yyyymmdd')||'0000' 
group by timeid,user_group,SUPPLIER_NAME) t1, (select timeid,user_group,sum(request_cnt) as total from DM_DNSLOG_UG_D where 
timeid=to_char(trunc(sysdate-2),'yyyymmdd')||'0000' group by timeid,user_group) t2 where t1.timeid=t2.timeid and t1.user_group=t2.user_group) a ) b  where b.rn > @start and b.rn<=@end;


select 
to_char(to_date(timeid,'yyyymmddhh24miss'),'yyyy-mm-dd') as TIMEID,
UG,TOTAL,SN,REQ,CLICK_RATE from ( select a.*,row_number() over (order by timeid,ug) as rn  
from
 (select t1.timeid timeid,t1.USER_GROUP ug,t2.total,t1.SUPPLIER_NAME sn,t1.req,t1.req*1.0 / t2.total*100  click_rate 
from (select timeid,user_group,SUPPLIER_NAME,sum(request_cnt) as req from ipmsdm.DM_DNSLOG_UG_D where timeid=to_char(trunc(sysdate-2),'yyyymmdd')||'0000' 
group by timeid,user_group,SUPPLIER_NAME) t1, (select timeid,user_group,sum(request_cnt) as total from ipmsdm.DM_DNSLOG_UG_D where 
timeid=to_char(trunc(sysdate-2),'yyyymmdd')||'0000' group by timeid,user_group) t2 where t1.timeid=t2.timeid and t1.user_group=t2.user_group) a ) b



--用户群解析TOPN排名
select TIMEID,UG,SN,DN,IP,REQ,TOTAL from ( select a.*,row_number() over (order by timeid,ug,sn,req desc) as rn  
from (SELECT TIMEID/10000 TIMEID,UG,SN,DN,IP,REQ,TOTAL FROM (select RANK() 
OVER(PARTITION BY UG,SN ORDER BY REQ DESC) RNMM,TIMEID,UG,SN,DN,IP,REQ,TOTAL from 
DM_DNSLOG_UG_D_report where timeid=to_char(trunc(sysdate-2),'yyyymmdd')||'0000' ) T WHERE RNMM <= 2000 ORDER BY UG,SN) a ) b where b.rn > @start and b.rn<=@end ; 

--移动手机用户内网点击率
  select cast(cast(str(T1.TIMEID/10000) as date) as char(10))  STARTTIME,
       t1.USER_GROUP UG,
       t2.total TOTAL,
       t1.SUPPLIER_NAMES SN,
       t1.req REQ,
       ROUND(t1.req * 1.0 / t2.total * 100,2) RATE
  from (select timeid,
               user_group,
               SUPPLIER_NAME AS SUPPLIER_NAMES,
               sum(request_cnt) as req
          from DM_DNSLOG_UG_D 
         where timeid =cast(convert(char,dateadd(dd,-2,getdate()),112) as int)*10000
           AND USER_GROUP in( 'GPRS（2/3G）','LTE（4G）')
           AND SUPPLIER_NAME IN ('电信', '联通', '其它')
         group by timeid, user_group, SUPPLIER_NAME
        UNION ALL
        SELECT timeid,
               user_group,
               '移动' SUPPLIER_NAMES,
               SUM(request_cnt) AS req
          FROM DM_DNSLOG_UG_D
         WHERE timeid=cast(convert(char,dateadd(dd,-2,getdate()),112) as int)*10000
           AND USER_GROUP in( 'GPRS（2/3G）','LTE（4G）')
           AND SUPPLIER_NAME IN ('移动直连', '铁通', '移动')
         GROUP BY timeid, user_group) t1,
       (select timeid, user_group, sum(request_cnt) as total
          from DM_DNSLOG_UG_D
         where timeid=cast(convert(char,dateadd(dd,-2,getdate()),112) as int)*10000
           AND USER_GROUP in( 'GPRS（2/3G）','LTE（4G）')
         group by timeid, user_group) t2
 where t1.timeid = t2.timeid
   and t1.user_group = t2.user_group    
   
   
   --------------------------------------------------
   
   select timeid,
               user_group,
               case when SUPPLIER_NAME IN ('移动直连', '铁通', '移动') then '移动' else SUPPLIER_NAME end as SUPPLIER_NAMES,
               sum(request_cnt) as req
          from ipmsdm.DM_DNSLOG_UG_D
         where timeid ='201608160000'
           AND USER_GROUP in( 'GPRS（2/3G）','LTE（4G）')
           AND SUPPLIER_NAME IN ('电信', '联通', '其它','移动直连', '铁通', '移动')
         group by timeid, user_group, case when SUPPLIER_NAME IN ('移动直连', '铁通', '移动') then '移动' else SUPPLIER_NAME end

   
   
   
 select * from ipmsdm.DM_DNSLOG_UG_D;
   
 
 select t1.timeid/10000 timeid,t1.USER_GROUP ug,t2.total,t1.SUPPLIER_NAMES sn,t1.req,t1.req*1.0 / t2.total*100  click_rate from (select timeid,user_group,SUPPLIER_NAME AS SUPPLIER_NAMES,sum(request_cnt) as req 
 from ipmsdm.DM_DNSLOG_UG_D 
 where timeid in(201608110000) AND USER_GROUP = 'GPRS（2/3G）' AND SUPPLIER_NAME IN ('电信','联通','其它')  group by timeid,user_group,SUPPLIER_NAME  
 UNION ALL SELECT timeid,user_group,'移动' SUPPLIER_NAMES,SUM(request_cnt) AS req 
 FROM ipmsdm.DM_DNSLOG_UG_D 
 WHERE timeid in(201608110000) AND USER_GROUP = 'GPRS（2/3G）' AND SUPPLIER_NAME IN ('移动直连','铁通','移动') GROUP BY timeid,user_group ) t1, (select timeid,user_group,sum(request_cnt) as total 
 from ipmsdm.DM_DNSLOG_UG_D 
 where timeid in(201608110000) AND USER_GROUP = 'GPRS（2/3G）'  group by timeid,user_group) t2 where t1.timeid=t2.timeid and t1.user_group=t2.user_group
   
   
---DCHP   
--1   
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') kpi1,round(MemUtil,2) kpi2,displayName kpi3  from ipmsdw.O_RE_ST_DHCP_02_5M  
 where  Dttm >= to_date('2016-06-22 16:40:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-06-22 16:40:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 


--2
select to_char(Dttm,'yyyy-MM-dd HH24:mi:ss') kpi1,round(dhcpSubnetPctUsed,2) kpi2,displayName kpi3  from ipmsdw.O_RE_ST_DHCP_03   
where  Dttm >= to_date('2016-07-27 22:30:00','yyyy-MM-dd HH24:mi:ss') and  Dttm <= to_date('2016-07-27 22:30:59','yyyy-MM-dd HH24:mi:ss') and  1= 1
 
--3 
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') kpi1,QrySuccess kpi2,QrySERVFAIL kpi3,QryFORMERR kpi4,QryNXDOMAIN kpi5,QryRecursion kpi6,QryFailure kpi7  from ipmsdw.O_RE_ST_DHCP_06_5M  
where  Dttm >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 

--4
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') kpi1,round(CpuUtil,2) kpi2,displayName kpi3  from ipmsdw.O_RE_ST_DHCP_01_5M    
where  Dttm >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1

--5
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') kpi1,AuthRespTime kpi2,NonAuthRespTime kpi3,RespTime kpi4,displayName kpi5  from ipmsdw.O_RE_ST_DHCP_05_5M  
where  Dttm >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 

--6
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') Dttm,round(INOCTETS,2) INOCTETS,round(OUTOCTETS,2) OUTOCTETS,displayName   from ipmsdw.O_RE_ST_DHCP_07  
where  Dttm >= to_date('2016-06-22 01:00:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-06-22 01:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1

--7
select to_char(trunc(Dttm,'mi'),'yyyy-MM-dd HH24:mi:ss') Dttm,dhcpServiceStatus,dhcpRspTime,dhcpDiscovers,dhcpRequests,dhcpReleases,dhcpDeclines,dhcpOffers,dhcpAcks,displayName  from ipmsdw.O_RE_ST_DHCP_04_5M  
where  Dttm >= to_date('2016-06-22 16:00:00','yyyy-MM-dd HH24:mi:ss') and  Dttm < to_date('2016-06-22 16:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1


--mms业务KPI统计组
select 
to_char(START_TIME,'yyyy-MM-dd') START_TIME1,SERVICE_IP, MMS_SEND_NUM,MMS_TOP_NUM,MMS_REGISTER_USER_NUM,USE_MMS_USER_NUM,MMS_ALBUM_NUM,MMS_ALBUM_SUCC_NUM,round(MMS_ALBUM_SUCC_RATIO,2)  MMS_ALBUM_SUCC_RATIO2,MMS_SUBMIT_NUM_2,MMS_DELV_NUM_2,MMS_NETWOER_SUBMIT_FAIL_NUM,MMS_USER_SUBMIT_FAIL_NUM,MMS_NETWORK_DELV_FAIL_NUM,MMS_USER_DELV_FAIL_NUM,round(MMS_TOTAL_NETWORK_SUCC_RATIO,2)  MMS_TOTAL_NETWORK_SUCC_RATIO2,round(MMS_TOTAL_USER_SUCC_RATIO,2)  MMS_TOTAL_USER_SUCC_RATIO2,round(MMS_TOTAL_SUCC_RAIO,2)  MMS_TOTAL_SUCC_RAIO  
 from ipmsdw.O_RE_ST_MMS_KPI_D  
 WHERE   START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
 and SERVICE_IP in ('TD_SH_MMS_HW','@ip1')  
 union all 
 select '合计' START_TIME1 , '---' SERVICE_IP,sum(MMS_SEND_NUM) MMS_SEND_NUM,sum(MMS_TOP_NUM) MMS_TOP_NUM,sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,sum(MMS_ALBUM_NUM) MMS_ALBUM_NUM,sum(MMS_ALBUM_SUCC_NUM) MMS_ALBUM_SUCC_NUM,round(avg(MMS_ALBUM_SUCC_RATIO),2)  MMS_ALBUM_SUCC_RATIO2,sum(MMS_SUBMIT_NUM_2) MMS_SUBMIT_NUM_2,sum(MMS_DELV_NUM_2) MMS_DELV_NUM_2,sum(MMS_NETWOER_SUBMIT_FAIL_NUM) MMS_NETWOER_SUBMIT_FAIL_NUM,sum(MMS_USER_SUBMIT_FAIL_NUM) MMS_USER_SUBMIT_FAIL_NUM,sum(MMS_NETWORK_DELV_FAIL_NUM) MMS_NETWORK_DELV_FAIL_NUM,sum(MMS_USER_DELV_FAIL_NUM) MMS_USER_DELV_FAIL_NUM,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then 100*sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_NETWOER_SUBMIT_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end),2)  MMS_TOTAL_NETWORK_SUCC_RATIO2,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM-MMS_ALBUM_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end)*100,2)   MMS_TOTAL_USER_SUCC_RATIO2,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2)  else 0 end)*100,2)  MMS_TOTAL_SUCC_RAIO    
 from ipmsdw.O_RE_ST_MMS_KPI_D 
  WHERE   START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 and SERVICE_IP in ('TD_SH_MMS_HW','@ip1') order by START_TIME1,SERVICE_IP 
---------
select 
to_char(START_TIME,'yyyy-MM-dd') START_TIME1,SERVICE_IP, MMS_SEND_NUM,MMS_TOP_NUM,MMS_REGISTER_USER_NUM,USE_MMS_USER_NUM,MMS_ALBUM_NUM,MMS_ALBUM_SUCC_NUM,round(MMS_ALBUM_SUCC_RATIO,2)  MMS_ALBUM_SUCC_RATIO2,MMS_SUBMIT_NUM_2,MMS_DELV_NUM_2,MMS_NETWOER_SUBMIT_FAIL_NUM,MMS_USER_SUBMIT_FAIL_NUM,MMS_NETWORK_DELV_FAIL_NUM,MMS_USER_DELV_FAIL_NUM,round(MMS_TOTAL_NETWORK_SUCC_RATIO,2)  MMS_TOTAL_NETWORK_SUCC_RATIO2,round(MMS_TOTAL_USER_SUCC_RATIO,2)  MMS_TOTAL_USER_SUCC_RATIO2,round(MMS_TOTAL_SUCC_RAIO,2)  MMS_TOTAL_SUCC_RAIO  
 from ipmsdw.O_RE_ST_MMS_KPI_D  where 1=1
and SERVICE_IP in ('TD_SH_MMS_HW','@ip1')  
 union all 
 select '合计' START_TIME1 , '---' SERVICE_IP,sum(MMS_SEND_NUM) MMS_SEND_NUM,sum(MMS_TOP_NUM) MMS_TOP_NUM,sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,sum(MMS_ALBUM_NUM) MMS_ALBUM_NUM,sum(MMS_ALBUM_SUCC_NUM) MMS_ALBUM_SUCC_NUM,round(avg(MMS_ALBUM_SUCC_RATIO),2)  MMS_ALBUM_SUCC_RATIO2,sum(MMS_SUBMIT_NUM_2) MMS_SUBMIT_NUM_2,sum(MMS_DELV_NUM_2) MMS_DELV_NUM_2,sum(MMS_NETWOER_SUBMIT_FAIL_NUM) MMS_NETWOER_SUBMIT_FAIL_NUM,sum(MMS_USER_SUBMIT_FAIL_NUM) MMS_USER_SUBMIT_FAIL_NUM,sum(MMS_NETWORK_DELV_FAIL_NUM) MMS_NETWORK_DELV_FAIL_NUM,sum(MMS_USER_DELV_FAIL_NUM) MMS_USER_DELV_FAIL_NUM,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then 100*sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_NETWOER_SUBMIT_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end),2)  MMS_TOTAL_NETWORK_SUCC_RATIO2,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM-MMS_ALBUM_NUM)/sum(MMS_SUBMIT_NUM_2) else 0 end)*100,2)   MMS_TOTAL_USER_SUCC_RATIO2,round((case when sum(MMS_SUBMIT_NUM_2)!=0 then sum(MMS_SUBMIT_NUM_2-MMS_NETWOER_SUBMIT_FAIL_NUM-MMS_USER_SUBMIT_FAIL_NUM-MMS_NETWORK_DELV_FAIL_NUM-MMS_USER_DELV_FAIL_NUM)/sum(MMS_SUBMIT_NUM_2)  else 0 end)*100,2)  MMS_TOTAL_SUCC_RAIO    
 from ipmsdw.O_RE_ST_MMS_KPI_D 
 
 
 --TD_MMS   
 select 
 to_char(START_TIME,'yyyy-MM-dd') START_TIME, SUBMIT_NUM,NETWOER_SUBMIT_FAIL,USER_SUBMIT_FAIL,NETWORK_DELV_FAIL,USER_DELV_FAIL,ratio*100 ratio 
 from V_MMS_KPI_RARIO 
 WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1  
 union all select '合计' START_TIME, SUM(SUBMIT_NUM)SUBMIT_NUM,SUM(NETWOER_SUBMIT_FAIL)NETWOER_SUBMIT_FAIL,SUM(USER_SUBMIT_FAIL)USER_SUBMIT_FAIL,SUM(NETWORK_DELV_FAIL)NETWORK_DELV_FAIL,SUM(USER_DELV_FAIL)USER_DELV_FAIL,  CASE WHEN SUM(SUBMIT_NUM)=0 THEN 0 ELSE  ROUND(SUM(SUBMIT_NUM-NETWOER_SUBMIT_FAIL-USER_SUBMIT_FAIL-NETWORK_DELV_FAIL-USER_DELV_FAIL)/SUM(SUBMIT_NUM) * 100, 2) END ratio 
 from V_MMS_KPI_RARIO 
 WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1  ORDER BY START_TIME 
------
 select 
 to_char(START_TIME,'yyyy-MM-dd') START_TIME, SUBMIT_NUM,NETWOER_SUBMIT_FAIL,USER_SUBMIT_FAIL,NETWORK_DELV_FAIL,USER_DELV_FAIL,ratio*100 ratio 
 from V_MMS_KPI_RARIO 
  union all select '合计' START_TIME, SUM(SUBMIT_NUM)SUBMIT_NUM,SUM(NETWOER_SUBMIT_FAIL)NETWOER_SUBMIT_FAIL,SUM(USER_SUBMIT_FAIL)USER_SUBMIT_FAIL,SUM(NETWORK_DELV_FAIL)NETWORK_DELV_FAIL,SUM(USER_DELV_FAIL)USER_DELV_FAIL,  CASE WHEN SUM(SUBMIT_NUM)=0 THEN 0 ELSE  ROUND(SUM(SUBMIT_NUM-NETWOER_SUBMIT_FAIL-USER_SUBMIT_FAIL-NETWORK_DELV_FAIL-USER_DELV_FAIL)/SUM(SUBMIT_NUM) * 100, 2) END ratio 
 from V_MMS_KPI_RARIO 


select * from ipmsdw.V_O_MMS_KPI_RARIO

select * from O_RE_ST_MMS_KPI_D

--MMS业务量统计组
select  
to_char(START_TIME,'yyyy-MM-dd') START_TIME1,  SERVICE_IP,MMS_SEND_NUM,MMS_TOP_NUM,MMS_REGISTER_USER_NUM, USE_MMS_USER_NUM, busy_time_am,busy_time_am_mms_num,busy_time_pm,busy_time_pm_mms_num,BUSY_TIME_MMS_NUM,  TMNL_SUBMIT_MMS_NUM,TMNL_DELV_MMS_NUM,APPLY_SUBMIT_MMS_NUM,EML_SUBMIT_MMS_NUM,FWD_MMS_NUM,REC_FWD_MMS_NUM,TMNL_TMNL_NUM,TMNL_APP_NUM,TMNL_MAIL_NUM,NEWADD_MMS_REGISTER_USER_NUM,EMAIL_USE_USER_NUM,SP_USE_USER_NUM,FWD_DP_NUM   
from ipmsdw.O_RE_ST_MMS_BUSINESS_D  
WHERE   START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 and SERVICE_IP in ('TD_SH_MMS_HW','@ip1') 
union all select '合计' START_TIME1 ,  '---'  SERVICE_IP,sum(MMS_SEND_NUM) MMS_SEND_NUM,sum(MMS_TOP_NUM) MMS_TOP_NUM,sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,null busy_time_am,sum(busy_time_am_mms_num) busy_time_am_mms_num,null busy_time_pm,sum(busy_time_pm_mms_num) busy_time_pm_mms_num,sum(BUSY_TIME_MMS_NUM) BUSY_TIME_MMS_NUM,sum(TMNL_SUBMIT_MMS_NUM) TMNL_SUBMIT_MMS_NUM,sum(TMNL_DELV_MMS_NUM) TMNL_DELV_MMS_NUM,sum(APPLY_SUBMIT_MMS_NUM) APPLY_SUBMIT_MMS_NUM,sum(EML_SUBMIT_MMS_NUM) EML_SUBMIT_MMS_NUM,sum(FWD_MMS_NUM) FWD_MMS_NUM,sum(REC_FWD_MMS_NUM) REC_FWD_MMS_NUM,sum(TMNL_TMNL_NUM) TMNL_TMNL_NUM,sum(TMNL_APP_NUM) TMNL_APP_NUM,sum(TMNL_MAIL_NUM) TMNL_MAIL_NUM,sum(NEWADD_MMS_REGISTER_USER_NUM) NEWADD_MMS_REGISTER_USER_NUM,sum(EMAIL_USE_USER_NUM) EMAIL_USE_USER_NUM,sum(SP_USE_USER_NUM) SP_USE_USER_NUM,sum(FWD_DP_NUM) FWD_DP_NUM   
from ipmsdw.O_RE_ST_MMS_BUSINESS_D 
WHERE   START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 and SERVICE_IP in ('TD_SH_MMS_HW','@ip1') order by START_TIME1, SERVICE_IP

--
select  
to_char(START_TIME,'yyyy-MM-dd') START_TIME1,  SERVICE_IP,MMS_SEND_NUM,MMS_TOP_NUM,MMS_REGISTER_USER_NUM, USE_MMS_USER_NUM, busy_time_am,busy_time_am_mms_num,busy_time_pm,busy_time_pm_mms_num,BUSY_TIME_MMS_NUM,  TMNL_SUBMIT_MMS_NUM,TMNL_DELV_MMS_NUM,APPLY_SUBMIT_MMS_NUM,EML_SUBMIT_MMS_NUM,FWD_MMS_NUM,REC_FWD_MMS_NUM,TMNL_TMNL_NUM,TMNL_APP_NUM,TMNL_MAIL_NUM,NEWADD_MMS_REGISTER_USER_NUM,EMAIL_USE_USER_NUM,SP_USE_USER_NUM,FWD_DP_NUM   
from ipmsdw.O_RE_ST_MMS_BUSINESS_D 
union all select '合计' START_TIME1 ,  '---'  SERVICE_IP,sum(MMS_SEND_NUM) MMS_SEND_NUM,sum(MMS_TOP_NUM) MMS_TOP_NUM,sum(MMS_REGISTER_USER_NUM) MMS_REGISTER_USER_NUM,sum(USE_MMS_USER_NUM) USE_MMS_USER_NUM,null busy_time_am,sum(busy_time_am_mms_num) busy_time_am_mms_num,null busy_time_pm,sum(busy_time_pm_mms_num) busy_time_pm_mms_num,sum(BUSY_TIME_MMS_NUM) BUSY_TIME_MMS_NUM,sum(TMNL_SUBMIT_MMS_NUM) TMNL_SUBMIT_MMS_NUM,sum(TMNL_DELV_MMS_NUM) TMNL_DELV_MMS_NUM,sum(APPLY_SUBMIT_MMS_NUM) APPLY_SUBMIT_MMS_NUM,sum(EML_SUBMIT_MMS_NUM) EML_SUBMIT_MMS_NUM,sum(FWD_MMS_NUM) FWD_MMS_NUM,sum(REC_FWD_MMS_NUM) REC_FWD_MMS_NUM,sum(TMNL_TMNL_NUM) TMNL_TMNL_NUM,sum(TMNL_APP_NUM) TMNL_APP_NUM,sum(TMNL_MAIL_NUM) TMNL_MAIL_NUM,sum(NEWADD_MMS_REGISTER_USER_NUM) NEWADD_MMS_REGISTER_USER_NUM,sum(EMAIL_USE_USER_NUM) EMAIL_USE_USER_NUM,sum(SP_USE_USER_NUM) SP_USE_USER_NUM,sum(FWD_DP_NUM) FWD_DP_NUM   
from ipmsdw.O_RE_ST_MMS_BUSINESS_D  


--彩信成功率报表  ----找不到表  MMS_EXT_SH_SUCCRATE

SELECT 
SDATE,SERVICE_IP SERVICE_IP,sum(case when SCOLUMNNAME = '提交总数' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) a ,max(case when SCOLUMNNAME = '网络提交成功率' THEN TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) b ,max(case when SCOLUMNNAME = '端到端成功率' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) c ,max(case when SCOLUMNNAME = '点到点下发数' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) d ,max(case when SCOLUMNNAME = '点到点成功率' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) e ,max(case when SCOLUMNNAME = '点到点业务占比' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) f ,sum(case when SCOLUMNNAME = '3401' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) g,sum(case when SCOLUMNNAME = '3402' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) h,sum(case when SCOLUMNNAME = '4300' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) i,sum(case when SCOLUMNNAME = '6001' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) j,sum(case when SCOLUMNNAME = '6003' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) k,sum(case when SCOLUMNNAME = '6303' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) l,sum(case when SCOLUMNNAME = 'SP到点下发数' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) m ,max(case when SCOLUMNNAME = 'SP到点成功率' THEN   TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) n  ,max(case when SCOLUMNNAME = 'SP到点业务占比' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) o ,sum(case when SCOLUMNNAME = '4441' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) p,sum(case when SCOLUMNNAME = '4442' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) q,sum(case when SCOLUMNNAME = '4444' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) r,sum(case when SCOLUMNNAME = '4770' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) s,sum(case when SCOLUMNNAME = '1000' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) t  
FROM ipmsdw.MMS_EXT_SH_SUCCRATE 
where   to_date(sdate,'YYYY-MM-DD HH24:mi:ss') >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
and SERVICE_IP in ('TD_SH_MMS_HW') group by  SDATE,SERVICE_IP 
union all 
select '合计' as SDATE,'---' as SERVICE_IP,SUM(a) a,ROUND(avg(b),2)  b,ROUND(sum(c*a)/sum(a),2) c,SUM(d) d,ROUND(avg(e),2)  e,ROUND(avg(f),2)  f,SUM(g) g,SUM(h) h,SUM(i) i,SUM(j) j,SUM(k) k,SUM(l) l,SUM(m) m,ROUND(avg(n),2) n,ROUND(avg(o),2) o,SUM(p) p,SUM(q) q,SUM(r) r,SUM(s) s,SUM(t) t 
from (SELECT SDATE,SERVICE_IP SERVICE_IP,sum(case when SCOLUMNNAME = '提交总数' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) a ,max(case when SCOLUMNNAME = '网络提交成功率' THEN TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) b ,max(case when SCOLUMNNAME = '端到端成功率' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) c ,max(case when SCOLUMNNAME = '点到点下发数' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) d ,max(case when SCOLUMNNAME = '点到点成功率' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) e ,max(case when SCOLUMNNAME = '点到点业务占比' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) f ,sum(case when SCOLUMNNAME = '3401' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) g,sum(case when SCOLUMNNAME = '3402' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) h,sum(case when SCOLUMNNAME = '4300' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) i,sum(case when SCOLUMNNAME = '6001' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) j,sum(case when SCOLUMNNAME = '6003' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) k,sum(case when SCOLUMNNAME = '6303' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) l,sum(case when SCOLUMNNAME = 'SP到点下发数' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) m ,max(case when SCOLUMNNAME = 'SP到点成功率' THEN   TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) n  ,max(case when SCOLUMNNAME = 'SP到点业务占比' THEN  TO_NUMBER(REPLACE(scolumnvalue, '%')) ELSE 0 END ) o ,sum(case when SCOLUMNNAME = '4441' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) p,sum(case when SCOLUMNNAME = '4442' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) q,sum(case when SCOLUMNNAME = '4444' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) r,sum(case when SCOLUMNNAME = '4770' THEN to_number(SCOLUMNVALUE) ELSE 0 END ) s,sum(case when SCOLUMNNAME = '1000' THEN  to_number(SCOLUMNVALUE) ELSE 0 END ) t  
FROM ipmsdw.MMS_EXT_SH_SUCCRATE
 where   to_date(sdate,'YYYY-MM-DD HH24:mi:ss') >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
 and SERVICE_IP in ('TD_SH_MMS_HW') group by  SDATE,SERVICE_IP ) t order by SDATE,SERVICE_IP 


---


---重要sp成功率   ----找不到表  MMS_EXT_SH_SPRATE
select 
to_char(to_date(sdate,'YYYY-MM-DD HH24:mi:ss'),'yyyy-MM-dd') as SDATE,SERVICE_IP SERVICE_IP,sum(a)||'/'||ROUND(avg(a1),2) a,sum(b)||'/'||ROUND(avg(b1),2) b,sum(c)||'/'||ROUND(avg(c1),2) c, sum(d)||'/'||ROUND(avg(d1),2) d,sum(e)||'/'||ROUND(avg(e1),2) e, sum(f)||'/'||ROUND(avg(f1),2) f,sum(g)||'/'||ROUND(avg(g1),2) g, sum(h)||'/'||ROUND(avg(h1),2) h,sum(i)||'/'||ROUND(avg(i1),2) i, sum(j)||'/'||ROUND(avg(j1),2) j,sum(k)||'/'||ROUND(avg(k1),2) k, sum(l)||'/'||ROUND(avg(l1),2) l 
from ( SELECT SDATE,SERVICE_IP SERVICE_IP,sum(case when substr(SSPDESC,1,4) = '手机冲浪' THEN  to_number(IAOCOUNT) ELSE 0 END ) a ,max(case when substr(SSPDESC,1,4) = '手机冲浪' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) a1 ,sum(case when substr(SSPDESC,1,4) = '手机阅读' THEN to_number(IAOCOUNT) ELSE 0 END ) b ,max(case when substr(SSPDESC,1,4) = '手机阅读' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) b1 ,sum(case when substr(SSPDESC,1,4) = '彩信账单' THEN to_number(IAOCOUNT) ELSE 0 END ) c ,max(case when substr(SSPDESC,1,4) = '彩信账单' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) c1 ,sum(case when substr(SSPDESC,1,4) = '手机商界' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) d ,max(case when substr(SSPDESC,1,4) = '手机商界' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) d1 ,sum(case when substr(SSPDESC,1,4) = '生活播报' THEN  to_number(IAOCOUNT) ELSE 0 END ) e ,max(case when substr(SSPDESC,1,4) = '生活播报' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) e1 ,sum(case when substr(SSPDESC,1,4) = '手机视频' THEN to_number(IAOCOUNT) ELSE 0 END ) f ,max(case when substr(SSPDESC,1,4) = '手机视频' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) f1 ,sum(case when substr(SSPDESC,1,4) = '新闻早晚' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) g,max(case when substr(SSPDESC,1,4) = '新闻早晚' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) g1 ,sum(case when substr(SSPDESC,1,4) = '集团行业' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) h,max(case when substr(SSPDESC,1,4) = '集团行业' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) h1 ,sum(case when substr(SSPDESC,1,4) = '广东网关' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) i,max(case when substr(SSPDESC,1,4) = '广东网关' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) i1 ,sum(case when substr(SSPDESC,1,4) = '1008' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) j,max(case when substr(SSPDESC,1,4) = '1008' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )j1 ,sum(case when substr(SSPDESC,1,4) = '移动手机' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END )k,max(case when substr(SSPDESC,1,4) = '移动手机' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )k1,sum(case when substr(SSPDESC,1,4) = '深圳奇迹' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) l,max(case when substr(SSPDESC,1,4) = '深圳奇迹' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )l1      
FROM ipmsdw.MMS_EXT_SH_SPRATE 
where  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
and SERVICE_IP in ('TD_SH_MMS_HW') group by  SDATE,SERVICE_IP)t group by to_char(to_date(sdate,'YYYY-MM-DD HH24:mi:ss'),'yyyy-MM-dd'),SERVICE_IP 
union all select '合计' as SDATE,'--' SERVICE_IP,sum(a)||'/'||ROUND(avg(a1),2) a,sum(b)||'/'||ROUND(avg(b1)) b,sum(c)||'/'||ROUND(avg(c1)) c, sum(d)||'/'||ROUND(avg(d1)) d,sum(e)||'/'||ROUND(avg(e1)) e, sum(f)||'/'||ROUND(avg(f1)) f,sum(g)||'/'||ROUND(avg(g1)) g, sum(h)||'/'||ROUND(avg(h1)) h,sum(i)||'/'||ROUND(avg(i1)) i, sum(j)||'/'||ROUND(avg(j1)) j,sum(k)||'/'||ROUND(avg(k1)) k, sum(l)||'/'||ROUND(avg(l1)) l 
from ( SELECT SDATE,SERVICE_IP SERVICE_IP,sum(case when substr(SSPDESC,1,4) = '手机冲浪' THEN  to_number(IAOCOUNT) ELSE 0 END ) a ,max(case when substr(SSPDESC,1,4) = '手机冲浪' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) a1 ,sum(case when substr(SSPDESC,1,4) = '手机阅读' THEN to_number(IAOCOUNT) ELSE 0 END ) b ,max(case when substr(SSPDESC,1,4) = '手机阅读' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) b1 ,sum(case when substr(SSPDESC,1,4) = '彩信账单' THEN to_number(IAOCOUNT) ELSE 0 END ) c ,max(case when substr(SSPDESC,1,4) = '彩信账单' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) c1 ,sum(case when substr(SSPDESC,1,4) = '手机商界' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) d ,max(case when substr(SSPDESC,1,4) = '手机商界' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) d1 ,sum(case when substr(SSPDESC,1,4) = '生活播报' THEN  to_number(IAOCOUNT) ELSE 0 END ) e ,max(case when substr(SSPDESC,1,4) = '生活播报' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) e1 ,sum(case when substr(SSPDESC,1,4) = '手机视频' THEN to_number(IAOCOUNT) ELSE 0 END ) f ,max(case when substr(SSPDESC,1,4) = '手机视频' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) f1 ,sum(case when substr(SSPDESC,1,4) = '新闻早晚' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) g,max(case when substr(SSPDESC,1,4) = '新闻早晚' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) g1 ,sum(case when substr(SSPDESC,1,4) = '集团行业' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) h,max(case when substr(SSPDESC,1,4) = '集团行业' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) h1 ,sum(case when substr(SSPDESC,1,4) = '广东网关' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) i,max(case when substr(SSPDESC,1,4) = '广东网关' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  ) i1 ,sum(case when substr(SSPDESC,1,4) = '1008' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) j,max(case when substr(SSPDESC,1,4) = '1008' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )j1 ,sum(case when substr(SSPDESC,1,4) = '移动手机' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END )k,max(case when substr(SSPDESC,1,4) = '移动手机' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )k1,sum(case when substr(SSPDESC,1,4) = '深圳奇迹' THEN  TO_NUMBER(IAOCOUNT) ELSE 0 END ) l,max(case when substr(SSPDESC,1,4) = '深圳奇迹' THEN TO_NUMBER(REPLACE(IMTRECVRATE, '%')) ELSE 0 END  )l1     
FROM ipmsdw.MMS_EXT_SH_SPRATE 
where  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  to_date(sdate,'YYYY-MM-DD HH24:mi:ss') < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 and SERVICE_IP in ('TD_SH_MMS_HW') group by  SDATE,SERVICE_IP)t order by sdate,SERVICE_IP 


--彩铃业务

select 
to_char(START_TIME,'yyyy-MM-dd') START_TIME,
MusicRingSetNum,MusicRingDownload,MusicRingUser,MusicRingSpaceRate,DISKUserRate,DBDISKUseRate    from ipmsdw.O_RE_ST_CLMH_D 
WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1  
union all select '合计' START_TIME, sum(MusicRingSetNum) MusicRingSetNum,sum(MusicRingDownload) MusicRingDownload, sum(MusicRingUser) MusicRingUser,avg(MusicRingSpaceRate) MusicRingSpaceRate, avg(DISKUserRate) DISKUserRate,avg(DBDISKUseRate) DBDISKUseRate   from ipmsdw.O_RE_ST_CLMH_D 
WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1 order by START_TIME 
----
select 
to_char(START_TIME,'yyyy-MM-dd') START_TIME,
MusicRingSetNum,MusicRingDownload,MusicRingUser,MusicRingSpaceRate,DISKUserRate,DBDISKUseRate    from ipmsdw.O_RE_ST_CLMH_D 
union all select '合计' START_TIME, sum(MusicRingSetNum) MusicRingSetNum,sum(MusicRingDownload) MusicRingDownload, sum(MusicRingUser) MusicRingUser,avg(MusicRingSpaceRate) MusicRingSpaceRate, avg(DISKUserRate) DISKUserRate,avg(DBDISKUseRate) DBDISKUseRate   from ipmsdw.O_RE_ST_CLMH_D 


--集团业务

select to_char(START_TIME,'yyyy-MM-dd') START_TIME,RegisterGroupNum,RegisterUserNum    from ipmsdw.O_RE_ST_JTZJ_D 
WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1   
union all select '合计' START_TIME, sum(RegisterGroupNum) RegisterGroupNum,sum(RegisterUserNum) RegisterUserNum    from ipmsdw.O_RE_ST_JTZJ_D 
WHERE  START_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1 order by START_TIME 

-----
select to_char(START_TIME,'yyyy-MM-dd') START_TIME,RegisterGroupNum,RegisterUserNum    from ipmsdw.O_RE_ST_JTZJ_D 
union all select '合计' START_TIME, sum(RegisterGroupNum) RegisterGroupNum,sum(RegisterUserNum) RegisterUserNum    from ipmsdw.O_RE_ST_JTZJ_D 



--企信通用户数

select to_char(STAT_TIME,'yyyy-MM-dd') START_TIME,MT_SUC,TOTAL,RATE RATE,USER_NUM   from ipmsdw.O_RE_ST_QXT_D 
WHERE  STAT_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  STAT_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1  
 union all select '合计' START_TIME, sum(MT_SUC) MT_SUC,sum(TOTAL) TOTAL,avg(RATE) RATE,sum(USER_NUM) USER_NUM     from ipmsdw.O_RE_ST_QXT_D 
WHERE  STAT_TIME >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  STAT_TIME < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1 order by START_TIME

-----
select to_char(STAT_TIME,'yyyy-MM-dd') START_TIME,MT_SUC,TOTAL,RATE RATE,USER_NUM   from ipmsdw.O_RE_ST_QXT_D 
 union all select '合计' START_TIME, sum(MT_SUC) MT_SUC,sum(TOTAL) TOTAL,avg(RATE) RATE,sum(USER_NUM) USER_NUM     from ipmsdw.O_RE_ST_QXT_D 



----dns


---DNS业务量统计报表
select  
to_char(DNSPA01,'yyyy-MM-dd') DNSPA01, DNSPA03  ,  DNSPA04, DNSPA05, DNSPA06, DNSPA07,DNSPA08,DNSPA09,DNSPA10,   CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA05/DNSPA09,2) END DNSPA11,   CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA04/DNSPA09,2) END DNSPA12,  ROUND(DNSPA13,2) DNSPA13  
from ipmsdw.BusinessData_DAY   
WHERE  DNSPA01 >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  DNSPA01 < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3') 
 union all 
 select '合计' DNSPA01, '---' DNSPA03,sum(DNSPA04) DNSPA04,sum(DNSPA05) DNSPA05,sum(DNSPA06) DNSPA06,sum(DNSPA07) DNSPA07,sum(DNSPA08) DNSPA08,sum(DNSPA09) DNSPA09,sum(DNSPA10) DNSPA10,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA05)/SUM(DNSPA09),2) END DNSPA11,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA04)/SUM(DNSPA09),2) END DNSPA12,avg(DNSPA13) DNSPA13 
  from ipmsdw.BusinessData_DAY  
   WHERE  DNSPA01 >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss') and  DNSPA01 < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
   and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3')  order by DNSPA01

-----

select  
to_char(DNSPA01,'yyyy-MM-dd') DNSPA01, DNSPA03  ,  DNSPA04, DNSPA05, DNSPA06, DNSPA07,DNSPA08,DNSPA09,DNSPA10,   CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA05/DNSPA09,2) END DNSPA11,   CASE WHEN DNSPA09=0 THEN 0 ELSE ROUND(100*DNSPA04/DNSPA09,2) END DNSPA12,  ROUND(DNSPA13,2) DNSPA13  
from ipmsdw.O_RE_ST_DNS_BUSINESS_5M  where 1=1
and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3') 
 union all 
select '合计' DNSPA01, '---' DNSPA03,sum(DNSPA04) DNSPA04,sum(DNSPA05) DNSPA05,sum(DNSPA06) DNSPA06,sum(DNSPA07) DNSPA07,sum(DNSPA08) DNSPA08,sum(DNSPA09) DNSPA09,sum(DNSPA10) DNSPA10,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA05)/SUM(DNSPA09),2) END DNSPA11,CASE WHEN SUM(DNSPA09)=0 THEN 0 ELSE  ROUND(100*SUM(DNSPA04)/SUM(DNSPA09),2) END DNSPA12,avg(DNSPA13) DNSPA13 
  from ipmsdw.O_RE_ST_DNS_BUSINESS_5M   where 1=1
and DNSPA03 in ('211.136.112.50','@ip1','@ip2','@ip3')  order by DNSPA01


select * from ipmsdw.O_RE_ST_DNS_BUSINESS_5M

--DNS业务量统计指标报表   ----找不到表  ppm_dns 

SELECT 
to_char(DNSPA01,'yyyy-MM-dd') DNSPA01,to_char(DNSPA01,'yyyy-MM-dd') DNSPA02,'--' as DNSPA03, SUM(DNSPA04) DNSPA04,  SUM(DNSPA05) DNSPA05,  SUM(DNSPA06) DNSPA06,  SUM(DNSPA07) DNSPA07,  SUM(DNSPA08) DNSPA08,  SUM(DNSPA09) DNSPA09,  to_char(SUM(DNSPA09)/24/3600,'999999.99') DNSPA10, to_char(round(SUM(DNSPA05)/SUM(DNSPA09)*100,0),'999999.99') AS DNSPA11, to_char(round(SUM(DNSPA04)/SUM(DNSPA09)*100,0),'999999.99') AS DNSPA12, to_char(AVG(DNSPA13),'999999.99') as DNSPA13  
FROM ipmsdw.ppm_dns 
WHERE DNSPA01 >=to_date('2016-07-13 00:00:00','yyyy-MM-dd hh24:mi:ss') and DNSPA01<to_date('2016-06-22 00:00:00','yyyy-MM-dd hh24:mi:ss')  GROUP BY to_char(DNSPA01,'yyyy-MM-dd') ORDER BY DNSPA01


--

--DNS重点域名解析统计报表
select 
to_char(DNSPB01,'yyyy-MM-dd') AS DNSPB01,DNSPB03,DNSPB04, DNSPB05, DNSPB06,DNSPB07,DNSPB08,DNSPB09,DNSPB10  
from ipmsdw.O_RE_ST_DNS_FOCUS_DNAME_5M  
WHERE  DNSPB01 >= to_date('2016-07-13 16:40:00','yyyy-MM-dd HH24:mi:ss')  and  DNSPB01 < to_date('2016-07-13 16:40:59','yyyy-MM-dd HH24:mi:ss') and  1= 1  
union all 
select '合计' AS DNSPB01,'---'DNSPB03,'---'DNSPB04,sum(DNSPB05) DNSPB05,sum(DNSPB06) DNSPB06,sum(DNSPB07) DNSPB07,avg(DNSPB08) DNSPB08,avg(DNSPB09)DNSPB09,avg(DNSPB10) DNSPB10 
from ipmsdw.O_RE_ST_DNS_FOCUS_DNAME_5M 
WHERE  DNSPB01 >= to_date('2016-07-13 00:00:00','yyyy-MM-dd HH24:mi:ss')  and  DNSPB01 < to_date('2016-07-13 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
order by DNSPB01,DNSPB03,DNSPB04 


---
select 
to_char(DNSPB01,'yyyy-MM-dd HH24:mi:ss') AS DNSPB01,DNSPB03,DNSPB04, DNSPB05, DNSPB06,DNSPB07,DNSPB08,DNSPB09,DNSPB10  
from ipmsdw.O_RE_ST_DNS_FOCUS_DNAME_5M   where 1=1
union all 
select '合计' AS DNSPB01,'---'DNSPB03,'---'DNSPB04,sum(DNSPB05) DNSPB05,sum(DNSPB06) DNSPB06,sum(DNSPB07) DNSPB07,avg(DNSPB08) DNSPB08,avg(DNSPB09)DNSPB09,avg(DNSPB10) DNSPB10 
from ipmsdw.O_RE_ST_DNS_FOCUS_DNAME_5M 


--DNS重点域名解析统计指标报表   ----找不到表  ppm_dns_domain 
SELECT to_char(DNSPB01,'yyyy-MM-dd HH24:mi:ss') DNSPB01,to_char(DNSPB02,'yyyy-MM-dd HH24:mi:ss') DNSPB02,DNSPB03,DNSPB04,  SUM(DNSPB05) DNSPB05,  SUM(DNSPB06) DNSPB06,  SUM(DNSPB07) DNSPB07,  SUM(DNSPB08) DNSPB08,  to_char(SUM(DNSPB06)/SUM(DNSPB05)*100,'999999.99') AS DNSPB09, to_char(AVG(DNSPB10),'999999.99') as DNSPB10  
FROM ipnet.ppm_dns_domain 
WHERE DNSPB01 >=to_date('2016-06-22 15:18:00','yyyy-MM-dd hh24:mi:ss') and DNSPB01<to_date('2016-06-22 18:18:00','yyyy-MM-dd hh24:mi:ss') 
GROUP BY to_char(DNSPB01,'yyyy-MM-dd HH24:mi:ss'),to_char(DNSPB02,'yyyy-MM-dd HH24:mi:ss'),DNSPB03,DNSPB04 ORDER BY DNSPB01




--


--DNS域名解析请求排行统计指标报表  ----找不到表   ppm_dns_domainname

SELECT to_char(DNSPC01,'yyyy-MM-dd HH24:mi:ss') DNSPC01,to_char(DNSPC02,'yyyy-MM-dd HH24:mi:ss') DNSPC02,DNSPC03,DNSPC04,  SUM(DNSPC05) DNSPC05,  SUM(DNSPC06) DNSPC06,  to_char(SUM(DNSPC05)/SUM(DNSPC06)*100,'999999.99') DNSPC07,  to_char(MAX(DNSPC08),'999999.99') AS DNSPC08  
FROM ipnet.ppm_dns_domainname  
WHERE DNSPC01 >=to_date('2016-06-22 15:19:00','yyyy-MM-dd hh24:mi:ss')  and DNSPC01<to_date('2016-06-22 18:19:00','yyyy-MM-dd hh24:mi:ss')  
GROUP BY to_char(DNSPC01,'yyyy-MM-dd HH24:mi:ss'),to_char(DNSPC02,'yyyy-MM-dd HH24:mi:ss'),DNSPC03,DNSPC04 
ORDER BY DNSPC01,DNSPC05 DESC
--



--DNS全网TOPN排名
select a.TIMEID/10000 as timeid,a.DOMAINNAME as st,c.DESTINATIONIP as ip,a.SUM_PART as req,round(a.sum_part*100.00/b.SUM_ALL,2) as total 
from  (select TIMEID,DOMAINNAME,sum(REQUEST_CNT) SUM_PART from ipmsdm.DM_DNSLOG_DOMAIN_TOPN_D group by TIMEID,DOMAINNAME) a,  
(select TIMEID,sum(REQUEST_CNT) SUM_ALL from ipmsdm.DM_DNSLOG_DOMAIN_TOPN_D group by TIMEID) b ,ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D c 
where a.TIMEID=b.TIMEID  and a.timeid=c.timeid and a.timeid = 201607170000  and a.DOMAINNAME=c.DOMAINNAME


select * from ipmsdm.DM_DNSLOG_DOMAIN_TOPN_D

select * from ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D


--分运营商解析TOPN排名
 select * from (select a.TIMEID/10000 as timeid,RANK() OVER (PARTITION BY a.SUPPLIER_NAME ORDER BY SUM_PART DESC) rnmm,a.SUPPLIER_NAME sn,a.DOMAINNAME as dn,c.DESTINATIONIP as ip,a.SUM_PART as req,round(a.sum_part*100.00/b.SUM_ALL,2)  as total 
 from  (select  TIMEID,DOMAINNAME,(case SUPPLIER_NAME when '电信' then '电信' when '铁通' then '铁通' when '移动' then '移动' when '联通' then '联通' when '未知' then '未知' else '其他' end) SUPPLIER_NAME, sum(REQUEST_CNT) as SUM_PART   
 from  ipmsdm.DM_DNSLOG_SN_TOPN_D 
 group by TIMEID,DOMAINNAME,SUPPLIER_NAME) a,   (select TIMEID,(case SUPPLIER_NAME when '电信' then '电信' when '铁通' then '铁通' when '移动' then '移动' when '联通' then '联通' when '未知' then '未知' else '其他' end)  SUPPLIER_NAME , sum(REQUEST_CNT) as SUM_ALL     
 from ipmsdm.DM_DNSLOG_SN_TOPN_D group by TIMEID,SUPPLIER_NAME) b, (select * from ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D where timeid=201608110000) c  where a.TIMEID=b.TIMEId  and a.timeid=c.timeid  and a.SUPPLIER_NAME=b.SUPPLIER_NAME and a.domainname=c.domainname  and a.timeid=201608110000) t where rnmm<=1000


select * from ipmsdm.DM_DNSLOG_SN_TOPN_D;
select * from ipmsdm.DW_DM_DNSLOG_DOMAIN_IP_D;

--解析次数统计详表
select TIMEID/10000 TIMEID,DG,DN1,DN2,IP,REQ,TOTAL from (select TIMEID,DG,DN1,DN2,IP,REQ,TOTAL from ipmsdm.DM_DNSLOG_DG2_D where timeid=201607170000) A
select * from ipmsdm.DM_DNSLOG_DG2_D


--流量TOPN域名统计报表



--短信业务

--互通网关统计指标组(N31)

select to_char(START_TIME,'yyyy-MM-dd') START_TIME,TELE_ID,TO_SM_SUBMIT_NUM,TO_SM_SUBMIT_SUC_NUM,TO_SM_SUBMIT_SUC_UTIL,RETN_STATE_NUM,RETN_STATE_SUC_NUM,RETN_STATE_SUC_UTIL,SM_SUBMIT_NUM,SM_SUBMIT_SUC_NUM,SM_SUBMIT_SUC_UTIL,TO_RETN_STATE_NUM,TO_RETN_STATE_SUC_NUM,SM_SEND_SUC_UTIL 
from ipmsdw.O_RE_ST_HLHTWG_02_5M 
WHERE START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1  
union all select '合计' START_TIME, '--' TELE_ID,sum(TO_SM_SUBMIT_NUM),sum(TO_SM_SUBMIT_SUC_NUM),avg(TO_SM_SUBMIT_SUC_UTIL),sum(RETN_STATE_NUM),sum(RETN_STATE_SUC_NUM),avg(RETN_STATE_SUC_UTIL),sum(SM_SUBMIT_NUM),sum(SM_SUBMIT_SUC_NUM),avg(SM_SUBMIT_SUC_UTIL),sum(TO_RETN_STATE_NUM),sum(TO_RETN_STATE_SUC_NUM),avg(SM_SEND_SUC_UTIL) 
from ipmsdw.O_RE_ST_HLHTWG_02_5M 
WHERE START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 order by START_TIME


---  
select to_char(START_TIME,'yyyy-MM-dd') START_TIME,TELE_ID,TO_SM_SUBMIT_NUM,TO_SM_SUBMIT_SUC_NUM,TO_SM_SUBMIT_SUC_UTIL,RETN_STATE_NUM,RETN_STATE_SUC_NUM,RETN_STATE_SUC_UTIL,SM_SUBMIT_NUM,SM_SUBMIT_SUC_NUM,SM_SUBMIT_SUC_UTIL,TO_RETN_STATE_NUM,TO_RETN_STATE_SUC_NUM,SM_SEND_SUC_UTIL 
from ipmsdw.O_RE_ST_HLHTWG_02_5M       
union all select '合计' START_TIME, '--' TELE_ID,sum(TO_SM_SUBMIT_NUM),sum(TO_SM_SUBMIT_SUC_NUM),avg(TO_SM_SUBMIT_SUC_UTIL),sum(RETN_STATE_NUM),sum(RETN_STATE_SUC_NUM),avg(RETN_STATE_SUC_UTIL),sum(SM_SUBMIT_NUM),sum(SM_SUBMIT_SUC_NUM),avg(SM_SUBMIT_SUC_UTIL),sum(TO_RETN_STATE_NUM),sum(TO_RETN_STATE_SUC_NUM),avg(SM_SEND_SUC_UTIL) 
from ipmsdw.O_RE_ST_HLHTWG_02_5M 

select * from ipmsdw.O_RE_ST_HLHTWG_02_5M 

--SP流量指标组_接入网关(N31)
select to_char(START_TIME,'yyyy-MM-dd') START_TIME,SP_NAME,SP_CODE,SP_SERV_CODE,SP_ACCESS_ADDR,sum(CDGW_SEND_SP_MO_NUM),sum(CDGW_SEND_SP_MO_SUC_NUM),sum(CDGW_SEND_SP_MO_FAIL_NUM),avg(CDGW_SEND_SP_MO_SUC_UTIL),sum(SP_SEND_CDGW_MT_NUM),sum(CDGW_RET_SP_RESP_SUC_NUM),sum(CDGW_RET_SP_RESP_FAIL_NUM),avg(SP_COMM_MT_SUC_UTIL),sum(CDGW_TRANS_SP_STATE_NUM),sum(ISMG_TRANS_SP_SUCC_STATE_NUM),sum(ISMG_TRANS_SP_FAIL_STATE_NUM),avg(MT_STATE_RTN_RATIO),avg(MT_SUCC_RATIO) 
from  ipmsdw.O_RE_ST_JRWG_N31_03_5M 
where  START_TIME >= to_date('2016-06-15 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-15 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
group by to_char(START_TIME,'yyyy-MM-dd'),SP_NAME,SP_CODE,SP_SERV_CODE,SP_ACCESS_ADDR 
union all select '合计' START_TIME,'--' SP_NAME,'--' SP_CODE,'--' SP_SERV_CODE,'--' SP_ACCESS_ADDR,sum(CDGW_SEND_SP_MO_NUM),sum(CDGW_SEND_SP_MO_SUC_NUM),sum(CDGW_SEND_SP_MO_FAIL_NUM),avg(CDGW_SEND_SP_MO_SUC_UTIL),sum(SP_SEND_CDGW_MT_NUM),sum(CDGW_RET_SP_RESP_SUC_NUM),sum(CDGW_RET_SP_RESP_FAIL_NUM),avg(SP_COMM_MT_SUC_UTIL),sum(CDGW_TRANS_SP_STATE_NUM),sum(ISMG_TRANS_SP_SUCC_STATE_NUM),sum(ISMG_TRANS_SP_FAIL_STATE_NUM),avg(MT_STATE_RTN_RATIO),avg(MT_SUCC_RATIO) 
from  ipmsdw.O_RE_ST_JRWG_N31_03_5M 
where  START_TIME >= to_date('2016-06-15 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-15 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 order by START_TIME

--

select to_char(START_TIME,'yyyy-MM-dd hh24:mi') START_TIME,SP_NAME,SP_CODE,SP_SERV_CODE,SP_ACCESS_ADDR,sum(CDGW_SEND_SP_MO_NUM),sum(CDGW_SEND_SP_MO_SUC_NUM),sum(CDGW_SEND_SP_MO_FAIL_NUM),avg(CDGW_SEND_SP_MO_SUC_UTIL),sum(SP_SEND_CDGW_MT_NUM),sum(CDGW_RET_SP_RESP_SUC_NUM),sum(CDGW_RET_SP_RESP_FAIL_NUM),avg(SP_COMM_MT_SUC_UTIL),sum(CDGW_TRANS_SP_STATE_NUM),sum(ISMG_TRANS_SP_SUCC_STATE_NUM),sum(ISMG_TRANS_SP_FAIL_STATE_NUM),avg(MT_STATE_RTN_RATIO),avg(MT_SUCC_RATIO) 
from  ipmsdw.O_RE_ST_JRWG_N31_03_5M 
group by to_char(START_TIME,'yyyy-MM-dd hh24:mi'),SP_NAME,SP_CODE,SP_SERV_CODE,SP_ACCESS_ADDR 
union all select '合计' START_TIME,'--' SP_NAME,'--' SP_CODE,'--' SP_SERV_CODE,'--' SP_ACCESS_ADDR,sum(CDGW_SEND_SP_MO_NUM),sum(CDGW_SEND_SP_MO_SUC_NUM),sum(CDGW_SEND_SP_MO_FAIL_NUM),avg(CDGW_SEND_SP_MO_SUC_UTIL),sum(SP_SEND_CDGW_MT_NUM),sum(CDGW_RET_SP_RESP_SUC_NUM),sum(CDGW_RET_SP_RESP_FAIL_NUM),avg(SP_COMM_MT_SUC_UTIL),sum(CDGW_TRANS_SP_STATE_NUM),sum(ISMG_TRANS_SP_SUCC_STATE_NUM),sum(ISMG_TRANS_SP_FAIL_STATE_NUM),avg(MT_STATE_RTN_RATIO),avg(MT_SUCC_RATIO) 
from  ipmsdw.O_RE_ST_JRWG_N31_03_5M 



select * from ipmsdw.O_RE_ST_JRWG_N31_03_5M 

--网关间前转流量统计指标组(N31)
select to_char(START_TIME,'yyyy-MM-dd') START_TIME,GW_CODE,MT_FWD_NUM,MT_FWD_SUC_NUM,MT_FWD_FAIL_NUM,MT_FWD_SUC_RATIO,MO_FWD_NUM,MO_FWD_SUC_NUM,MO_FWD_FAIL_NUM,MO_FWD_SUC_RATIO,RCV_MT_FWD_NUM,RCV_MT_FWD_SUC_NUM,RCV_MT_FWD_FAIL_NUM,RCV_MT_FWD_SUC_RATIO,RCV_MO_FWD_NUM,RCV_MO_FWD_SUC_NUM,RCV_MO_FWD_FAIL_NUM,RCV_MO_FWD_SUC_RATIO from ipmsdw.O_RE_ST_MWWG_N31_05_5M where  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 union all select '合计' START_TIME,'--'GW_CODE,sum(MT_FWD_NUM) MT_FWD_NUM,sum(MT_FWD_SUC_NUM) MT_FWD_SUC_NUM,sum(MT_FWD_FAIL_NUM) MT_FWD_FAIL_NUM,avg(MT_FWD_SUC_RATIO) MT_FWD_SUC_RATIO,sum(MO_FWD_NUM) MO_FWD_NUM,sum(MO_FWD_SUC_NUM) MO_FWD_SUC_NUM,sum(MO_FWD_FAIL_NUM) MO_FWD_FAIL_NUM,avg(MO_FWD_SUC_RATIO) MO_FWD_SUC_RATIO,sum(RCV_MT_FWD_NUM) RCV_MT_FWD_NUM,sum(RCV_MT_FWD_SUC_NUM) RCV_MT_FWD_SUC_NUM,sum(RCV_MT_FWD_FAIL_NUM)RCV_MT_FWD_FAIL_NUM,avg(RCV_MT_FWD_SUC_RATIO) RCV_MT_FWD_SUC_RATIO,sum(RCV_MO_FWD_NUM) RCV_MO_FWD_NUM,sum(RCV_MO_FWD_SUC_NUM) RCV_MO_FWD_SUC_NUM,sum(RCV_MO_FWD_FAIL_NUM) RCV_MO_FWD_FAIL_NUM,avg(RCV_MO_FWD_SUC_RATIO) RCV_MO_FWD_SUC_RATIO 
from ipmsdw.O_RE_ST_MWWG_N31_05_5M 
where  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 
order by START_TIME,GW_CODE

--
select to_char(START_TIME,'yyyy-MM-dd') START_TIME,GW_CODE,MT_FWD_NUM,MT_FWD_SUC_NUM,MT_FWD_FAIL_NUM,MT_FWD_SUC_RATIO,MO_FWD_NUM,MO_FWD_SUC_NUM,MO_FWD_FAIL_NUM,MO_FWD_SUC_RATIO,RCV_MT_FWD_NUM,RCV_MT_FWD_SUC_NUM,RCV_MT_FWD_FAIL_NUM,RCV_MT_FWD_SUC_RATIO,RCV_MO_FWD_NUM,RCV_MO_FWD_SUC_NUM,RCV_MO_FWD_FAIL_NUM,RCV_MO_FWD_SUC_RATIO from ipmsdw.O_RE_ST_MWWG_N31_05_5M where  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and  1= 1 union all select '合计' START_TIME,'--'GW_CODE,sum(MT_FWD_NUM) MT_FWD_NUM,sum(MT_FWD_SUC_NUM) MT_FWD_SUC_NUM,sum(MT_FWD_FAIL_NUM) MT_FWD_FAIL_NUM,avg(MT_FWD_SUC_RATIO) MT_FWD_SUC_RATIO,sum(MO_FWD_NUM) MO_FWD_NUM,sum(MO_FWD_SUC_NUM) MO_FWD_SUC_NUM,sum(MO_FWD_FAIL_NUM) MO_FWD_FAIL_NUM,avg(MO_FWD_SUC_RATIO) MO_FWD_SUC_RATIO,sum(RCV_MT_FWD_NUM) RCV_MT_FWD_NUM,sum(RCV_MT_FWD_SUC_NUM) RCV_MT_FWD_SUC_NUM,sum(RCV_MT_FWD_FAIL_NUM)RCV_MT_FWD_FAIL_NUM,avg(RCV_MT_FWD_SUC_RATIO) RCV_MT_FWD_SUC_RATIO,sum(RCV_MO_FWD_NUM) RCV_MO_FWD_NUM,sum(RCV_MO_FWD_SUC_NUM) RCV_MO_FWD_SUC_NUM,sum(RCV_MO_FWD_FAIL_NUM) RCV_MO_FWD_FAIL_NUM,avg(RCV_MO_FWD_SUC_RATIO) RCV_MO_FWD_SUC_RATIO 
from ipmsdw.O_RE_ST_MWWG_N31_05_5M 
order by START_TIME,GW_CODE

select * from ipmsdw.O_RE_ST_MWWG_N31_05_5M 


--MISC鉴权批价性能统计报表
select to_char(START_TIME,'yyyy-MM-dd') START_TIME, MISCAUTHPRICERECIEVED,  MISCAUTHPRICESUCCESS,  MISCAUTHPRICEFAIL,  case when MISCAUTHPRICERECIEVED=0 then 0 else ROUND(100*MISCAUTHPRICESUCCESS / MISCAUTHPRICERECIEVED,3) end MISCAUTHPRICERATE ,  MISCTOTALINMMSAUTHREQ,  MISCTOTALINMMSAUTHREQSUC,  MISCTOTALINMMSAUTHREQBUSSSUC,  case when MISCTOTALINMMSAUTHREQ=0 then 0 else ROUND(100*MISCTOTALINMMSAUTHREQSUC / MISCTOTALINMMSAUTHREQ,2) end MISCTOTALINMMSAUTHREQRATE,  case when MISCTOTALINMMSAUTHREQ=0 then 0 else ROUND(100*MISCTOTALINMMSAUTHREQBUSSSUC / MISCTOTALINMMSAUTHREQ,2) end MISCTOTALINMMSAUTHREQBUSSRATE   from ipnet.MISCPERFORMANCE_DAY WHERE  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1   union all select '合计' START_TIME, SUM(MISCAUTHPRICERECIEVED)MISCAUTHPRICERECIEVED,  SUM(MISCAUTHPRICESUCCESS)MISCAUTHPRICESUCCESS,  SUM(MISCAUTHPRICEFAIL)MISCAUTHPRICEFAIL,  case when SUM(MISCAUTHPRICERECIEVED)=0 then 0 else ROUND(100*sum(MISCAUTHPRICESUCCESS) / sum(MISCAUTHPRICERECIEVED),3) end MISCAUTHPRICERATE ,  SUM(MISCTOTALINMMSAUTHREQ)MISCTOTALINMMSAUTHREQ,  SUM(MISCTOTALINMMSAUTHREQSUC)MISCTOTALINMMSAUTHREQSUC,  SUM(MISCTOTALINMMSAUTHREQBUSSSUC)MISCTOTALINMMSAUTHREQBUSSSUC,  case when SUM(MISCTOTALINMMSAUTHREQ)=0 then 0 else ROUND(100*SUM(MISCTOTALINMMSAUTHREQSUC) / SUM(MISCTOTALINMMSAUTHREQ),2) end MISCTOTALINMMSAUTHREQRATE,  case when SUM(MISCTOTALINMMSAUTHREQ)=0 then 0 else ROUND(100*SUM(MISCTOTALINMMSAUTHREQBUSSSUC) / SUM(MISCTOTALINMMSAUTHREQ),2) end MISCTOTALINMMSAUTHREQBUSSRATE  from ipnet.MISCPERFORMANCE_DAY WHERE  START_TIME >= to_date('2016-06-21 00:00:00','yyyy-MM-dd HH24:mi:ss') and  START_TIME < to_date('2016-06-21 23:59:59','yyyy-MM-dd HH24:mi:ss') and   1= 1 order by START_TIME 
--

--总表
select * from IPMSDW.O_RM_DEVICE

select * from IPMSDW.O_RM_INTERFACE

--报表订阅的sql表
select * from rm.email_sql_info;

--

select CITY from IPMSDW.O_RM_DEVICE

select CITY,SERVICE from IPMSDW.O_RM_INTERFACE

select * from nhm.dbo.V_Simplified_Device


--MR覆盖率汇总表
select * from IPMSDM.DM_MR_RE_BA_4G_COVER_RT_CNT_D

--MR覆盖率小区详情

select * from IPMSDM.DM_MR_RE_BA_4G_COVER_RT_LIST_D;



select * from ipmsdm.DM_DNSLOG_UG2_D
select * from ipmsdm.DM_DNSLOG_UG_D
