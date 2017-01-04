

<select id="tableChooseSE">
    <if test=" '@timeType'=='min' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_15M</if>
    <if test=" '@timeType'=='hour' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_H</if>
    <if test=" '@timeType'=='day' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_D</if>
    <if test=" '@timeType'=='week' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_W</if>
    <if test=" '@timeType'=='month' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_M</if>
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
     from <included id="tableChooseSE"/> where 1=1 

	 
       <if test=" '@isContinue'=='t' ">
           and TIME_ID between to_number(#startTime#) and to_number(#endTime#)
       </if>
       <if test=" '@isContinue'=='f' ">
           and TIME_ID in (#discteteTime#)
       </if> 
<isNotEmpty property="qry_0">
    and USER_LABEL like '%$qry_0$%'
  </isNotEmpty>




  <select id="tableChooseSE">
      <if test=" '@timeType'=='min' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_15M</if>
      <if test=" '@timeType'=='hour' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_H</if>
      <if test=" '@timeType'=='day' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_D</if>
      <if test=" '@timeType'=='week' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_W</if>
      <if test=" '@timeType'=='month' ">ipmsdm.DM_VOLTE_RE_NE_EMSC_M</if>
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
  union all select '合计' TIME_ID,
  '--' USER_LABEL,
  sum(KPI_001 ),
  sum(KPI_002),
  sum(KPI_003),
  avg(KPI_004),
  sum(KPI_005),
  avg(KPI_006),
  sum(KPI_007),
  avg(KPI_008),
  sum(KPI_009),
  avg(KPI_010)

